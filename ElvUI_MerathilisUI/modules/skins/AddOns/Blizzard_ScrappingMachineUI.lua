local MER, E, L, V, P, G = unpack(select(2, ...))
local MERS = E:GetModule("muiSkins")
local S = E:GetModule("Skins")

--Cache global variables
--Lua functions
local _G = _G

--WoW API / Variables

--Global variables that we don't cache, list them here for mikk's FindGlobals script
-- GLOBALS:

local function styleScrappingMachine()
	if E.private.skins.blizzard.enable ~= true or E.private.skins.blizzard.Scrapping ~= true or E.private.muiSkins.blizzard.Scrapping ~= true then return end

	local MachineFrame = _G["ScrappingMachineFrame"]
	MachineFrame:Styling()

	-- Automatic open the Bags if the MachineFrame shows
	MachineFrame:HookScript("OnShow", function()
		if MachineFrame:IsShown() then
			ToggleAllBags()
		end
	end)
	MachineFrame:HookScript("OnHide", function()
		ToggleAllBags()
	end)
end

S:AddCallbackForAddon('Blizzard_ScrappingMachineUI', "mUIScrappingMachine", styleScrappingMachine)
