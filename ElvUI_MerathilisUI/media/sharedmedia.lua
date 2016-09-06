local LSM = LibStub('LibSharedMedia-3.0')

if LSM == nil then return end

-- Backgrounds
LSM:Register("background", "RageGuy", [[Interface\Addons\ElvUI_MerathilisUI\media\background\RageGuy.tga]]) 
LSM:Register("background", "RageGuyFu", [[Interface\Addons\ElvUI_MerathilisUI\media\background\RageGuyFu.tga]]) 

-- Fonts
LSM:Register('font','Merathilis Prototype', [[Interface\AddOns\ElvUI_MerathilisUI\media\fonts\PROTOTYPE.TTF]])
LSM:Register('font','Merathilis PrototypeRU', [[Interface\AddOns\ElvUI_MerathilisUI\media\fonts\PROTOTYPE_RU.TTF]], LSM.LOCALE_BIT_ruRU + LSM.LOCALE_BIT_western)
LSM:Register('font','Merathilis Visitor1', [[Interface\AddOns\ElvUI_MerathilisUI\media\fonts\visitor1.ttf]], LSM.LOCALE_BIT_ruRU + LSM.LOCALE_BIT_western)
LSM:Register('font','Merathilis Visitor2', [[Interface\AddOns\ElvUI_MerathilisUI\media\fonts\visitor2.ttf]])
LSM:Register('font','Merathilis Tukui', [[Interface\AddOns\ElvUI_MerathilisUI\media\fonts\uf_font.ttf]], LSM.LOCALE_BIT_ruRU + LSM.LOCALE_BIT_western)
LSM:Register('font','Merathilis Kait', [[Interface\AddOns\ElvUI_MerathilisUI\media\fonts\heavy_dock_kait.ttf]])
LSM:Register('font','Merathilis ArialN', [[Interface\AddOns\ElvUI_MerathilisUI\media\fonts\ARIALN.ttf]])
LSM:Register('font','Merathilis Roadway', [[Interface\AddOns\ElvUI_MerathilisUI\media\fonts\ROADWAY.ttf]])
LSM:Register('font','Merathilis Expressway', [[Interface\AddOns\ElvUI_MerathilisUI\media\fonts\Expressway.ttf]], LSM.LOCALE_BIT_ruRU + LSM.LOCALE_BIT_western)
LSM:Register('font','Merathilis Default', [[Interface\AddOns\ElvUI_MerathilisUI\media\fonts\default.ttf]])
LSM:Register('font','Merathilis Roboto-Black', [[Interface\AddOns\ElvUI_MerathilisUI\media\fonts\Roboto-Black.ttf]])
LSM:Register('font','Merathilis Roboto-Bold', [[Interface\AddOns\ElvUI_MerathilisUI\media\fonts\Roboto-Bold.ttf]])
LSM:Register('font','Merathilis Roboto-Medium', [[Interface\AddOns\ElvUI_MerathilisUI\media\fonts\Roboto-Medium.ttf]])
LSM:Register('font','Merathilis Roboto-Regular', [[Interface\AddOns\ElvUI_MerathilisUI\media\fonts\Roboto-Regular.ttf]])

-- Statusbars
LSM:Register('statusbar','MerathilisFlat', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\Flat.tga]])
LSM:Register('statusbar','MerathilisOnePixel', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\OnePixel.tga]])
LSM:Register('statusbar','MerathilisMelli', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\Melli.tga]])
LSM:Register('statusbar','MerathilisMelliDark', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\MelliDark.tga]])
LSM:Register('statusbar','MerathilisEmpty', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\Empty.tga]])
LSM:Register('statusbar','MerathilisKait1', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\Kait1.tga]])
LSM:Register('statusbar','MerathilisKait2', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\Kait2.tga]])
LSM:Register('statusbar','MerathilisnormTex', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\normTex.tga]])
LSM:Register('statusbar','Merathilisblank', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\blank.tga]])
LSM:Register('statusbar','MerathilisDefault', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\default.blp]])
LSM:Register('statusbar','MerathilisLight', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\Light.tga]])
LSM:Register('statusbar','Kait1', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\Kait1.tga]])
LSM:Register('statusbar','Kait2', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\Kait2.tga]])
LSM:Register('statusbar','AsphyxiaNormal', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\Normal.tga]])
LSM:Register('statusbar','AsphyxiaNormal2', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\Normal2.tga]])
LSM:Register('statusbar','AsphyxiaNormal3', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\Normal3.tga]])
LSM:Register('statusbar','Asphyxia', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\Asphyxia.blp]])
LSM:Register('statusbar','RenaitreDefile', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenaitreDefile.tga]])
LSM:Register('statusbar','RenaitreDefileL', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenaitreDefileL.tga]])
LSM:Register('statusbar','RenaitreDeity', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenaitreDeity.tga]])
LSM:Register('statusbar','RenaitreDeityL', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenaitreDeityL.tga]])
LSM:Register('statusbar','RenaitreDeviant', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenaitreDeviant.tga]])
LSM:Register('statusbar','RenaitreDeviantThin', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenaitreDeviantThin.tga]])
LSM:Register('statusbar','RenaitreDeviantThinL', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenaitreDeviantThinL.tga]])
LSM:Register('statusbar','RenaitreMinion', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenaitreMinion.tga]])
LSM:Register('statusbar','RenaitreMinionL', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenaitreMinionL.tga]])
LSM:Register('statusbar','RenaitreSabrette', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenaitreSabrette.tga]])
LSM:Register('statusbar','RenaitreSabretteMedium', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenaitreSabretteMedium.tga]])
LSM:Register('statusbar','RenaitreSabretteWide', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenaitreSabretteWide.tga]])
LSM:Register('statusbar','RenaitreTunnel', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenaitreTunnel.tga]])
LSM:Register('statusbar','RenaitreTunnelL', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenaitreTunnelL.tga]])
LSM:Register('statusbar','RenAscension', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenAscension.tga]])
LSM:Register('statusbar','RenAscensionL', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenAscensionL.tga]])
LSM:Register('statusbar','RenCloak', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenCloak.tga]])
LSM:Register('statusbar','RenCloakL', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenCloakL.tga]])
LSM:Register('statusbar','RenDeity', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenDeity.tga]])
LSM:Register('statusbar','RenDeityL', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenDeityL.tga]])
LSM:Register('statusbar','RenDispatch', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenDispatch.tga]])
LSM:Register('statusbar','RenFeint', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenFeint.tga]])
LSM:Register('statusbar','RenFeint2', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenFeint2.tga]])
LSM:Register('statusbar','RenFeint2Dark', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenFeint2Dark.tga]])
LSM:Register('statusbar','RenFeintDark', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenFeintDark.tga]])
LSM:Register('statusbar','RenFeintDouble', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenFeintDouble.tga]])
LSM:Register('statusbar','RenHorizonDown', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenHorizonDown.tga]])
LSM:Register('statusbar','RenHorizonUp', [[Interface\AddOns\ElvUI_MerathilisUI\media\textures\RenHorizonUp.tga]])

-- Sounds
LSM:Register('sounds','warning', [[Interface\AddOns\ElvUI_MerathilisUI\media\sounds\warning.ogg]])
