local _, addon = ...;

local locale = GetLocale();

local types = {
	spell       = "|cff66bbffSpell ID:|r",
	recipe      = "|cff66bbffRecipe ID:|r",
	result      = "|cffe6cc80Result Item ID:|r",
	aplied      = "|cff9d9d9dApplied by:|r",
	you         = "|cff00ff00(You)|r",
	item        = "|cffe6cc80Item ID:|r",
	enchant     = "|cffbb88ffEnchant ID:|r",
	gem         = "Socket %d ID:",
	itemset     = "|cffa335eeItem Set ID:|r",
	unit        = "|cffc79c6eNPC ID:|r",
	quest       = "|cffffcc00Quest ID:|r",
	achievement = "|cffcc99ffAchievement ID:|r",
	criteria    = "|cffcc99ffAchievement Criteria ID:|r",
	glyph       = "|cff66bbffGlyph Spell ID:|r",
	glyphProperties = "|cff66bbffGlyphProperties ID:|r",
	icon        = "|cff80FFAAIcon:|r",
};

local L = {
	settingsTitle       = "Tooltip information",
	settingsDescription = "Choose which information idTip adds to tooltips.",
	settingsCategory    = "Settings",
	aboutTitle          = "About idTip WotLK (SpellAndItemID)",
	aboutDescription    = "idTip WotLK, previously known as SpellAndItemID, adds useful technical information directly to in-game tooltips.",
	author              = "Author",
	version             = "Version",
	repository          = "Latest information",
	translations        = "Translations",
	criteriaOption      = "Achievement Criteria IDs",
	glyphOption         = "Glyph IDs",
	recipeOption        = "Recipe IDs",
	gemOption           = "Gem Item IDs",
	translationCredits  =
		"English translation\n" ..
		"German translation\n" ..
		"French translation\n" ..
		"Spanish translation (Europe)\n" ..
		"Spanish translation (Mexico)\n" ..
		"Russian translation\n" ..
		"Korean translation\n" ..
		"Traditional Chinese translation\n" ..
		"Simplified Chinese translation",
	optionTooltips = {
		spell       = "Shows the spell ID and, when available, its rank in tooltips for spells, abilities, auras, enchants, and trade skills.",
		recipe      = "Shows recipe IDs in links and profession tooltips, plus result item IDs when available. Matching spell and item IDs are not repeated.",
		aplied      = "Shows the name of the unit that applied a buff, debuff, or aura, and marks effects applied by you.",
		item        = "Shows the item ID in tooltips for items, equipment, links, and comparisons.",
		enchant     = "Shows the permanent enchantment ID from an item link; temporary enchants are not included.",
		gem         = "Shows the item IDs of socketed gems when the client provides their links.",
		itemset     = "Shows the item set ID for items that belong to a set.",
		unit        = "Shows the NPC ID for creatures and other non-player units.",
		quest       = "Shows the quest ID in quest-link tooltips and the quest log, including selected quest details.",
		achievement = "Shows the achievement ID in achievement links and the achievement window.",
		criteria    = "Shows the internal criteria ID when you hover over an achievement objective.",
		glyph       = "Shows GlyphProperties and glyph spell IDs in glyph links and glyph-socket tooltips.",
		icon        = "Shows the technical icon path for supported spells, items, glyphs, and achievements.",
	},
};

