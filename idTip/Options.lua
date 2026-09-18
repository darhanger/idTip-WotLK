local addonName, addon = ...;

local CreateFrame = CreateFrame;
local GetAddOnMetadata = GetAddOnMetadata;
local InterfaceOptions_AddCategory = InterfaceOptions_AddCategory;
local pairs, type = pairs, type;
local gsub = string.gsub;
local _G = _G;
local GameTooltip = GameTooltip;

local L = addon.L;

local defaults = {
	spell       = true,
	aplied      = true,
	item        = true,
	itemset     = true,
	unit        = true,
	quest       = true,
	achievement = true,
	criteria    = true,
	glyph       = true,
	icon        = true,
};

local settings = {};
addon.settings = settings;

local function initializeSettings()
	local saved = idTipDB;
	if type(saved) == "table" and saved ~= settings then
		for key, value in pairs(saved) do
			settings[key] = value;
		end
	end

	for key, value in pairs(defaults) do
		if type(settings[key]) ~= "boolean" then
			settings[key] = value;
		end
	end

	idTipDB = settings;
end

initializeSettings();

local optionOrder = {
	"spell",
	"aplied",
	"item",
	"itemset",
	"unit",
	"quest",
	"achievement",
	"criteria",
	"glyph",
	"icon",
};

local PANEL_CONTENT_WIDTH = 390;
local OPTION_COLUMN_OFFSET = 200;
local OPTION_HIT_RIGHT_INSET = -160;
local ROOT_CATEGORY_NAME = "idTip WotLK";
local PANEL_BACKDROP = {
	bgFile = "Interface\\CharacterFrame\\UI-Party-Background",
	edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
	tile = true,
	tileSize = 32,
	edgeSize = 16,
	insets = { left = 5, right = 5, top = 5, bottom = 5 },
};

local function stylePanel(panel)
	panel:SetBackdrop(PANEL_BACKDROP);
	panel:SetBackdropColor(0.075, 0.102, 0.145, 0.92);
	panel:SetBackdropBorderColor(0.55, 0.55, 0.55, 1);
end

local optionsPanel = CreateFrame("Frame", "idTipOptionsPanel", InterfaceOptionsFramePanelContainer);
optionsPanel.name = L.settingsCategory;
optionsPanel.parent = ROOT_CATEGORY_NAME;
stylePanel(optionsPanel);

local title = optionsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge");
title:SetPoint("TOPLEFT", 20, -16);
title:SetText("idTip WotLK");

local description = optionsPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
description:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8);
description:SetWidth(PANEL_CONTENT_WIDTH);
description:SetJustifyH("LEFT");
description:SetNonSpaceWrap(true);
description:SetText(L.settingsDescription);

local settingsTitle = optionsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
settingsTitle:SetPoint("TOPLEFT", description, "BOTTOMLEFT", 0, -24);
settingsTitle:SetText(L.settingsTitle);

local pending = {};
local checkboxes = {};

local function updateCheckboxes()
	for index = 1, #optionOrder do
		local key = optionOrder[index];
		checkboxes[index]:SetChecked(pending[key]);
	end
end

local function loadPendingSettings()
	for index = 1, #optionOrder do
		local key = optionOrder[index];
		pending[key] = settings[key];
	end
end

local function loadDefaultSettings()
	for index = 1, #optionOrder do
		local key = optionOrder[index];
		pending[key] = defaults[key];
	end
	updateCheckboxes();
	optionsPanel.dirty = true;
end

local function onOptionClick(self)
	pending[self.optionKey] = self:GetChecked() and true or false;
	optionsPanel.dirty = true;
end

local function onOptionEnter(self)
	local key = self.optionKey;
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:SetText(L.options[key], 1, 0.82, 0, 1, true);
	GameTooltip:AddLine(L.optionTooltips[key], 1, 1, 1, true);
	GameTooltip:Show();
end

local function onOptionLeave(self)
	if GameTooltip:IsOwned(self) then
		GameTooltip:Hide();
	end
end

for index = 1, #optionOrder do
	local key = optionOrder[index];
	local checkbox = CreateFrame(
		"CheckButton",
		"idTipOption" .. index,
		optionsPanel,
		"InterfaceOptionsCheckButtonTemplate"
	);
	local column = index > 5 and 1 or 0;
	local row = column == 1 and index - 6 or index - 1;
	checkbox:SetHitRectInsets(0, OPTION_HIT_RIGHT_INSET, 0, 0);
	checkbox:SetPoint("TOPLEFT", settingsTitle, "BOTTOMLEFT", column * OPTION_COLUMN_OFFSET, -12 - row * 34);
	checkbox.optionKey = key;
	checkbox:SetScript("OnClick", onOptionClick);
	checkbox:SetScript("OnEnter", onOptionEnter);
	checkbox:SetScript("OnLeave", onOptionLeave);
	_G[checkbox:GetName() .. "Text"]:SetText(L.options[key]);
	checkboxes[index] = checkbox;
