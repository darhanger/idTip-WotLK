local strfind, strmatch, strsub = string.find, string.match, string.sub;
local next, tonumber, tostring, type, select = next, tonumber, tostring, type, select;
local GetLocale, UnitName, UnitGUID, GetGlyphSocketInfo = GetLocale, UnitName, UnitGUID, GetGlyphSocketInfo;
local GetItemIcon, GetSpellInfo, GetAchievementInfo = GetItemIcon, GetSpellInfo, GetAchievementInfo;
local UnitBuff, UnitDebuff, UnitAura, UnitIsPlayer = UnitBuff, UnitDebuff, UnitAura, UnitIsPlayer;
local CreateFrame, hooksecurefunc, IsAddOnLoaded = CreateFrame, hooksecurefunc, IsAddOnLoaded;
local _G = _G;

local GameTooltip = GameTooltip;
local ItemRefTooltip = ItemRefTooltip;
local ItemRefShoppingTooltip1 = ItemRefShoppingTooltip1;
local ItemRefShoppingTooltip2 = ItemRefShoppingTooltip2;
local ShoppingTooltip1 = ShoppingTooltip1;
local ShoppingTooltip2 = ShoppingTooltip2;

local types = {
	spell       = "Spell ID:",
	aplied		= "Applied by:",
	item        = "Item ID:",
	unit        = "NPC ID:",
	quest       = "Quest ID:",
	achievement = "Achievement ID:",
	glyph 		= "Glyph ID:",
	icon        = "|cff80FFAAIcon:|r",
};

if (GetLocale() == "ruRU") then
	types.spell       = "ID заклинания:"
	types.aplied      = "Наложено:"
	types.item        = "ID предмета:"
	types.unit        = "ID НИП:"
	types.quest       = "ID задания:"
	types.achievement = "ID достижения:"
	types.glyph		  = "ID символа:"
	types.icon        = "|cff80FFAAИконка:|r"
end;

-- Lightweight caches ----------------------------------------------------------
local glyphIdCache = {};
local linkToItemIdCache = {};
local unitIdCache = {};
local spellIdCache = {};
local spellIconPathCache = {};
local itemIconPathCache = {};
local achievementIconPathCache = {};

-- Bound caches on insertion so no frame-wide cleanup callback is needed.
local MAX_CACHE_SIZE = 1024;
local CACHE_SIZE_KEY = {};

local function setCachedValue(cache, key, value)
	if cache[key] == nil then
		local size = cache[CACHE_SIZE_KEY] or 0;
		if size >= MAX_CACHE_SIZE then
			local expiredKey = next(cache);
			if expiredKey == CACHE_SIZE_KEY then
				expiredKey = next(cache, expiredKey);
			end
			if expiredKey ~= nil then
				cache[expiredKey] = nil;
				size = size - 1;
			end
		end
		cache[CACHE_SIZE_KEY] = size + 1;
	end
	cache[key] = value;
end

-- Precompiled patterns --------------------------------------------------------
local ITEM_ID_PATTERN = "item:(%d+)";
local SPELL_ID_PATTERN = "^spell:(%d+)";

-- Tooltip state avoids scanning named FontStrings and allocating lookup strings
-- every time overlapping tooltip hooks fire.
local tooltipStates = {};

local function clearTooltipState(tooltip)
	local state = tooltipStates[tooltip];
	if state then
		state.generation = state.generation + 1;
	end
end

local function registerTooltip(tooltip)
	local name = tooltip:GetName();
	tooltipStates[tooltip] = {
		generation = 0,
		hasLines = -1,
		linePrefix = name .. "Text",
		leftLines = {},
		rightLines = {},
	};
	tooltip:HookScript("OnTooltipCleared", clearTooltipState);
end

registerTooltip(GameTooltip);
registerTooltip(ItemRefTooltip);
registerTooltip(ItemRefShoppingTooltip1);
registerTooltip(ItemRefShoppingTooltip2);
registerTooltip(ShoppingTooltip1);
registerTooltip(ShoppingTooltip2);

local function getTooltipLine(state, index)
	local left = state.leftLines[index];
	if not left then
		left = _G[state.linePrefix .. "Left" .. index];
		state.leftLines[index] = left;
	end

	local right = state.rightLines[index];
	if not right then
		right = _G[state.linePrefix .. "Right" .. index];
		state.rightLines[index] = right;
	end

	return left, right;
end

local function addLine(tooltip, id, label)
	if id == nil or id == false then return false; end

	local state = tooltipStates[tooltip];
	local generation = state.generation;
	if state[label] == generation then
		return false;
	end

	tooltip:AddDoubleLine(label, id, nil, nil, nil, 1, 1, 1);
	state[label] = generation;
	state.hasLines = generation;
	return true;