if locale == "deDE" then
	types.spell       = "|cff66bbffZauber-ID:|r";
	types.recipe      = "|cff66bbffRezept-ID:|r";
	types.result      = "|cffe6cc80Ergebnisgegenstands-ID:|r";
	types.aplied      = "|cff9d9d9dGewirkt von:|r";
	types.you         = "|cff00ff00(Du)|r";
	types.item        = "|cffe6cc80Gegenstands-ID:|r";
	types.enchant     = "|cffbb88ffVerzauberungs-ID:|r";
	types.gem         = "Sockel %d ID:";
	types.itemset     = "|cffa335eeGegenstandsset-ID:|r";
	types.unit        = "|cffc79c6eNSC-ID:|r";
	types.quest       = "|cffffcc00Quest-ID:|r";
	types.achievement = "|cffcc99ffErfolgs-ID:|r";
	types.criteria    = "|cffcc99ffErfolgskriterium-ID:|r";
	types.glyph       = "|cff66bbffGlyphenzauber-ID:|r";
	types.glyphProperties = "|cff66bbffGlypheneigenschaften-ID:|r";
	types.icon        = "|cff80FFAASymbol:|r";
	L.settingsTitle       = "Tooltip-Informationen";
	L.settingsDescription = "Wähle aus, welche Informationen idTip zu Tooltips hinzufügt.";
	L.settingsCategory    = "Einstellungen";
	L.aboutTitle          = "Über idTip WotLK (SpellAndItemID)";
	L.aboutDescription    = "idTip WotLK, früher als SpellAndItemID bekannt, fügt Tooltips nützliche technische Informationen hinzu.";
	L.author              = "Autor";
	L.repository          = "Aktuelle Informationen";
	L.translations        = "Übersetzungen";
	L.criteriaOption      = "Erfolgskriterien-IDs";
	L.glyphOption         = "Glyphen-IDs";
	L.recipeOption        = "Rezept-IDs";
	L.gemOption           = "Edelstein-IDs";
	L.translationCredits  =
		"Übersetzung ins Englische\n" ..
		"Übersetzung ins Deutsche\n" ..
		"Übersetzung ins Französische\n" ..
		"Übersetzung ins Spanische (Europa)\n" ..
		"Übersetzung ins Spanische (Mexiko)\n" ..
		"Übersetzung ins Russische\n" ..
		"Übersetzung ins Koreanische\n" ..
		"Übersetzung ins traditionelle Chinesisch\n" ..
		"Übersetzung ins vereinfachte Chinesisch";
	L.optionTooltips = {
		spell       = "Zeigt die Zauber-ID und, falls verfügbar, den Rang in Tooltips für Zauber, Fähigkeiten, Auren, Verzauberungen und Berufe an.";
		recipe      = "Zeigt Rezept-IDs in Links und Berufstooltips sowie verfügbare Ergebnisgegenstands-IDs an. Gleiche Zauber- und Gegenstands-IDs werden nicht wiederholt.";
		aplied      = "Zeigt den Namen der Einheit an, die einen Stärkungszauber, Schwächungszauber oder eine Aura angewendet hat, und markiert deine eigenen Effekte.";
		item        = "Zeigt die Gegenstands-ID in Tooltips für Gegenstände, Ausrüstung, Links und Vergleiche an.";
		enchant     = "Zeigt die ID der dauerhaften Verzauberung aus dem Gegenstandslink an; temporäre Verzauberungen sind nicht enthalten.";
		gem         = "Zeigt die Gegenstands-IDs eingesetzter Edelsteine an, wenn der Client ihre Links bereitstellt.";
		itemset     = "Zeigt die Gegenstandsset-ID für Gegenstände an, die zu einem Set gehören.";
		unit        = "Zeigt die NSC-ID für Kreaturen und andere Einheiten an, die keine Spieler sind.";
		quest       = "Zeigt die Quest-ID in Tooltips von Questlinks und im Questlog an.";
		achievement = "Zeigt die Erfolgs-ID in Erfolgslinks und im Erfolgsfenster an.";
		criteria    = "Zeigt die interne Kriterien-ID beim Überfahren eines Erfolgsziels an.";
		glyph       = "Zeigt die Glypheneigenschaften-ID und die Glyphenzauber-ID in Glyphenlinks und Tooltips von Glyphensockeln an.";
		icon        = "Zeigt den technischen Symbolpfad für unterstützte Zauber, Gegenstände, Glyphen und Erfolge an.";
	};
