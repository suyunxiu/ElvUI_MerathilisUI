local MER, F, E, L, V, P, G = unpack(select(2, ...))
local S = E:GetModule("Skins")

--Cache global variables
local _G = _G
--WoW API / Variables
-- GLOBALS:

local function LoadSkin()
	if E.private.skins.blizzard.enable ~= true or E.private.skins.blizzard.guild ~= true then return end

	local rolesFrame = _G.CommunitiesGuildRecruitmentFrameRecruitment.RolesFrame
	F.ReskinRole(rolesFrame.TankButton, "TANK")
	F.ReskinRole(rolesFrame.HealerButton, "HEALER")
	F.ReskinRole(rolesFrame.DamagerButton, "DPS")
end

S:AddCallbackForAddon("Blizzard_GuildRecruitmentUI", "mUIGuildRecruitment", LoadSkin)
