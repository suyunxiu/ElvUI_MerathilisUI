local MER, E, L, V, P, G = unpack(select(2, ...))
local MERL = MER:NewModule("mUILayout", "AceHook-3.0", "AceEvent-3.0")
local CH = E:GetModule("Chat")
local DT = E:GetModule("DataTexts")
local LO = E:GetModule("Layout")

--Cache global variables
--Lua functions
local _G = _G
local unpack = unpack
--WoW API / Variables
local CreateFrame = CreateFrame
local InCombatLockdown = InCombatLockdown
local GameTooltip = _G["GameTooltip"]
local PlaySound = PlaySound
local SOUNDKIT = SOUNDKIT
local hooksecurefunc = hooksecurefunc
-- GLOBALS:

function MERL:CreateChatButtons()
	if E.db.mui.chat.chatButton ~= true or E.private.chat.enable ~= true then return end

	-- Maybe add option to adjust how much the chat panel expands
	E.db.mui.chat.expandPanel = 150
	E.db.mui.chat.panelHeight = E.db.mui.chat.panelHeight or E.db.chat.panelHeight

	local panelBackdrop = E.db.chat.panelBackdrop
	local ChatButton = CreateFrame("Frame", "mUIChatButton", _G["LeftChatPanel"].backdrop)
	ChatButton:ClearAllPoints()
	ChatButton:SetPoint("TOPLEFT", _G["LeftChatPanel"].backdrop, "TOPLEFT", 4, -8)
	ChatButton:Size(13, 13)
	if E.db.chat.panelBackdrop == "HIDEBOTH" or E.db.chat.panelBackdrop == "LEFT" then
		ChatButton:SetAlpha(0)
	else
		ChatButton:SetAlpha(0.55)
	end
	ChatButton:SetFrameLevel(_G["LeftChatPanel"]:GetFrameLevel() + 5)

	ChatButton.tex = ChatButton:CreateTexture(nil, "OVERLAY")
	ChatButton.tex:SetInside()
	ChatButton.tex:SetTexture("Interface\\AddOns\\ElvUI_MerathilisUI\\media\\textures\\chatButton")

	ChatButton:SetScript("OnMouseUp", function (self, btn)
		if InCombatLockdown() then return end
		if btn == "LeftButton" then
			if E.db.mui.chat.isExpanded then
				E.db.chat.panelHeight = E.db.chat.panelHeight - E.db.mui.chat.expandPanel
				CH:PositionChat(true)
				E.db.mui.chat.isExpanded = false
			else
				E.db.chat.panelHeight = E.db.chat.panelHeight + E.db.mui.chat.expandPanel
				CH:PositionChat(true)
				E.db.mui.chat.isExpanded = true
			end
		end
	end)

	ChatButton:SetScript("OnEnter", function(self)
		if GameTooltip:IsForbidden() then return end

		self:SetAlpha(0.8)
		GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT", 0, 6)
		GameTooltip:ClearLines()
		if E.db.mui.chat.isExpanded then
			GameTooltip:AddLine(MER:cOption(L["BACK"]))
		else
			GameTooltip:AddLine(MER:cOption(L["Expand the chat"]))
		end
		GameTooltip:Show()
		if InCombatLockdown() then GameTooltip:Hide() end
	end)

	ChatButton:SetScript("OnLeave", function(self)
		if E.db.chat.panelBackdrop == "HIDEBOTH" or E.db.chat.panelBackdrop == "LEFT" then
			self:SetAlpha(0)
		else
			self:SetAlpha(0.55)
		end
		GameTooltip:Hide()
	end)

	ChatButton:RegisterEvent("ADDON_LOADED")
	ChatButton:SetScript("OnEvent", function(self, event, addon)
		if event == "ADDON_LOADED" and addon == "ElvUI_OptionsUI" then
			E.Options.args.chat.args.panels.args.panelHeight.set = function(info, value) E.db.chat.panelHeight = value; E.db.mui.chat.panelHeight = value; CH:PositionChat(true); end
			self:UnregisterEvent(event)
		end
	end)
end

function MERL:ShadowOverlay()
	-- Based on ncShadow
	if E.db.mui.general.shadowOverlay ~= true then return end

	self.f = CreateFrame("Frame", MER.Title.."ShadowBackground")
	self.f:SetPoint("TOPLEFT")
	self.f:SetPoint("BOTTOMRIGHT")
	self.f:SetFrameLevel(0)
	self.f:SetFrameStrata("BACKGROUND")

	self.f.tex = self.f:CreateTexture()
	self.f.tex:SetTexture([[Interface\Addons\ElvUI_MerathilisUI\media\textures\Overlay]])
	self.f.tex:SetAllPoints(self.f)

	self.f:SetAlpha(0.7)
end

function MERL:Initialize()
	self:CreateChatButtons()
	self:ShadowOverlay()
end

MER:RegisterModule(MERL:GetName())