elseif locale == "frFR" then
	types.spell       = "|cff66bbffID du sort :|r";
	types.recipe      = "|cff66bbffID de la recette :|r";
	types.result      = "|cffe6cc80ID de l'objet créé :|r";
	types.aplied      = "|cff9d9d9dAppliqué par :|r";
	types.you         = "|cff00ff00(Vous)|r";
	types.item        = "|cffe6cc80ID de l'objet :|r";
	types.enchant     = "|cffbb88ffID de l'enchantement :|r";
	types.gem         = "ID de la châsse %d :";
	types.itemset     = "|cffa335eeID de l'ensemble :|r";
	types.unit        = "|cffc79c6eID du PNJ :|r";
	types.quest       = "|cffffcc00ID de la quête :|r";
	types.achievement = "|cffcc99ffID du haut fait :|r";
	types.criteria    = "|cffcc99ffID du critère de haut fait :|r";
	types.glyph       = "|cff66bbffID du sort de glyphe :|r";
	types.glyphProperties = "|cff66bbffID des propriétés du glyphe :|r";
	types.icon        = "|cff80FFAAIcône :|r";
	L.settingsTitle       = "Informations des infobulles";
	L.settingsDescription = "Choisissez les informations qu'idTip ajoute aux infobulles.";
	L.settingsCategory    = "Paramètres";
	L.aboutTitle          = "À propos d'idTip WotLK (SpellAndItemID)";
	L.aboutDescription    = "idTip WotLK, anciennement appelé SpellAndItemID, ajoute des informations techniques utiles directement aux infobulles du jeu.";
	L.author              = "Auteur";
	L.repository          = "Dernières informations";
	L.translations        = "Traductions";
	L.criteriaOption      = "ID des critères de hauts faits";
	L.glyphOption         = "ID des glyphes";
	L.recipeOption        = "ID des recettes";
	L.gemOption           = "ID des gemmes";
	L.translationCredits  =
		"Traduction en anglais\n" ..
		"Traduction en allemand\n" ..
		"Traduction en français\n" ..
		"Traduction en espagnol (Europe)\n" ..
		"Traduction en espagnol (Mexique)\n" ..
		"Traduction en russe\n" ..
		"Traduction en coréen\n" ..
		"Traduction en chinois traditionnel\n" ..
		"Traduction en chinois simplifié";
	L.optionTooltips = {
		spell       = "Affiche l'ID et, si disponible, le rang du sort dans les infobulles des sorts, techniques, auras, enchantements et métiers.";
		recipe      = "Affiche les ID de recette dans les liens et les infobulles des métiers, ainsi que l'ID de l'objet créé s'il existe. Les ID de sort et d'objet identiques ne sont pas répétés.";
		aplied      = "Affiche le nom de l'unité ayant appliqué une amélioration, un affaiblissement ou une aura, et signale vos propres effets.";
		item        = "Affiche l'ID de l'objet dans les infobulles des objets, équipements, liens et comparaisons.";
		enchant     = "Affiche l'ID de l'enchantement permanent du lien d'objet ; les enchantements temporaires ne sont pas inclus.";
		gem         = "Affiche les ID des objets des gemmes serties lorsque le client fournit leurs liens.";
		itemset     = "Affiche l'ID de l'ensemble pour les objets qui appartiennent à un ensemble.";
		unit        = "Affiche l'ID du PNJ pour les créatures et les autres unités non-joueurs.";
		quest       = "Affiche l'ID de la quête dans les infobulles des liens de quête et du journal des quêtes.";
		achievement = "Affiche l'ID du haut fait dans les liens et la fenêtre des hauts faits.";
		criteria    = "Affiche l'ID interne du critère au survol d'un objectif de haut fait.";
		glyph       = "Affiche l'ID des propriétés du glyphe et l'ID du sort de glyphe dans les liens et les infobulles des châsses de glyphes.";
		icon        = "Affiche le chemin technique de l'icône pour les sorts, objets, glyphes et hauts faits pris en charge.";
	};
