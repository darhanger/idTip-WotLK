<!-- markdownlint-disable MD004 MD033 -->

<div align="center">

**English** | [Русский](README_RU.md)

# idTip WotLK (SpellAndItemID)

![Lua 5.1](https://img.shields.io/badge/Lua-5.1-2C2D72?style=flat-square\&logo=lua\&logoColor=white)
![WoW 3.3.5a](https://img.shields.io/badge/WoW-3.3.5a-C79C6E?style=flat-square)
[![License](https://img.shields.io/github/license/darhanger/idTip-WotLK?style=flat-square)](https://github.com/darhanger/idTip-WotLK/blob/master/LICENSE)
[![Last Release](https://img.shields.io/github/v/release/darhanger/idTip-WotLK?style=flat-square)](https://github.com/darhanger/idTip-WotLK/releases/latest)
[![Release Downloads](https://img.shields.io/github/downloads/darhanger/idTip-WotLK/1.5/total?style=flat-square)](https://github.com/darhanger/idTip-WotLK/releases)
[![All Downloads](https://img.shields.io/github/downloads/darhanger/idTip-WotLK/total?style=flat-square)](https://github.com/darhanger/idTip-WotLK/releases)
[![Discord Server](https://img.shields.io/badge/Discord-7289DA?style=flat-square\&logo=discord\&logoColor=white)](https://discord.gg/ZKFkvrzaU4)

**idTip WotLK**, previously known as **SpellAndItemID**, is a lightweight World of Warcraft addon that adds useful technical information directly to in-game tooltips.

Designed for **World of Warcraft 3.3.5a**.

</div>

## Features

The addon automatically extends supported game tooltips with additional information useful for addon developers, server administrators, content creators and advanced players.

It can display:

* **Spell ID** — identifier of a spell, aura, buff or debuff.
* **Applied by** — name of the unit that applied an aura.
* **You** — highlights auras applied by the current player.
* **Item ID** — identifier of an item.
* **NPC ID** — identifier of a creature or NPC.
* **Quest ID** — identifier of a quest.
* **Achievement ID** — identifier of an achievement.
* **Criteria ID** — identifier of an achievement criterion.
* **Glyph ID** — identifier of a glyph.
* **Icon** — technical information about the associated icon.

## Tooltip examples

Depending on the selected object, spell or interface element, the addon may add lines such as:

```text
Spell ID: 12345
Applied by: PlayerName (You)
Item ID: 6948
NPC ID: 36597
Quest ID: 24545
Achievement ID: 4530
Criteria ID: 12345
Glyph ID: 45790
Icon: Interface\Icons\INV_Misc_QuestionMark
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
            ├── idTip.toc
            └── ...
```

5. Restart the game client

## Compatibility

* World of Warcraft **3.3.5a**
* Lua **5.1**
* Standard Blizzard interface
* Compatible with most tooltip-modifying addons

Compatibility with heavily modified custom clients or tooltip replacements may vary.

## Usage

The addon works automatically and does not require configuration.

Simply move the cursor over a supported spell, item, NPC, quest, achievement or another interface element. The corresponding technical information will be added to its tooltip.

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
* identifying NPCs and items;
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
