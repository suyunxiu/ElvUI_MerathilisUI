local MER, E, L, V, P, G = unpack(select(2, ...))
local module = MER:GetModule('MER_RaidCD')

--Cache global variables
--Lua functions
local _G = _G
local pairs, select, tostring = pairs, select, tostring
local band = bit.band
local format = string.format
local floor = math.floor
local tinsert, tsort, tremove = table.insert, table.sort, table.remove
--WoW API / Variables
local CombatLogGetCurrentEventInfo = CombatLogGetCurrentEventInfo
local CreateFrame = CreateFrame
local GetSpellCharges = GetSpellCharges
local GetSpellInfo = GetSpellInfo
local GetSpellLink = GetSpellLink
local GetTime = GetTime
local IsEveryoneAssistant = IsEveryoneAssistant
local IsInGroup = IsInGroup
local IsInInstance = IsInInstance
local IsInRaid = IsInRaid
local SendChatMessage = SendChatMessage
local SlashCmdList = SlashCmdList
local UnitClass = UnitClass
local UnitIsGroupAssistant = UnitIsGroupAssistant
local UnitIsGroupLeader = UnitIsGroupLeader
local UnitName = UnitName
-- GLOBALS:

module.Spells = {
	-- Battle resurrection
	[20484] = 600,	-- Rebirth
	[61999] = 600,	-- Raise Ally
	[20707] = 600,	-- Soulstone
	-- Heroism
	[32182] = 300,	-- Heroism
	[2825] = 300,	-- Bloodlust
	[80353] = 300,	-- Time Warp
	[264667] = 300,	-- Primal Rage [Hunter's pet]
	-- Healing
	[633] = 600,	-- Lay on Hands
	[740] = 180,	-- Tranquility
	[115310] = 180,	-- Revival
	[64843] = 180,	-- Divine Hymn
	[108280] = 180,	-- Healing Tide Totem
	[15286] = 180,	-- Vampiric Embrace
	[108281] = 120,	-- Ancestral Guidance
	-- Defense
	[62618] = 180,	-- Power Word: Barrier
	[33206] = 180,	-- Pain Suppression
	[47788] = 180,	-- Guardian Spirit
	[31821] = 180,	-- Aura Mastery
	[98008] = 180,	-- Spirit Link Totem
	[97462] = 180,	-- Rallying Cry
	[88611] = 180,	-- Smoke Bomb
	[51052] = 120,	-- Anti-Magic Zone
	[116849] = 120,	-- Life Cocoon
	[6940] = 120,	-- Blessing of Sacrifice
	[114030] = 120,	-- Vigilance
	[102342] = 60,	-- Ironbark
	-- Other
	[106898] = 120,	-- Stampeding Roar
}

local _, type = IsInInstance();

local filter = _G.COMBATLOG_OBJECT_AFFILIATION_RAID + _G.COMBATLOG_OBJECT_AFFILIATION_PARTY + _G.COMBATLOG_OBJECT_AFFILIATION_MINE
local currentNumResses = 0
local charges = nil
local inBossCombat = nil
local timer = 0
local Ressesbars = {}
local bars = {}

local function CheckChat(warning)
	if IsInGroup(_G.LE_PARTY_CATEGORY_INSTANCE) then
		return "INSTANCE_CHAT"
	elseif IsInRaid(_G.LE_PARTY_CATEGORY_HOME) then
		if warning and (UnitIsGroupLeader("player") or UnitIsGroupAssistant("player") or IsEveryoneAssistant()) then
			return "RAID_WARNING"
		else
			return "RAID"
		end
	elseif IsInGroup(_G.LE_PARTY_CATEGORY_HOME) then
		return "PARTY"
	end
	return "SAY"
end

local RaidCDAnchor = CreateFrame("Frame", "RaidCDAnchor", E.UIParent)

local function FormatTime(time)
	if time >= 60 then
		return format("%.2d:%.2d", floor(time / 60), time % 60)
	else
		return format("%.2d", time)
	end
end

local function sortByExpiration(a, b)
	return a.endTime > b.endTime
end

local function UpdatePositions()
	if charges and Ressesbars[1] then
		Ressesbars[1]:Point("TOPRIGHT", RaidCDAnchor, "TOPRIGHT", 0, 0)
		Ressesbars[1].id = 1
		for i = 1, #bars do
			bars[i]:ClearAllPoints()
			if i == 1 then
				if module.db.upwards == true then
					bars[i]:Point("BOTTOMRIGHT", Ressesbars[1], "TOPRIGHT", 0, 13)
				else
					bars[i]:Point("TOPRIGHT", Ressesbars[1], "BOTTOMRIGHT", 0, -13)
				end
			else
				if module.db.upwards == true then
					bars[i]:Point("BOTTOMRIGHT", bars[i-1], "TOPRIGHT", 0, 13)
				else
					bars[i]:Point("TOPRIGHT", bars[i-1], "BOTTOMRIGHT", 0, -13)
				end
			end
			bars[i].id = i
		end
	else
		for i = 1, #bars do
			bars[i]:ClearAllPoints()
			if i == 1 then
				bars[i]:Point("TOPRIGHT", RaidCDAnchor, "TOPRIGHT", 0, 0)
			else
				if module.db.upwards == true then
					bars[i]:Point("BOTTOMRIGHT", bars[i-1], "TOPRIGHT", 0, 13)
				else
					bars[i]:Point("TOPRIGHT", bars[i-1], "BOTTOMRIGHT", 0, -13)
				end
			end
			bars[i].id = i
		end
	end
end

local function StopTimer(bar)
	bar:SetScript("OnUpdate", nil)
	bar:Hide()
	if bar.isResses then
		tremove(Ressesbars, bar.id)
	else
		tremove(bars, bar.id)
	end
	UpdatePositions()
end

local function UpdateCharges(bar)
	local curCharges, maxCharges, start, duration = GetSpellCharges(20484)
	if curCharges == maxCharges then
		bar.startTime = 0
		bar.endTime = GetTime()
	else
		bar.startTime = start
		bar.endTime = start + duration
	end
	if curCharges ~= currentNumResses then
		currentNumResses = curCharges
		bar.left:SetText(bar.name.." : "..currentNumResses)
	end
end

local function BarUpdate(self, elapsed)
	local curTime = GetTime()
	if self.endTime < curTime then
		if self.isResses then
			UpdateCharges(self)
		else
			StopTimer(self)
			return
		end
	end
	self:SetValue(100 - (curTime - self.startTime) / (self.endTime - self.startTime) * 100)
	self.right:SetText(FormatTime(self.endTime - curTime))
end

local function OnEnter(self)
	_G.GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	_G.GameTooltip:SetSpellByID(self.spellId)
	_G.GameTooltip:AddLine(" ")
	_G.GameTooltip:AddDoubleLine(self.left:GetText(), self.right:GetText())
	_G.GameTooltip:SetClampedToScreen(true)
	_G.GameTooltip:Show()
end

local function OnLeave(self)
	_G.GameTooltip:Hide()
end

local function OnMouseDown(self, button)
	if button == "LeftButton" then
		if self.isResses then
			SendChatMessage(format(L["Battle Resurrection: "].."%d, "..L["Next time: "].."%s.", currentNumResses, self.right:GetText()), CheckChat())
		else
			SendChatMessage(format(L["CD: "].."%s - %s: %s", self.name, GetSpellLink(self.spellId), self.right:GetText()), CheckChat())
		end
	elseif button == "RightButton" then
		StopTimer(self)
	end
end

local function CreateBar()
	local db = E.db.mui.raidCD

	local bar = CreateFrame("Statusbar", nil, E.UIParent)
	bar:SetFrameStrata("MEDIUM")
	if db.show_icon == true then
		bar:Size(db.width, db.height)
	else
		bar:Size(db.width + 28, db.height)
	end
	bar:SetStatusBarTexture(E.media.normTex)
	bar:SetMinMaxValues(0, 100)
	bar:CreateBackdrop()

	bar.bg = bar:CreateTexture(nil, "BACKGROUND")
	bar.bg:SetAllPoints(bar)
	bar.bg:SetTexture(E.media.normTex)

	bar.left = bar:CreateFontString(nil, "OVERLAY")
	bar.left:FontTemplate(E.Libs.LSM:Fetch("font", db.text.font), db.text.fontSize, db.text.fontOutline)
	bar.left:Point("LEFT", 2, 0)
	bar.left:SetJustifyH("LEFT")
	bar.left:Size(db.width - 30, db.text.fontSize)

	bar.right = bar:CreateFontString(nil, "OVERLAY")
	bar.right:FontTemplate(E.Libs.LSM:Fetch("font", db.text.font), db.text.fontSize, db.text.fontOutline)
	bar.right:Point("RIGHT", 1, 0)
	bar.right:SetJustifyH("RIGHT")

	if db.show_icon == true then
		bar.icon = CreateFrame("Button", nil, bar)
		bar.icon:SetWidth(bar:GetHeight() + 6)
		bar.icon:SetHeight(bar.icon:GetWidth())
		bar.icon:Point("BOTTOMRIGHT", bar, "BOTTOMLEFT", -7, 0)
		bar.icon:CreateBackdrop()
	end

	return bar
end

local function StartTimer(name, spellId)
	local spell, _, icon = GetSpellInfo(spellId)
	if charges and spellId == 20484 then
		for _, v in pairs(Ressesbars) do
			UpdateCharges(v)
			return
		end
	end

	for _, v in pairs(bars) do
		if v.name == name and v.spell == spell then
			StopTimer(v)
		end
	end

	local bar = CreateBar()
	local color = E:ClassColor(select(2, UnitClass(name)))

	if charges and spellId == 20484 then
		local curCharges, _, start, duration = GetSpellCharges(20484)
		currentNumResses = curCharges
		bar.startTime = start
		bar.endTime = start + duration
		bar.left:SetText(name.." : "..curCharges)
		bar.right:SetText(FormatTime(duration))
		bar.isResses = true
		bar.name = name
		bar.spell = spell
		bar.spellId = spellId

		if module.db.show_icon == true then
			bar.icon:SetNormalTexture(icon)
			bar.icon:GetNormalTexture():SetTexCoord(0.1, 0.9, 0.1, 0.9)
		end
		bar:Show()

		if color then
			bar:SetStatusBarColor(color.r, color.g, color.b)
			bar.bg:SetVertexColor(color.r, color.g, color.b, 0.2)
		else
			bar:SetStatusBarColor(0.3, 0.7, 0.3)
			bar.bg:SetVertexColor(0.3, 0.7, 0.3, 0.2)
		end

		bar:SetScript("OnUpdate", BarUpdate)
		bar:EnableMouse(true)
		bar:SetScript("OnEnter", OnEnter)
		bar:SetScript("OnLeave", OnLeave)
		bar:SetScript("OnMouseDown", OnMouseDown)
		tinsert(Ressesbars, bar)

		if module.db.expiration == true then
			tsort(Ressesbars, sortByExpiration)
		end
	else
		bar.startTime = GetTime()
		bar.endTime = GetTime() + module.Spells[spellId]
		bar.left:SetText(format("%s - %s", name:gsub("%-[^|]+", ""), spell))
		bar.right:SetText(FormatTime(module.Spells[spellId]))
		bar.isResses = false
		bar.name = name
		bar.spell = spell
		bar.spellId = spellId

		if module.db.show_icon == true then
			bar.icon:SetNormalTexture(icon)
			bar.icon:GetNormalTexture():SetTexCoord(0.1, 0.9, 0.1, 0.9)
		end
		bar:Show()

		if color then
			bar:SetStatusBarColor(color.r, color.g, color.b)
			bar.bg:SetVertexColor(color.r, color.g, color.b, 0.2)
		else
			bar:SetStatusBarColor(0.3, 0.7, 0.3)
			bar.bg:SetVertexColor(0.3, 0.7, 0.3, 0.2)
		end

		bar:SetScript("OnUpdate", BarUpdate)
		bar:EnableMouse(true)
		bar:SetScript("OnEnter", OnEnter)
		bar:SetScript("OnLeave", OnLeave)
		bar:SetScript("OnMouseDown", OnMouseDown)
		tinsert(bars, bar)

		if module.db.expiration == true then
			tsort(bars, sortByExpiration)
		end
	end

	UpdatePositions()
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
f:RegisterEvent("ZONE_CHANGED_NEW_AREA")
f:RegisterEvent("ENCOUNTER_END")
f:SetScript("OnEvent", function(self, event)
	if E.db.mui.raidCD.enable ~= true then return end

	if event == "PLAYER_ENTERING_WORLD" or event == "ZONE_CHANGED_NEW_AREA" then
		if select(2, IsInInstance()) == "raid" and IsInGroup() then
			self:RegisterEvent("SPELL_UPDATE_CHARGES")
		else
			self:UnregisterEvent("SPELL_UPDATE_CHARGES")
			charges = nil
			inBossCombat = nil
			currentNumResses = 0
			Ressesbars = {}
		end
	end
	if event == "SPELL_UPDATE_CHARGES" then
		charges = GetSpellCharges(20484)
		if charges then
			if not inBossCombat then
				inBossCombat = true
			end
			StartTimer(L["BattleRes"], 20484)
		elseif not charges and inBossCombat then
			inBossCombat = nil
			currentNumResses = 0
			for _, v in pairs(Ressesbars) do
				StopTimer(v)
			end
		end
	end
	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
		local _, eventType, _, _, sourceName, sourceFlags = CombatLogGetCurrentEventInfo()
		if band(sourceFlags, filter) == 0 then return end
		if eventType == "SPELL_RESURRECT" or eventType == "SPELL_CAST_SUCCESS" or eventType == "SPELL_AURA_APPLIED" then
			local spellId = select(12, CombatLogGetCurrentEventInfo())
			if sourceName then
				sourceName = sourceName:gsub("-.+", "")
			else
				return
			end
			if module.Spells[spellId] and IsInGroup() and ((module.db.show_inraid and type == "raid") or (module.db.show_inparty and type == "party") or (module.db.show_inarena and type == "arena")) then
				if (sourceName == UnitName("player") and module.db.show_self == true) or sourceName ~= UnitName("player") then
					StartTimer(sourceName, spellId)
				end
			end
		end
	elseif event == "ZONE_CHANGED_NEW_AREA" and select(2, IsInInstance()) == "arena" or not IsInGroup() then
		for _, v in pairs(Ressesbars) do
			StopTimer(v)
		end
		for _, v in pairs(bars) do
			v.endTime = 0
		end
	elseif event == "ENCOUNTER_END" and select(2, IsInInstance()) == "raid" then
		for _, v in pairs(bars) do
			v.endTime = 0
		end
	end
end)

function module:Initialize()
	module.db = E.db.mui.raidCD
	MER:RegisterDB(self, "raidCD")

	if module.db.enable ~= true then return end

	for spell in pairs(module.Spells) do
		local name = GetSpellInfo(spell)
		if not name then
			MER:Print("|cffff0000WARNING: spell ID ["..tostring(spell).."] no longer exists! Please report this on my Discord.|r")
		end
	end

	RaidCDAnchor:Point("TOPLEFT", E.UIParent, "TOPLEFT", 3, -100)
	if module.db.show_icon == true then
		RaidCDAnchor:Size(module.db.width + 32, module.db.height + 10)
	else
		RaidCDAnchor:Size(module.db.width + 32, module.db.height + 4)
	end
	E:CreateMover(RaidCDAnchor, "MER_RaidCDMover", L["Raid Cooldown"], nil, nil, nil, 'ALL,RAID,PARTY,ARENA,MERATHILISUI', nil, "mui,modules,cooldowns,raid")

	_G.SLASH_RaidCD1 = "/testrcd"
	_G.SLASH_RaidCD2 = "/trcd"
	SlashCmdList["RaidCD"] = function()
		StartTimer(UnitName("player"), 20484)	-- Rebirth
		StartTimer(UnitName("player"), 20707)	-- Soulstone
		StartTimer(UnitName("player"), 108280)	-- Healing Tide Totem
	end
end

MER:RegisterModule(module:GetName())