elseif locale == "esES" or locale == "esMX" then
	types.spell       = "|cff66bbffID de hechizo:|r";
	types.recipe      = "|cff66bbffID de receta:|r";
	types.result      = "|cffe6cc80ID del objeto creado:|r";
	types.aplied      = "|cff9d9d9dAplicado por:|r";
	types.you         = "|cff00ff00(Tú)|r";
	types.item        = "|cffe6cc80ID de objeto:|r";
	types.enchant     = "|cffbb88ffID de encantamiento:|r";
	types.gem         = "ID de ranura %d:";
	types.itemset     = "|cffa335eeID de conjunto:|r";
	types.unit        = "|cffc79c6eID de PNJ:|r";
	types.quest       = "|cffffcc00ID de misión:|r";
	types.achievement = "|cffcc99ffID de logro:|r";
	types.criteria    = "|cffcc99ffID de criterio de logro:|r";
	types.glyph       = "|cff66bbffID de hechizo de glifo:|r";
	types.glyphProperties = "|cff66bbffID de propiedades del glifo:|r";
	types.icon        = "|cff80FFAAIcono:|r";
	L.settingsTitle       = "Información de las descripciones emergentes";
	L.settingsDescription = "Elige la información que idTip añade a las descripciones emergentes.";
	L.settingsCategory    = "Configuración";
	L.aboutTitle          = "Acerca de idTip WotLK (SpellAndItemID)";
	L.aboutDescription    = "idTip WotLK, anteriormente conocido como SpellAndItemID, añade información técnica útil directamente a las descripciones emergentes del juego.";
	L.author              = "Autor";
	L.version             = "Versión";
	L.repository          = "Información más reciente";
	L.translations        = "Traducciones";
	L.criteriaOption      = "ID de criterios de logros";
	L.glyphOption         = "ID de glifos";
	L.recipeOption        = "ID de recetas";
	L.gemOption           = "ID de gemas";
	L.translationCredits  =
		"Traducción al inglés\n" ..
		"Traducción al alemán\n" ..
		"Traducción al francés\n" ..
		"Traducción al español (Europa)\n" ..
		"Traducción al español (México)\n" ..
		"Traducción al ruso\n" ..
		"Traducción al coreano\n" ..
		"Traducción al chino tradicional\n" ..
		"Traducción al chino simplificado";
	L.optionTooltips = {
		spell       = "Muestra el ID y, cuando está disponible, el rango del hechizo en las descripciones de hechizos, facultades, auras, encantamientos y profesiones.";
		recipe      = "Muestra el ID de receta en enlaces y profesiones, y el ID del objeto creado si existe. No repite los ID de hechizo u objeto iguales.";
		aplied      = "Muestra el nombre de la unidad que aplicó un beneficio, perjuicio o aura, y señala tus propios efectos.";
		item        = "Muestra el ID del objeto en las descripciones de objetos, equipo, enlaces y comparaciones.";
		enchant     = "Muestra el ID del encantamiento permanente del enlace del objeto; no incluye encantamientos temporales.";
		gem         = "Muestra los ID de objeto de las gemas engarzadas cuando el cliente proporciona sus enlaces.";
		itemset     = "Muestra el ID de conjunto para los objetos que pertenecen a un conjunto.";
		unit        = "Muestra el ID de PNJ para criaturas y otras unidades que no sean jugadores.";
		quest       = "Muestra el ID de misión en las descripciones de los enlaces y en el registro de misiones.";
		achievement = "Muestra el ID de logro en los enlaces y en la ventana de logros.";
		criteria    = "Muestra el ID interno del criterio al pasar el cursor sobre un objetivo de logro.";
		glyph       = "Muestra el ID de propiedades del glifo y el ID del hechizo del glifo en enlaces y descripciones de ranuras de glifos.";
		icon        = "Muestra la ruta técnica del icono para hechizos, objetos, glifos y logros compatibles.";
	};