end;

local function addSpacerLine(tooltip)
	local state = tooltipStates[tooltip];
	local generation = state.generation;
	if state.hasLines == generation then
		return false;
	end

	local numLines = tooltip:NumLines() or 0;
	if numLines > 0 then
		local left, right = getTooltipLine(state, numLines);
		local leftText = left and left:GetText();
		local rightText = right and right:GetText();
		if (not leftText or leftText == "" or leftText == " ") and
			(not rightText or rightText == "") then
			return false;
		end
	end

	tooltip:AddLine(" ");
	state.hasLines = generation;
	return true;
end;

local ICON_PREFIX = "Interface\\Icons\\";
local ICON_PREFIX_ALT = "Interface/Icons/";
local ICON_PREFIX_LENGTH = #ICON_PREFIX;
local ICON_PREFIX_ALT_LENGTH = #ICON_PREFIX_ALT;

local function normalizeIconPath(icon)
	if not icon then return nil; end
	if type(icon) ~= "string" then
		icon = tostring(icon);
	end
	if icon == "" then return nil; end

	if strfind(icon, ICON_PREFIX, 1, true) == 1 then
		return strsub(icon, ICON_PREFIX_LENGTH + 1);
	end
	if strfind(icon, ICON_PREFIX_ALT, 1, true) == 1 then
		return strsub(icon, ICON_PREFIX_ALT_LENGTH + 1);
	end
	return icon;
end

local function getCachedSpellIcon(id, knownIcon)
	local icon = spellIconPathCache[id];
	if icon ~= nil then
		if icon ~= false or not knownIcon then
			return icon ~= false and icon or nil;
		end
	end

	if not knownIcon then
		knownIcon = select(3, GetSpellInfo(id));
	end
	icon = normalizeIconPath(knownIcon) or false;
	setCachedValue(spellIconPathCache, id, icon);
	return icon ~= false and icon or nil;
end

local function getCachedItemIcon(id)
	local icon = itemIconPathCache[id];
	if icon == nil then
		icon = normalizeIconPath(GetItemIcon(id)) or false;
		setCachedValue(itemIconPathCache, id, icon);
	end
	return icon ~= false and icon or nil;
end

local function getCachedAchievementIcon(id)
	local icon = achievementIconPathCache[id];
	if icon == nil then
		icon = normalizeIconPath(select(10, GetAchievementInfo(id))) or false;
		setCachedValue(achievementIconPathCache, id, icon);
	end
	return icon ~= false and icon or nil;
end

local function addIconLine(tooltip, icon)
	return addLine(tooltip, icon, types.icon);
end

local function addIdBlock(tooltip, id, label, icon)
	local changed = addSpacerLine(tooltip);
	changed = addLine(tooltip, id, label) or changed;
	changed = addIconLine(tooltip, icon) or changed;
	return changed;
end

-- For Linked Tooltips --------------------------------------------------------
local function onSetHyperlink(self, link)
    if not link then return; end

    local linkType, id = strmatch(link, "^(%a+):(%d+)");
    if not id then return; end
    id = tonumber(id);

    local changed;
    if linkType == "spell" or linkType == "enchant" or linkType == "trade" then
        changed = addIdBlock(self, id, types.spell, getCachedSpellIcon(id));
    elseif linkType == "quest" then
        changed = addIdBlock(self, id, types.quest);
    elseif linkType == "achievement" then
        changed = addIdBlock(self, id, types.achievement, getCachedAchievementIcon(id));
    end

    if changed then
        self:Show();
    end
end;
hooksecurefunc(ItemRefTooltip, "SetHyperlink", onSetHyperlink);
hooksecurefunc(GameTooltip, "SetHyperlink", onSetHyperlink);

-- Spell Hooks ----------------------------------------------------------------
local function attachAura(self, getter, ...)
    local _, _, icon, _, _, _, _, unitCaster, _, _, spellId = getter(...);
    local changed = false;

    if spellId then
        changed = addIdBlock(self, spellId, types.spell, getCachedSpellIcon(spellId, icon));
    end
    if unitCaster then
        local exactname = UnitName(unitCaster);
        changed = addLine(self, exactname, types.aplied) or changed;
    end

    if changed then
        self:Show();
    end
end;
hooksecurefunc(GameTooltip, "SetUnitBuff",   function(self, ...) attachAura(self, UnitBuff,   ...) end);
hooksecurefunc(GameTooltip, "SetUnitDebuff", function(self, ...) attachAura(self, UnitDebuff, ...) end);
hooksecurefunc(GameTooltip, "SetUnitAura",   function(self, ...) attachAura(self, UnitAura,   ...) end);

