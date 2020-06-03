local MER, E, L, V, P, G = unpack(select(2, ...))
local module = MER:NewModule("muiUnits", "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0")
local UF = E:GetModule("UnitFrames")

--Cache global variables
--Lua functions
--WoW API / Variables
local CreateFrame = CreateFrame
local hooksecurefunc = hooksecurefunc
-- GLOBALS:

function module:ADDON_LOADED(event, addon)
	if addon ~= "ElvUI_Config" then return end

	module:UnregisterEvent(event)
end

function module:StyleUFs()
	local db = E.db.mui.unitframes

	if db.style then
		-- Player
		self:InitPlayer()
		self:InitPower()
		self:InitCastBar()

		-- Target
		self:InitTarget()

		-- TargetTarget
		self:InitTargetTarget()

		-- Pet
		self:InitPet()

		-- Focus
		self:InitFocus()

		-- FocusTarget
		self:InitFocusTarget()

		-- Party
		self:InitParty()

		-- Raid
		self:InitRaid()

		-- Raid40
		self:InitRaid40()

		-- Boss
		self:InitBoss()
	end
end

function module:Initialize()
	if E.private.unitframe.enable ~= true then return end

	local db = E.db.mui.unitframes
	MER:RegisterDB(self, "unitframes")

	-- Units
	self:StyleUFs()

	-- Auras
	self:LoadAuras()

	-- RaidIcons
	hooksecurefunc(UF, "Configure_RaidIcon", module.Configure_RaidIcon)

	-- Health Prediction
	self:HealPrediction()

	-- Role Icons
	local f = CreateFrame("Frame")
	f:RegisterEvent("PLAYER_ENTERING_WORLD")
	f:SetScript("OnEvent", function(self, event)
		self:UnregisterEvent(event)
		module:SetRoleIcons()
	end)

	function module:ForUpdateAll()
		module:SetRoleIcons()
	end

	self:RegisterEvent("ADDON_LOADED")
end

MER:RegisterModule(module:GetName())