elseif locale == "ruRU" then
	types.spell       = "|cff66bbffID заклинания:|r";
	types.recipe      = "|cff66bbffID рецепта:|r";
	types.result      = "|cffe6cc80ID результата:|r";
	types.aplied      = "|cff9d9d9dНаложено:|r";
	types.you         = "|cff00ff00(Вы)|r";
	types.item        = "|cffe6cc80ID предмета:|r";
	types.enchant     = "|cffbb88ffID зачарования:|r";
	types.gem         = "ID сокета %d:";
	types.itemset     = "|cffa335eeID комплекта:|r";
	types.unit        = "|cffc79c6eID НИП:|r";
	types.quest       = "|cffffcc00ID задания:|r";
	types.achievement = "|cffcc99ffID достижения:|r";
	types.criteria    = "|cffcc99ffID критерия достижения:|r";
	types.glyph       = "|cff66bbffID заклинания символа:|r";
	types.glyphProperties = "|cff66bbffID записи символа:|r";
	types.icon        = "|cff80FFAAИконка:|r";
	L.settingsTitle       = "Информация в подсказках";
	L.settingsDescription = "Выберите информацию, которую idTip добавляет во всплывающие подсказки.";
	L.settingsCategory    = "Настройки";
	L.aboutTitle          = "Об idTip WotLK (SpellAndItemID)";
	L.aboutDescription    = "idTip WotLK, ранее известный как SpellAndItemID, добавляет полезную техническую информацию непосредственно во всплывающие подсказки игры.";
	L.author              = "Автор";
	L.version             = "Версия";
	L.repository          = "Последняя информация";
	L.translations        = "Переводы";
	L.criteriaOption      = "ID критериев достижений";
	L.glyphOption         = "ID символов";
	L.recipeOption        = "ID рецептов";
	L.gemOption           = "ID вставленных камней";
	L.translationCredits  =
		"Перевод на английский\n" ..
		"Перевод на немецкий\n" ..
		"Перевод на французский\n" ..
		"Перевод на испанский (Европа)\n" ..
		"Перевод на испанский (Мексика)\n" ..
		"Перевод на русский\n" ..
		"Перевод на корейский\n" ..
		"Перевод на традиционный китайский\n" ..
		"Перевод на упрощённый китайский";
	L.optionTooltips = {
		spell       = "Показывает ID и, если доступен, ранг заклинания в подсказках заклинаний, способностей, аур, зачарований и профессий.";
		recipe      = "Показывает ID рецепта в ссылках и окне профессии, а также ID результата, если он есть. Совпадающие ID заклинания и предмета не повторяются.";
		aplied      = "Показывает имя юнита, наложившего положительный эффект, отрицательный эффект или ауру, и помечает ваши эффекты.";
		item        = "Показывает ID предмета в подсказках предметов, экипировки, ссылок и сравнения.";
		enchant     = "Показывает ID постоянного зачарования из ссылки на предмет. Временные зачарования не включены.";
		gem         = "Показывает ID предметов вставленных камней, если клиент предоставляет ссылки на них.";
		itemset     = "Показывает ID комплекта для предметов, входящих в комплект.";
		unit        = "Показывает ID НИП для существ и других юнитов, не являющихся игроками.";
		quest       = "Показывает ID задания в подсказках ссылок, при наведении на запись журнала и в сведениях о выбранном задании.";
		achievement = "Показывает ID достижения в ссылках на достижения и окне достижений.";
		criteria    = "Показывает внутренний ID критерия при наведении на цель достижения.";
		glyph       = "Показывает ID записи символа и ID его заклинания в ссылках и подсказках гнёзд символов.";
		icon        = "Показывает технический путь к иконке для поддерживаемых заклинаний, предметов, символов и достижений.";
	};
