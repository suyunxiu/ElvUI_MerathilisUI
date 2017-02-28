local E, L, V, P, G = unpack(ElvUI);
local MER = E:GetModule('MerathilisUI');

function MER:LoadShadowandLightProfile()
	local classColor = E.myclass == "PRIEST" and E.PriestColors or (CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[E.myclass] or RAID_CLASS_COLORS[E.myclass])
	--[[----------------------------------
	--	S&L - Settings
	--]]----------------------------------
	E.db["sle"]["raidmarkers"]["enable"] = false
	E.db["sle"]["media"]["fonts"]["gossip"]["font"] = "Merathilis Roboto-Black"
	E.db["sle"]["media"]["fonts"]["gossip"]["size"] = 11
	E.db["sle"]["media"]["fonts"]["editbox"]["font"] = "Merathilis Roboto-Black"
	E.db["sle"]["media"]["fonts"]["objective"]["size"] = 10
	E.db["sle"]["media"]["fonts"]["objective"]["font"] = "Merathilis Roboto-Black"
	E.db["sle"]["media"]["fonts"]["zone"]["font"] = "Merathilis Roboto-Black"
	E.db["sle"]["media"]["fonts"]["mail"]["font"] = "Merathilis Roboto-Black"
	E.db["sle"]["media"]["fonts"]["subzone"]["font"] = "Merathilis Roboto-Black"
	E.db["sle"]["media"]["fonts"]["objectiveHeader"]["font"] = "Merathilis Roboto-Black"
	E.db["sle"]["media"]["fonts"]["pvp"]["font"] = "Merathilis Roboto-Black"
	E.db["sle"]["media"]["fonts"]["questFontSuperHuge"]["font"] = "Merathilis Roboto-Black"
	E.db["sle"]["Armory"]["Character"]["Gem"]["SocketSize"] = 15
	E.db["sle"]["Armory"]["Character"]["Gradation"]["Display"] = true
	E.db["sle"]["Armory"]["Character"]["Durability"]["Display"] = "DamagedOnly"
	E.db["sle"]["Armory"]["Character"]["Durability"]["Font"] = "Merathilis Roboto-Black"
	E.db["sle"]["Armory"]["Character"]["Durability"]["FontSize"] = 11
	E.db["sle"]["Armory"]["Character"]["Level"]["ShowUpgradeLevel"] = true
	E.db["sle"]["Armory"]["Character"]["Level"]["Font"] = "Merathilis Roboto-Black"
	E.db["sle"]["Armory"]["Character"]["Backdrop"]["SelectedBG"] = "HIDE"
	E.db["sle"]["Armory"]["Character"]["Enchant"]["Display"] = "MouseoverOnly"
	E.db["sle"]["Armory"]["Character"]["Enchant"]["FontSize"] = 9
	E.db["sle"]["Armory"]["Character"]["Enchant"]["Font"] = "Merathilis Roboto-Black"
	E.db["sle"]["Armory"]["Character"]["Enchant"]["WarningIconOnly"] = true
	E.db["sle"]["Armory"]["Character"]["ItemLevel"]["font"] = "Merathilis Roboto-Black"
	E.db["sle"]["Armory"]["Character"]["ItemLevel"]["size"] = 16
	E.db["sle"]["Armory"]["Character"]["ItemLevel"]["outline"] = "OUTLINE"
	E.db["sle"]["Armory"]["Inspect"]["Enable"] = true
	E.db["sle"]["Armory"]["Inspect"]["Level"]["ShowUpgradeLevel"] = true
	E.db["sle"]["Armory"]["Inspect"]["Level"]["Font"] = "Merathilis Roboto-Black"
	E.db["sle"]["Armory"]["Inspect"]["Level"]["FontSize"] = 10
	E.db["sle"]["Armory"]["Inspect"]["Backdrop"]["SelectedBG"] = "HIDE"
	E.db["sle"]["Armory"]["Inspect"]["Enchant"]["Display"] = "MouseoverOnly"
	E.db["sle"]["Armory"]["Inspect"]["Enchant"]["FontSize"] = 9
	E.db["sle"]["Armory"]["Inspect"]["Enchant"]["Font"] = "Merathilis Roboto-Black"
	E.db["sle"]["Armory"]["Inspect"]["Enchant"]["WarningIconOnly"] = true
	E.db["sle"]["Armory"]["Inspect"]["Gem"]["SocketSize"] = 15
	E.db["sle"]["Armory"]["Inspect"]["Gradation"]["CurrentClassColor"] = true
	E.db["sle"]["auras"]["hideDebuffsTimer"] = false
	E.db["sle"]["auras"]["hideBuffsTimer"] = false
	E.db["sle"]["loot"]["autoroll"]["autogreed"] = true
	E.db["sle"]["loot"]["looticons"]["enable"] = true
	E.db["sle"]["loot"]["looticons"]["channels"]["CHAT_MSG_PARTY_LEADER"] = true
	E.db["sle"]["loot"]["looticons"]["channels"]["CHAT_MSG_INSTANCE_CHAT"] = true
	E.db["sle"]["loot"]["looticons"]["channels"]["CHAT_MSG_GUILD"] = true
	E.db["sle"]["loot"]["looticons"]["channels"]["CHAT_MSG_SAY"] = true
	E.db["sle"]["loot"]["looticons"]["channels"]["CHAT_MSG_BN_CONVERSATION"] = true
	E.db["sle"]["loot"]["looticons"]["channels"]["CHAT_MSG_WHISPER"] = true
	E.db["sle"]["loot"]["looticons"]["channels"]["CHAT_MSG_BN_WHISPER"] = true
	E.db["sle"]["loot"]["looticons"]["channels"]["CHAT_MSG_PARTY"] = true
	E.db["sle"]["loot"]["looticons"]["channels"]["CHAT_MSG_INSTANCE_CHAT_LEADER"] = true
	E.db["sle"]["loot"]["looticons"]["channels"]["CHAT_MSG_RAID"] = true
	E.db["sle"]["loot"]["looticons"]["channels"]["CHAT_MSG_OFFICER"] = true
	E.db["sle"]["loot"]["looticons"]["channels"]["CHAT_MSG_RAID_LEADER"] = true
	E.db["sle"]["loot"]["looticons"]["channels"]["CHAT_MSG_YELL"] = true
	E.db["sle"]["loot"]["looticons"]["channels"]["CHAT_MSG_CHANNEL"] = true
	E.db["sle"]["loot"]["looticons"]["channels"]["CHAT_MSG_BN_WHISPER_INFORM"] = true
	E.db["sle"]["loot"]["looticons"]["channels"]["CHAT_MSG_WHISPER_INFORM"] = true
	E.db["sle"]["loot"]["looticons"]["channels"]["CHAT_MSG_RAID_WARNING"] = true
	E.db["sle"]["loot"]["looticons"]["position"] = "RIGHT"
	E.db["sle"]["loot"]["announcer"]["enable"] = true
	E.db["sle"]["loot"]["enable"] = true
	E.db["sle"]["loot"]["history"]["autohide"] = true
	E.db["sle"]["legacy"]["garrison"]["toolbar"]["enable"] = true
	E.db["sle"]["legacy"]["garrison"]["toolbar"]["buttonsize"] = 20
	E.db["sle"]["pvp"]["duels"]["announce"] = true
	E.db["sle"]["pvp"]["duels"]["pet"] = true
	E.db["sle"]["pvp"]["duels"]["regular"] = true
	E.private["sle"]["pvp"]["KBbanner"]["enable"] = true
	E.private["sle"]["pvp"]["KBbanner"]["sound"] = true
	E.db["sle"]["tooltip"]["RaidProg"]["enable"] = true
	E.db["sle"]["tooltip"]["RaidProg"]["DifStyle"] = "LONG"
	E.db["sle"]["chat"]["tab"]["select"] = true
	E.db["sle"]["chat"]["tab"]["style"] = "DEFAULT"
	E.db["sle"]["chat"]["tab"]["color"] = {r = classColor.r, g = classColor.g, b = classColor.b}
	E.private["sle"]["chat"]["BubbleThrottle"] = 0.1
	E.private["sle"]["chat"]["BubbleClass"] = true
	E.db["sle"]["chat"]["textureAlpha"]["enable"] = true
	E.db["sle"]["chat"]["textureAlpha"]["alpha"] = 0.45
	E.db["sle"]["chat"]["dpsSpam"] = true
	E.db["sle"]["blizzard"]["rumouseover"] = true
	E.db["sle"]["misc"]["threat"]["enable"] = true
	E.db["sle"]["blizzard"]["errorframe"]["height"] = 60
	E.db["sle"]["blizzard"]["errorframe"]["width"] = 512
	E.db["sle"]["unitframes"]["roleicons"] = "SupervillainUI"
	E.db["sle"]["unitframes"]["unit"]["raid"]["offline"]["enable"] = false
	E.db["sle"]["unitframes"]["unit"]["player"]["combatico"]["texture"] = "SVUI"
	E.db["sle"]["unitframes"]["unit"]["player"]["combatico"]["red"] = false
	E.db["sle"]["unitframes"]["unit"]["player"]["rested"]["texture"] = "SVUI"
	E.db["sle"]["unitframes"]["unit"]["player"]["rested"]["size"] = 16
	E.db["sle"]["unitframes"]["unit"]["player"]["rested"]["xoffset"] = -90
	E.db["sle"]["unitframes"]["unit"]["player"]["rested"]["yoffset"] = 0
	E.db["sle"]["minimap"]["instance"]["font"] = "Merathilis Roboto-Black"
	E.db["sle"]["minimap"]["coords"]["display"] = "MOUSEOVER"
	E.db["sle"]["minimap"]["coords"]["coordsenable"] = false
	E.db["sle"]["minimap"]["coords"]["decimals"] = false
	E.db["sle"]["minimap"]["coords"]["middle"] = "CENTER"
	E.private["sle"]["minimap"]["buttons"]["enable"] = true
	E.private["sle"]["minimap"]["mapicons"]["enable"] = true
	E.private["sle"]["minimap"]["mapicons"]["barenable"] = true
	E.db["sle"]["minimap"]["mapicons"]["iconsize"] = 20
	E.db["sle"]["minimap"]["mapicons"]["iconmouseover"] = true
	E.db["sle"]["minimap"]["mapicons"]["iconmousover"] = true
	E.db["sle"]["minimap"]["buttons"]["anchor"] = "HORIZONTAL"
	E.db["sle"]["minimap"]["buttons"]["mouseover"] = true
	E.db["sle"]["minimap"]["locPanel"]["enable"] = false
	E.db["sle"]["dt"]["durability"]["threshold"] = 49
	E.db["sle"]["dt"]["durability"]["gradient"] = true
	E.db["sle"]["dt"]["hide_guildname"] = false
	E.db["sle"]["dt"]["guild"]["minimize_gmotd"] = false
	E.db["sle"]["dt"]["guild"]["hide_gmotd"] = true
	E.db["sle"]["dt"]["guild"]["totals"] = true
	E.db["sle"]["dt"]["guild"]["hide_hintline"] = true
	E.db["sle"]["dt"]["guild"]["hide_titleline"] = true
	E.db["sle"]["dt"]["guild"]["textStyle"] = "Icon"
	E.db["sle"]["dt"]["friends"]["sortBN"] = "revREALID"
	E.db["sle"]["dt"]["friends"]["expandBNBroadcast"] = true
	E.db["sle"]["dt"]["friends"]["totals"] = true
	E.db["sle"]["dt"]["friends"]["hide_hintline"] = true
	E.db["sle"]["dt"]["friends"]["hide_titleline"] = true
	E.db["sle"]["dt"]["friends"]["textStyle"] = "Icon"
	E.db["sle"]["dt"]["currency"]["Unused"] = false
	E.db["sle"]["dt"]["currency"]["PvP"] = false
	E.db["sle"]["dt"]["currency"]["Archaeology"] = false
	E.db["sle"]["dt"]["currency"]["Faction"] = false
	E.db["sle"]["dt"]["currency"]["Jewelcrafting"] = false
	E.db["sle"]["dt"]["currency"]["Raid"] = false
	E.db["sle"]["dt"]["currency"]["Cooking"] = false
	E.db["sle"]["dt"]["currency"]["Miscellaneous"] = false
	E.db["sle"]["dt"]["expandBNBroadcast"] = true
	E.db["sle"]["dt"]["hide_hintline"] = true
	E.db["sle"]["dt"]["mail"]["icon"] = false
	E.db["sle"]["dt"]["hide_gmotd"] = false
	E.db["sle"]["dt"]["totals"] = true
	E.db["sle"]["dt"]["combat"] = false
	E.db["sle"]["uibuttons"]["enable"] = false
	E.db["sle"]["uibuttons"]["point"] = "TOP"
	E.db["sle"]["uibuttons"]["menuBackdrop"] = true
	E.db["sle"]["uibuttons"]["orientation"] = "vertical"
	E.db["sle"]["uibuttons"]["dropdownBackdrop"] = false
	E.db["sle"]["uibuttons"]["menuBackdrop"] = false
	E.db["sle"]["uibuttons"]["spacing"] = 0
	E.db["sle"]["uibuttons"]["anchor"] = "BOTTOM"
	E.db["sle"]["uibuttons"]["point"] = "TOPLEFT"
	E.db["sle"]["uibuttons"]["size"] = 19
	E.private["sle"]["uiButtonStyle"] = "dropdown"
	E.private["sle"]["bags"]["transparentSlots"] = true
	E.private["sle"]["skins"]["objectiveTracker"]["enable"] = false
	E.private["sle"]["skins"]["merchant"]["enable"] = true
	E.private["sle"]["skins"]["merchant"]["subpages"] = 2
	E.private["sle"]["vehicle"]["enable"] = true
	E.private["sle"]["equip"]["enable"] = true
	E.private["sle"]["equip"]["setoverlay"] = true
	E.private["sle"]["professions"]["fishing"]["EasyCast"] = true
	E.private["sle"]["professions"]["fishing"]["FromMount"] = true
	E.private["sle"]["professions"]["deconButton"]["enable"] = false
	E.db["movers"]["SalvageCrateMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,2,-483"
	E.db["movers"]["SquareMinimapBar"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-2,-185"
	E.db["movers"]["SLE_UIButtonsMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,0,-460"
	E.db["movers"]["UIErrorsFrameMover"] = "TOP,ElvUIParent,TOP,0,-195"
	E.db["movers"]["SLE_Location_Mover"] = "TOP,ElvUIParent,TOP,0,-6"
	E.db["movers"]["RaidMarkerBarAnchor"] = "BOTTOM,ElvUIParent,BOTTOM,0,57"
end