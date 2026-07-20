local _, addon = ...;

local locale = GetLocale();

local types = {
	spell       = "|cff66bbffSpell ID:|r",
	aplied      = "|cff9d9d9dApplied by:|r",
	you         = "|cff00ff00(You)|r",
	item        = "|cffe6cc80Item ID:|r",
	unit        = "|cffc79c6eNPC ID:|r",
	quest       = "|cffffcc00Quest ID:|r",
	achievement = "|cffcc99ffAchievement ID:|r",
	criteria    = "|cffcc99ffCriteria ID:|r",
	glyph       = "|cff66bbffGlyph ID:|r",
	icon        = "|cff80FFAAIcon:|r",
};

if locale == "deDE" then
	types.spell       = "|cff66bbffZauber-ID:|r";
	types.aplied      = "|cff9d9d9dGewirkt von:|r";
	types.you         = "|cff00ff00(Du)|r";
	types.item        = "|cffe6cc80Gegenstands-ID:|r";
	types.unit        = "|cffc79c6eNSC-ID:|r";
	types.quest       = "|cffffcc00Quest-ID:|r";
	types.achievement = "|cffcc99ffErfolgs-ID:|r";
	types.criteria    = "|cffcc99ffKriterien-ID:|r";
	types.glyph       = "|cff66bbffGlyphen-ID:|r";
	types.icon        = "|cff80FFAASymbol:|r";
elseif locale == "frFR" then
	types.spell       = "|cff66bbffID du sort :|r";
	types.aplied      = "|cff9d9d9dAppliqué par :|r";
	types.you         = "|cff00ff00(Vous)|r";
	types.item        = "|cffe6cc80ID de l'objet :|r";
	types.unit        = "|cffc79c6eID du PNJ :|r";
	types.quest       = "|cffffcc00ID de la quête :|r";
	types.achievement = "|cffcc99ffID du haut fait :|r";
	types.criteria    = "|cffcc99ffID du critère :|r";
	types.glyph       = "|cff66bbffID du glyphe :|r";
	types.icon        = "|cff80FFAAIcône :|r";
elseif locale == "esES" or locale == "esMX" then
	types.spell       = "|cff66bbffID de hechizo:|r";
	types.aplied      = "|cff9d9d9dAplicado por:|r";
	types.you         = "|cff00ff00(Tú)|r";
	types.item        = "|cffe6cc80ID de objeto:|r";
	types.unit        = "|cffc79c6eID de PNJ:|r";
	types.quest       = "|cffffcc00ID de misión:|r";
	types.achievement = "|cffcc99ffID de logro:|r";
	types.criteria    = "|cffcc99ffID de criterio:|r";
	types.glyph       = "|cff66bbffID de glifo:|r";
	types.icon        = "|cff80FFAAIcono:|r";
elseif locale == "ruRU" then
	types.spell       = "|cff66bbffID заклинания:|r";
	types.aplied      = "|cff9d9d9dНаложено:|r";
	types.you         = "|cff00ff00(Вы)|r";
	types.item        = "|cffe6cc80ID предмета:|r";
	types.unit        = "|cffc79c6eID НИП:|r";
	types.quest       = "|cffffcc00ID задания:|r";
	types.achievement = "|cffcc99ffID достижения:|r";
	types.criteria    = "|cffcc99ffID критерия:|r";
	types.glyph       = "|cff66bbffID символа:|r";
	types.icon        = "|cff80FFAAИконка:|r";
elseif locale == "koKR" then
	types.spell       = "|cff66bbff주문 ID:|r";
	types.aplied      = "|cff9d9d9d시전자:|r";
	types.you         = "|cff00ff00(본인)|r";
	types.item        = "|cffe6cc80아이템 ID:|r";
	types.unit        = "|cffc79c6eNPC ID:|r";
	types.quest       = "|cffffcc00퀘스트 ID:|r";
	types.achievement = "|cffcc99ff업적 ID:|r";
	types.criteria    = "|cffcc99ff조건 ID:|r";
	types.glyph       = "|cff66bbff문양 ID:|r";
	types.icon        = "|cff80FFAA아이콘:|r";
elseif locale == "zhTW" then
	types.spell       = "|cff66bbff法術 ID:|r";
	types.aplied      = "|cff9d9d9d施放者:|r";
	types.you         = "|cff00ff00(你)|r";
	types.item        = "|cffe6cc80物品 ID:|r";
	types.unit        = "|cffc79c6eNPC ID:|r";
	types.quest       = "|cffffcc00任務 ID:|r";
	types.achievement = "|cffcc99ff成就 ID:|r";
	types.criteria    = "|cffcc99ff條件 ID:|r";
	types.glyph       = "|cff66bbff雕紋 ID:|r";
	types.icon        = "|cff80FFAA圖示:|r";
elseif locale == "zhCN" then
	types.spell       = "|cff66bbff法术 ID:|r";
	types.aplied      = "|cff9d9d9d施放者:|r";
	types.you         = "|cff00ff00(你)|r";
	types.item        = "|cffe6cc80物品 ID:|r";
	types.unit        = "|cffc79c6eNPC ID:|r";
	types.quest       = "|cffffcc00任务 ID:|r";
	types.achievement = "|cffcc99ff成就 ID:|r";
	types.criteria    = "|cffcc99ff条件 ID:|r";
	types.glyph       = "|cff66bbff雕文 ID:|r";
	types.icon        = "|cff80FFAA图标:|r";
end

addon.types = types;