elseif locale == "koKR" then
	types.spell       = "|cff66bbff주문 ID:|r";
	types.recipe      = "|cff66bbff제작법 ID:|r";
	types.result      = "|cffe6cc80결과 아이템 ID:|r";
	types.aplied      = "|cff9d9d9d시전자:|r";
	types.you         = "|cff00ff00(본인)|r";
	types.item        = "|cffe6cc80아이템 ID:|r";
	types.enchant     = "|cffbb88ff마법부여 ID:|r";
	types.gem         = "보석 홈 %d ID:";
	types.itemset     = "|cffa335ee아이템 세트 ID:|r";
	types.unit        = "|cffc79c6eNPC ID:|r";
	types.quest       = "|cffffcc00퀘스트 ID:|r";
	types.achievement = "|cffcc99ff업적 ID:|r";
	types.criteria    = "|cffcc99ff업적 조건 ID:|r";
	types.glyph       = "|cff66bbff문양 주문 ID:|r";
	types.glyphProperties = "|cff66bbff문양 속성 ID:|r";
	types.icon        = "|cff80FFAA아이콘:|r";
	L.settingsTitle       = "툴팁 정보";
	L.settingsDescription = "idTip이 툴팁에 추가할 정보를 선택합니다.";
	L.settingsCategory    = "설정";
	L.aboutTitle          = "idTip WotLK 정보 (SpellAndItemID)";
	L.aboutDescription    = "이전에 SpellAndItemID로 알려진 idTip WotLK는 게임 툴팁에 유용한 기술 정보를 직접 추가합니다.";
	L.author              = "제작자";
	L.version             = "버전";
	L.repository          = "최신 정보";
	L.translations        = "번역";
	L.criteriaOption      = "업적 조건 ID";
	L.glyphOption         = "문양 ID";
	L.recipeOption        = "제작법 ID";
	L.gemOption           = "보석 아이템 ID";
	L.translationCredits  =
		"영어 번역\n" ..
		"독일어 번역\n" ..
		"프랑스어 번역\n" ..
		"스페인어 번역 (유럽)\n" ..
		"스페인어 번역 (멕시코)\n" ..
		"러시아어 번역\n" ..
		"한국어 번역\n" ..
		"중국어 번체 번역\n" ..
		"중국어 간체 번역";
	L.optionTooltips = {
		spell       = "주문, 능력, 오라, 마법부여 및 전문기술 툴팁에 주문 ID와 사용 가능한 경우 등급을 표시합니다.";
		recipe      = "제작법 링크와 전문기술 툴팁에 제작법 ID를, 가능한 경우 결과 아이템 ID를 표시합니다. 동일한 주문 및 아이템 ID는 중복 표시하지 않습니다.";
		aplied      = "강화 효과, 약화 효과 또는 오라를 적용한 유닛의 이름을 표시하고 자신의 효과를 구분합니다.";
		item        = "아이템, 장비, 링크 및 비교 툴팁에 아이템 ID를 표시합니다.";
		enchant     = "아이템 링크의 영구 마법부여 ID를 표시합니다. 임시 마법부여는 포함되지 않습니다.";
		gem         = "클라이언트가 보석 링크를 제공하면 장착된 보석의 아이템 ID를 표시합니다.";
		itemset     = "세트에 속한 아이템의 아이템 세트 ID를 표시합니다.";
		unit        = "플레이어가 아닌 생물 및 다른 유닛의 NPC ID를 표시합니다.";
		quest       = "퀘스트 링크 툴팁과 퀘스트 목록에 퀘스트 ID를 표시합니다.";
		achievement = "업적 링크와 업적 창에 업적 ID를 표시합니다.";
		criteria    = "업적 목표에 마우스를 올리면 내부 조건 ID를 표시합니다.";
		glyph       = "문양 링크와 문양 슬롯 툴팁에 문양 속성 ID와 문양 주문 ID를 표시합니다.";
		icon        = "지원되는 주문, 아이템, 문양 및 업적의 기술적인 아이콘 경로를 표시합니다.";
	};
