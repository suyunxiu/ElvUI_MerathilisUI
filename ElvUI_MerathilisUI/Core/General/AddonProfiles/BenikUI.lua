local MER, F, E, L, V, P, G = unpack(select(2, ...))

--Cache global variables
--WoW API / Variables
local ReloadUI = ReloadUI

--Global variables that we don't cache, list them here for the mikk's Find Globals script
-- GLOBALS: AddOnSkins, AddOnSkinsDB, LibStub

function MER:LoadBenikUIProfile()
	--[[----------------------------------
	--	BenikUI - Settings
	--]]----------------------------------
	E.db["benikui"]["general"]["loginMessage"] = false
	E.db["benikui"]["general"]["splashScreen"] = false
	E.db["benikui"]["general"]["hideStyle"] = true
	E.db["benikui"]["colors"]["gameMenuColor"] = 1
	E.db["benikui"]["misc"]["ilevel"]["enable"] = false
	E.db["benikui"]["actionbars"]["transparent"] = true
	E.db["benikui"]["actionbars"]["style"]["bar1"] = false
	E.db["benikui"]["actionbars"]["style"]["bar2"] = false
	E.db["benikui"]["actionbars"]["style"]["bar3"] = false
	E.db["benikui"]["actionbars"]["style"]["bar4"] = false
	E.db["benikui"]["actionbars"]["style"]["bar5"] = false
	E.db["benikui"]["actionbars"]["style"]["bar6"] = false
	E.db["benikui"]["datatexts"]["chat"]["enable"] = false
	E.db["benikui"]["datatexts"]["chat"]["transparent"] = true
	E.db["benikui"]["datatexts"]["chat"]["editBoxPosition"] = "BELOW_CHAT"
	E.db["benikui"]["datatexts"]["chat"]["styled"] = false
	E.db["benikui"]["datatexts"]["chat"]["backdrop"] = true
	if E.global["datatexts"]["customPanels"]["BuiMiddleDTPanel"] then
		E.global["datatexts"]["customPanels"]["BuiMiddleDTPanel"]["enable"] = false
	end
	E.db["benikui"]["datatexts"]["mail"]["toggle"] = false
	E.db["movers"]["BuiMiddleDtMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,2"
	E.db["movers"]["tokenHolderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-164"
	E.db["movers"]["BuiDashboardMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-8"
end

E.PopupDialogs["MUI_INSTALL_BUI_LAYOUT"] = {
	text = L["MUI_INSTALL_SETTINGS_LAYOUT_BUI"],
	OnAccept = function() MER:LoadBenikUIProfile(); ReloadUI() end,
	button1 = 'BenikUI Layout',
}