local tooltip = ItemRefTooltip;
local function onSetItemRef(link)
	if not link then return; end

	local id = spellIdCache[link];
	if id == nil then
		id = tonumber(strmatch(link, SPELL_ID_PATTERN)) or false;
		setCachedValue(spellIdCache, link, id);
	end
	if id and addIdBlock(tooltip, id, types.spell, getCachedSpellIcon(id)) then
		tooltip:Show();
	end
end
hooksecurefunc("SetItemRef", onSetItemRef);

local function attachSpellTooltip(self)
	local _, _, id = self:GetSpell();
	if id and addIdBlock(self, id, types.spell, getCachedSpellIcon(id)) then
		self:Show();
	end
end
GameTooltip:HookScript("OnTooltipSetSpell", attachSpellTooltip);

-- NPCs Hooks ----------------------------------------------------------------
GameTooltip:HookScript("OnTooltipSetUnit", function(self)
    local _, unit = self:GetUnit();
    if not unit or UnitIsPlayer(unit) then return; end

    local guid = UnitGUID(unit);
    if not guid then return; end

    local id = unitIdCache[guid];
    if id == nil then
        id = tonumber(strsub(guid, -11, -7), 16) or false;
        setCachedValue(unitIdCache, guid, id);
    end

    if id and addIdBlock(self, id, types.unit) then
        self:Show();
    end
end);

-- Items Hooks ----------------------------------------------------------------
local function attachItemTooltip(self)
	local _, link = self:GetItem();
	if not link then return; end

	local id = linkToItemIdCache[link];
	if id == nil then
		id = tonumber(strmatch(link, ITEM_ID_PATTERN)) or false;
		setCachedValue(linkToItemIdCache, link, id);
	end
	if id and addIdBlock(self, id, types.item, getCachedItemIcon(id)) then
		self:Show();
	end
end;

-- Glyphs Hooks ----------------------------------------------------------------
local function attachGlyphTooltip(self, arg1, arg2)
	if arg1 == nil then return; end

	local socketCache = glyphIdCache[arg1];
	if not socketCache then
		socketCache = {};
		glyphIdCache[arg1] = socketCache;
	end

	local groupKey = arg2;
	if groupKey == nil then
		groupKey = false;
	end

	local id = socketCache[groupKey];
	local icon;
	if id == nil then
		local _, _, resolvedId, resolvedIcon = GetGlyphSocketInfo(arg1, arg2);
		id = resolvedId or false;
		icon = resolvedIcon;
		socketCache[groupKey] = id;
	end

	if id and addIdBlock(self, id, types.glyph, getCachedSpellIcon(id, icon)) then
		self:Show();
	end
end
hooksecurefunc(GameTooltip, "SetGlyph", attachGlyphTooltip);

GameTooltip:HookScript("OnTooltipSetItem", attachItemTooltip);
ItemRefTooltip:HookScript("OnTooltipSetItem", attachItemTooltip);
ItemRefShoppingTooltip1:HookScript("OnTooltipSetItem", attachItemTooltip);
ItemRefShoppingTooltip2:HookScript("OnTooltipSetItem", attachItemTooltip);
ShoppingTooltip1:HookScript("OnTooltipSetItem", attachItemTooltip);
ShoppingTooltip2:HookScript("OnTooltipSetItem", attachItemTooltip);

-- Achievement Frame Hooks -----------------------------------------------------
local function onAchievementEnter(button)
	local id = button.id;
	if not id then return; end

	GameTooltip:SetOwner(button, "ANCHOR_NONE");
	GameTooltip:SetPoint("TOPLEFT", button, "TOPRIGHT", 0, 0);
	addLine(GameTooltip, id, types.achievement);
	addIconLine(GameTooltip, getCachedAchievementIcon(id));
	GameTooltip:Show();
end

local function onAchievementLeave()
	GameTooltip:Hide();
end

local function hookAchievementButtons()
	local container = AchievementFrameAchievementsContainer;
	local buttons = container and container.buttons;
	if not buttons then return; end

	for i = 1, #buttons do
		local button = buttons[i];
		button:HookScript("OnEnter", onAchievementEnter);
		button:HookScript("OnLeave", onAchievementLeave);
	end
end

if IsAddOnLoaded("Blizzard_AchievementUI") then
	hookAchievementButtons();
else
	local achievementLoader = CreateFrame("Frame");
	achievementLoader:RegisterEvent("ADDON_LOADED");
	achievementLoader:SetScript("OnEvent", function(self, _, addon)
		if addon ~= "Blizzard_AchievementUI" then return; end

		hookAchievementButtons();
		self:UnregisterEvent("ADDON_LOADED");
		self:SetScript("OnEvent", nil);
	end);
end