elseif locale == "zhTW" then
	types.spell       = "|cff66bbff法術 ID:|r";
	types.recipe      = "|cff66bbff配方 ID:|r";
	types.result      = "|cffe6cc80成品 ID:|r";
	types.aplied      = "|cff9d9d9d施放者:|r";
	types.you         = "|cff00ff00(你)|r";
	types.item        = "|cffe6cc80物品 ID:|r";
	types.enchant     = "|cffbb88ff附魔 ID:|r";
	types.gem         = "插槽 %d ID:";
	types.itemset     = "|cffa335ee套裝 ID:|r";
	types.unit        = "|cffc79c6eNPC ID:|r";
	types.quest       = "|cffffcc00任務 ID:|r";
	types.achievement = "|cffcc99ff成就 ID:|r";
	types.criteria    = "|cffcc99ff成就條件 ID:|r";
	types.glyph       = "|cff66bbff雕紋法術 ID:|r";
	types.glyphProperties = "|cff66bbff雕紋屬性 ID:|r";
	types.icon        = "|cff80FFAA圖示:|r";
	L.settingsTitle       = "提示資訊";
	L.settingsDescription = "選擇 idTip 要加入提示資訊的內容。";
	L.settingsCategory    = "設定";
	L.aboutTitle          = "關於 idTip WotLK (SpellAndItemID)";
	L.aboutDescription    = "idTip WotLK（前身為 SpellAndItemID）會直接在遊戲提示資訊中加入實用的技術資料。";
	L.author              = "作者";
	L.version             = "版本";
	L.repository          = "最新資訊";
	L.translations        = "翻譯";
	L.criteriaOption      = "成就條件 ID";
	L.glyphOption         = "雕紋 ID";
	L.recipeOption        = "配方 ID";
	L.gemOption           = "寶石物品 ID";
	L.translationCredits  =
		"英文翻譯\n" ..
		"德文翻譯\n" ..
		"法文翻譯\n" ..
		"西班牙文翻譯（歐洲）\n" ..
		"西班牙文翻譯（墨西哥）\n" ..
		"俄文翻譯\n" ..
		"韓文翻譯\n" ..
		"繁體中文翻譯\n" ..
		"簡體中文翻譯";
	L.optionTooltips = {
		spell       = "在法術、技能、光環、附魔與專業技能的提示資訊中顯示法術 ID，並在可用時顯示等級。";
		recipe      = "在配方連結及專業技能提示資訊中顯示配方 ID，並在可用時顯示成品 ID。相同的法術或物品 ID 不會重複顯示。";
		aplied      = "顯示施放增益、減益或光環的單位名稱，並標示由你施放的效果。";
		item        = "在物品、裝備、連結與比較提示資訊中顯示物品 ID。";
		enchant     = "顯示物品連結中的永久附魔 ID；不包含暫時附魔。";
		gem         = "當客戶端提供寶石連結時，顯示已鑲嵌寶石的物品 ID。";
		itemset     = "顯示屬於套裝之物品的套裝 ID。";
		unit        = "顯示生物及其他非玩家單位的 NPC ID。";
		quest       = "在任務連結提示資訊和任務日誌中顯示任務 ID。";
		achievement = "在成就連結與成就視窗中顯示成就 ID。";
		criteria    = "滑鼠指向成就目標時顯示其內部條件 ID。";
		glyph       = "在雕紋連結與雕紋插槽提示資訊中顯示雕紋屬性 ID 和雕紋法術 ID。";
		icon        = "顯示支援的法術、物品、雕紋與成就所使用的技術圖示路徑。";
	};
