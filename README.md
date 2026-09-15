<!-- markdownlint-disable MD004 MD033 -->

<div align="center">

**English** | [Русский](README_RU.md)

# idTip WotLK (SpellAndItemID)

![Lua 5.1](https://img.shields.io/badge/Lua-5.1-2C2D72?style=flat-square\&logo=lua\&logoColor=white)
![WoW 3.3.5a](https://img.shields.io/badge/WoW-3.3.5a-C79C6E?style=flat-square)
[![License](https://img.shields.io/github/license/darhanger/idTip-WotLK?style=flat-square)](https://github.com/darhanger/idTip-WotLK/blob/master/LICENSE)
[![Last Release](https://img.shields.io/github/v/release/darhanger/idTip-WotLK?style=flat-square)](https://github.com/darhanger/idTip-WotLK/releases/latest)
[![Release Downloads](https://img.shields.io/github/downloads/darhanger/idTip-WotLK/1.6.1/total?style=flat-square)](https://github.com/darhanger/idTip-WotLK/releases)
[![All Downloads](https://img.shields.io/github/downloads/darhanger/idTip-WotLK/total?style=flat-square)](https://github.com/darhanger/idTip-WotLK/releases)
[![Discord Server](https://img.shields.io/badge/Discord-7289DA?style=flat-square\&logo=discord\&logoColor=white)](https://discord.gg/ZKFkvrzaU4)

**idTip WotLK**, previously known as **SpellAndItemID**, is a lightweight World of Warcraft addon that adds useful technical information directly to in-game tooltips.

Designed for **World of Warcraft 3.3.5a**.

Current version: **1.6.1** · Updated: **2026-09-15**.

</div>

## Features

The addon automatically extends supported game tooltips with additional information useful for addon developers, server administrators, content creators and advanced players.

It can display:

* **Spell ID** — identifier and, when available, rank of a spell, aura, buff or debuff.
* **Applied by** — name of the unit that applied an aura.
* **You** — highlights auras applied by the current player.
* **Item ID** — identifier of an item.
* **Item Set ID** — identifier of the set to which an item belongs.
* **NPC ID** — identifier of a creature or NPC.
* **Quest ID** — identifier of a quest.
* **Achievement ID** — identifier of an achievement.
* **Achievement Criteria ID** — identifier of an achievement criterion.
* **Glyph ID** — identifier of a glyph.
* **Icon** — technical information about the associated icon.

Item Set IDs are resolved from bundled WotLK mapping data and do not require a custom client API or an external DBC reader at runtime.

## Tooltip examples

Depending on the selected object, spell or interface element, the addon may add lines such as:

```text
Spell ID: 12345 (Rank 1)
Applied by: PlayerName (You)
Item ID: 51280
Item Set ID: 883
NPC ID: 36597
Quest ID: 24545
Achievement ID: 4530
Achievement Criteria ID: 12345
Glyph ID: 45790
Icon: INV_Gauntlets_90Black
```

The displayed information is color-coded so that different identifier types can be recognized quickly.

## Supported tooltip types

idTip WotLK works with many standard World of Warcraft tooltips, including:

* spells and abilities;
* buffs and debuffs;
* inventory items;
* equipment;
* item links;
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

## Usage

The addon starts working immediately with all supported information enabled.

Simply move the cursor over a supported spell, item, NPC, quest, achievement or another interface element. The corresponding technical information will be added to its tooltip.

## Configuration

Open the Blizzard Interface Options and select **idTip WotLK** → **Settings**. Spell IDs, aura casters, item IDs, item-set IDs, NPC IDs, quest IDs, achievement and criteria IDs, glyph IDs, and icon paths can be enabled or disabled independently.

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