end

loadPendingSettings();
updateCheckboxes();

optionsPanel.refresh = function()
	if not optionsPanel.dirty then
		loadPendingSettings();
	end
	updateCheckboxes();
end;

optionsPanel.okay = function()
	if not optionsPanel.dirty then return; end

	for index = 1, #optionOrder do
		local key = optionOrder[index];
		settings[key] = pending[key];
	end
	optionsPanel.dirty = false;
end;

optionsPanel.cancel = function()
	if not optionsPanel.dirty then return; end

	loadPendingSettings();
	updateCheckboxes();
	optionsPanel.dirty = false;
end;

optionsPanel.default = loadDefaultSettings;

local eventFrame = CreateFrame("Frame");
eventFrame:RegisterEvent("ADDON_LOADED");
eventFrame:SetScript("OnEvent", function(self, _, loadedAddon)
	if loadedAddon ~= addonName then return; end

	self:UnregisterEvent("ADDON_LOADED");
	initializeSettings();
	optionsPanel.dirty = false;
	loadPendingSettings();
	updateCheckboxes();
end);

local resetButton = CreateFrame("Button", "idTipResetButton", optionsPanel, "UIPanelButtonTemplate");
resetButton:SetWidth(120);
resetButton:SetHeight(22);
resetButton:SetPoint("TOPLEFT", settingsTitle, "BOTTOMLEFT", 0, -190);
resetButton:SetText(RESET);
resetButton:SetScript("OnClick", loadDefaultSettings);

local aboutPanel = CreateFrame("Frame", "idTipAboutPanel", InterfaceOptionsFramePanelContainer);
aboutPanel.name = ROOT_CATEGORY_NAME;
stylePanel(aboutPanel);

local aboutTitle = aboutPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge");
aboutTitle:SetPoint("TOPLEFT", 20, -16);
aboutTitle:SetText(L.aboutTitle);

local aboutDescription = aboutPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
aboutDescription:SetPoint("TOPLEFT", aboutTitle, "BOTTOMLEFT", 0, -18);
aboutDescription:SetWidth(PANEL_CONTENT_WIDTH);
aboutDescription:SetJustifyH("LEFT");
aboutDescription:SetNonSpaceWrap(true);
aboutDescription:SetText(L.aboutDescription);

local repository = aboutPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
repository:SetPoint("TOPLEFT", aboutDescription, "BOTTOMLEFT", 0, -18);
repository:SetWidth(PANEL_CONTENT_WIDTH);
repository:SetJustifyH("LEFT");
repository:SetNonSpaceWrap(true);
repository:SetText(L.repository .. ": |cff66bbff" ..
	(GetAddOnMetadata(addonName, "X-Website") or "https://github.com/darhanger/idTip-WotLK") .. "|r");

local translationsTitle = aboutPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal");
translationsTitle:SetPoint("TOPLEFT", repository, "BOTTOMLEFT", 0, -24);
translationsTitle:SetText(L.translations .. ":");

local translationCredits = aboutPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
translationCredits:SetPoint("TOPLEFT", translationsTitle, "BOTTOMLEFT", 0, -8);
translationCredits:SetWidth(PANEL_CONTENT_WIDTH);
translationCredits:SetJustifyH("LEFT");
translationCredits:SetNonSpaceWrap(true);
local credits = gsub(L.translationCredits, "\n", ":|r DarhangeR\n|cffaaaaaa");
translationCredits:SetText("|cffaaaaaa" .. credits .. ":|r DarhangeR");

local author = aboutPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
author:SetPoint("BOTTOMLEFT", 20, 38);
author:SetText(L.author .. ": |cffa330c9" .. (GetAddOnMetadata(addonName, "Author") or "DarhangeR") .. "|r");

local version = aboutPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
version:SetPoint("TOPLEFT", author, "BOTTOMLEFT", 0, -4);
version:SetText(L.version .. ": |cffff5555" ..
	(GetAddOnMetadata(addonName, "Version") or "1.6.2") .. " (" ..
	(GetAddOnMetadata(addonName, "X-Date") or "2026-09-18") .. ")|r");

InterfaceOptions_AddCategory(aboutPanel);
InterfaceOptions_AddCategory(optionsPanel);