elseif locale == "zhCN" then
	types.spell       = "|cff66bbff法术 ID:|r";
	types.recipe      = "|cff66bbff配方 ID:|r";
	types.result      = "|cffe6cc80成品 ID:|r";
	types.aplied      = "|cff9d9d9d施放者:|r";
	types.you         = "|cff00ff00(你)|r";
	types.item        = "|cffe6cc80物品 ID:|r";
	types.enchant     = "|cffbb88ff附魔 ID:|r";
	types.gem         = "插槽 %d ID:";
	types.itemset     = "|cffa335ee套装 ID:|r";
	types.unit        = "|cffc79c6eNPC ID:|r";
	types.quest       = "|cffffcc00任务 ID:|r";
	types.achievement = "|cffcc99ff成就 ID:|r";
	types.criteria    = "|cffcc99ff成就条件 ID:|r";
	types.glyph       = "|cff66bbff雕文法术 ID:|r";
	types.glyphProperties = "|cff66bbff雕文属性 ID:|r";
	types.icon        = "|cff80FFAA图标:|r";
	L.settingsTitle       = "鼠标提示信息";
	L.settingsDescription = "选择 idTip 要添加到鼠标提示中的信息。";
	L.settingsCategory    = "设置";
	L.aboutTitle          = "关于 idTip WotLK (SpellAndItemID)";
	L.aboutDescription    = "idTip WotLK（原名 SpellAndItemID）会直接在游戏鼠标提示中添加实用的技术信息。";
	L.author              = "作者";
	L.version             = "版本";
	L.repository          = "最新信息";
	L.translations        = "翻译";
	L.criteriaOption      = "成就条件 ID";
	L.glyphOption         = "雕文 ID";
	L.recipeOption        = "配方 ID";
	L.gemOption           = "宝石物品 ID";
	L.translationCredits  =
		"英语翻译\n" ..
		"德语翻译\n" ..
		"法语翻译\n" ..
		"西班牙语翻译（欧洲）\n" ..
		"西班牙语翻译（墨西哥）\n" ..
		"俄语翻译\n" ..
		"韩语翻译\n" ..
		"繁体中文翻译\n" ..
		"简体中文翻译";
	L.optionTooltips = {
		spell       = "在法术、技能、光环、附魔和专业技能的鼠标提示中显示法术 ID，并在可用时显示等级。";
		recipe      = "在配方链接和专业技能鼠标提示中显示配方 ID，并在可用时显示成品 ID。相同的法术或物品 ID 不会重复显示。";
		aplied      = "显示施放增益、减益或光环的单位名称，并标记由你施放的效果。";
		item        = "在物品、装备、链接和比较鼠标提示中显示物品 ID。";
		enchant     = "显示物品链接中的永久附魔 ID；不包含临时附魔。";
		gem         = "当客户端提供宝石链接时，显示已镶嵌宝石的物品 ID。";
		itemset     = "显示属于套装之物品的套装 ID。";
		unit        = "显示生物及其他非玩家单位的 NPC ID。";
		quest       = "在任务链接的鼠标提示和任务日志中显示任务 ID。";
		achievement = "在成就链接和成就窗口中显示成就 ID。";
		criteria    = "鼠标指向成就目标时显示其内部条件 ID。";
		glyph       = "在雕文链接和雕文插槽鼠标提示中显示雕文属性 ID 和雕文法术 ID。";
		icon        = "显示受支持的法术、物品、雕文和成就所使用的技术图标路径。";
	};
end

local gsub = string.gsub;
local format = string.format;
local gemFormat = types.gem;
types.gem = {format(gemFormat, 1), format(gemFormat, 2), format(gemFormat, 3)};

local function getOptionLabel(label)
	label = gsub(label, "|c%x%x%x%x%x%x%x%x", "");
	label = gsub(label, "|r", "");
	return (gsub(label, "%s*:%s*$", ""));
end

L.options = {
	spell       = getOptionLabel(types.spell),
	aplied      = getOptionLabel(types.aplied),
	item        = getOptionLabel(types.item),
	enchant     = getOptionLabel(types.enchant),
	gem         = L.gemOption,
	itemset     = getOptionLabel(types.itemset),
	unit        = getOptionLabel(types.unit),
	quest       = getOptionLabel(types.quest),
	achievement = getOptionLabel(types.achievement),
	criteria    = L.criteriaOption,
	glyph       = L.glyphOption,
	recipe      = L.recipeOption,
	icon        = getOptionLabel(types.icon),
};

addon.types = types;
addon.L = L;
