<!-- markdownlint-disable MD004 MD033 -->

<div align="center">

**English** | [Русский](README_RU.md)

# idTip WotLK (SpellAndItemID)

![Lua 5.1](https://img.shields.io/badge/Lua-5.1-2C2D72?style=flat-square\&logo=lua\&logoColor=white)
![WoW 3.3.5a](https://img.shields.io/badge/WoW-3.3.5a-C79C6E?style=flat-square)
[![License](https://img.shields.io/github/license/darhanger/idTip-WotLK?style=flat-square)](https://github.com/darhanger/idTip-WotLK/blob/master/LICENSE)
[![Last Release](https://img.shields.io/github/v/release/darhanger/idTip-WotLK?style=flat-square)](https://github.com/darhanger/idTip-WotLK/releases/latest)
[![Release Downloads](https://img.shields.io/github/downloads/darhanger/idTip-WotLK/1.8/total?style=flat-square)](https://github.com/darhanger/idTip-WotLK/releases)
[![All Downloads](https://img.shields.io/github/downloads/darhanger/idTip-WotLK/total?style=flat-square)](https://github.com/darhanger/idTip-WotLK/releases)
[![Discord Server](https://img.shields.io/badge/Discord-7289DA?style=flat-square\&logo=discord\&logoColor=white)](https://discord.gg/ZKFkvrzaU4)

**idTip WotLK**, previously known as **SpellAndItemID**, is a lightweight World of Warcraft addon that adds useful technical information directly to in-game tooltips.

Designed for **World of Warcraft 3.3.5a**.

Current version: **1.8** · Updated: **2026-11-01**.

</div>

## Features

The addon automatically extends supported game tooltips with additional information useful for addon developers, server administrators, content creators and advanced players.

It can display:

* **Spell ID** — identifier and, when available, rank of a spell, aura, buff or debuff.
* **Recipe ID** — identifier of the crafting spell in recipe links and profession tooltips.
* **Result Item ID** — identifier of the item created by a recipe, when applicable.
* **Applied by** — name of the unit that applied an aura.
* **You** — highlights auras applied by the current player.
* **Item ID** — identifier of an item.
* **Item Set ID** — identifier of the set to which an item belongs.
* **Enchant ID** — identifier of a permanent enchantment applied to an item.
* **Gem Item IDs** — identifiers and names of socketed gems, shown by socket number when their links are available.
* **NPC ID** — identifier of a creature or NPC.
* **Quest ID** — identifier of a quest link, a quest log entry, or the selected quest in the log details.
* **Achievement ID** — identifier of an achievement.
* **Achievement Criteria ID** — identifier of an achievement criterion.
* **GlyphProperties ID** — identifier of the glyph's GlyphProperties record.
* **Glyph Spell ID** — identifier of the spell associated with the glyph.
* **Icon** — technical information about the associated icon.

In profession tooltips, matching recipe and spell IDs or result and item IDs are displayed only once.

Item Set IDs are resolved from bundled WotLK mapping data and do not require a custom client API or an external DBC reader at runtime.

Enchant-name data is retained in `idTip/Data`, but is not loaded or shown in tooltips.

## Tooltip examples

Depending on the selected object, spell or interface element, the addon may add lines such as:

```text
Spell ID: 12345 (Rank 1)
Recipe ID: 2657
Result Item ID: 2840
Applied by: PlayerName (You)
Item ID: 51280
Item Set ID: 883
Enchant ID: 3817
Socket 1 ID: Gem Name                         40155
NPC ID: 36597
Quest ID: 24545
Achievement ID: 4530
Achievement Criteria ID: 12345
GlyphProperties ID: 361
Glyph Spell ID: 56829
Icon: INV_Gauntlets_90Black
```

The displayed information is color-coded so that different identifier types can be recognized quickly.

## Supported tooltip types

idTip WotLK works with many standard World of Warcraft tooltips, including:

* spells and abilities;
* buffs and debuffs;
* inventory items;
* equipment;
* permanent enchants and socketed gems on equipment;
* item links;
* profession recipes and result items;
* creatures and NPCs;
* quests;
* achievements;
* achievement criteria;
* glyphs;
* icons.

Availability of particular information depends on the tooltip and the data provided by the game client.

Bundled item-set mappings cover the included WotLK data. Custom items or modified set assignments require updating [`Data/ItemSetData.lua`](idTip/Data/ItemSetData.lua).

## Installation

1. Download the latest version from the [Releases](https://github.com/darhanger/idTip-WotLK/releases) page.
2. Extract the downloaded archive.
3. Copy the addon folder into:

```text
World of Warcraft\Interface\AddOns\
```

4. Make sure the resulting folder structure looks similar to:

```text
World of Warcraft
└── Interface
    └── AddOns
        └── idTip
            ├── Data
            │   ├── GlyphData.lua
            │   └── ItemSetData.lua
            ├── Core.lua
            ├── Localization.lua
            ├── Options.lua
            └── idTip.toc
```

5. Restart the game client.

## Compatibility

* World of Warcraft **3.3.5a**
* Lua **5.1**
* Standard Blizzard interface
* Compatible with most tooltip-modifying addons

Compatibility with heavily modified custom clients or tooltip replacements may vary.

The bundled ID mappings and enchant names are accurate for BlizzLike servers using 3.3.5a data. On servers with modified items, enchants, or other game data, a bundled name or mapping may differ from the server's data.

## Usage

The addon starts working immediately. Permanent enchant and socketed gem IDs are disabled by default and can be enabled in the settings.

Simply move the cursor over a supported spell, item, NPC, quest, achievement or another interface element. The corresponding technical information will be added to its tooltip.

## Configuration

Open the Blizzard Interface Options and select **idTip WotLK** → **Settings**. You can toggle spell IDs, aura casters, item IDs, permanent enchant IDs, socketed gem item IDs, item-set IDs, NPC IDs, quest IDs, achievement and criteria IDs, glyph IDs, recipe information, and icon paths. The recipe option controls both recipe and result item IDs. Temporary enchants are not included in the enchant ID line.

Use the dedicated **Reset** button to restore all options to their defaults. The reset is applied with **Okay** and discarded with **Cancel**. The standard Blizzard **Defaults** action is also supported.

## Why use idTip WotLK?

Finding game identifiers manually can be inconvenient, especially when developing addons, configuring databases or debugging server content.

idTip WotLK provides these identifiers directly inside the game client without requiring external websites, commands or database searches.

It can be useful for:

* addon development;
* Lua scripting;
* TrinityCore and AzerothCore development;
* database editing;
* quest and achievement debugging;
* spell and aura configuration;
* identifying NPCs, items and item sets;
* testing custom server content.

## Support

For bug reports, feature requests and suggestions, use:

* [GitHub Issues](https://github.com/darhanger/idTip-WotLK/issues)

When reporting a problem, include:

* the game client or server name;
* steps required to reproduce the issue;
* Lua error text, when available;
* a screenshot of the affected tooltip.

## Contributing

Contributions are welcome.

You can help by:

* reporting bugs;
* suggesting additional tooltip types;
* improving compatibility;
* submitting pull requests;
* improving translations or documentation.

## License

This project is distributed under the terms described in the [LICENSE](https://github.com/darhanger/idTip-WotLK/blob/master/LICENSE) file.

---

<div align="center">

Made for World of Warcraft 3.3.5a

[Download](https://github.com/darhanger/idTip-WotLK/releases) · [Report an issue](https://github.com/darhanger/idTip-WotLK/issues) · [Discord](https://discord.gg/ZKFkvrzaU4)

</div>
