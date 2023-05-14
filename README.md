# NvChad custom configuration

This NvChad custom configuration is used by
[Lazyman](https://github.com/doctorfree/nvim-lazyman) as the custom add-on for
[NvChad](https://github.com/NvChad/NvChad).

Installation and initialization are performed by the `lazyman -c` command.

## Features

- Automated installation of language servers, formatters, linters, and parsers
- Advanced LSP configuration with diagnostics and convenience keymaps
- Automated installation and initialization with `lazyman -c` command
- NvChad dashboard ([nvdash](https://github.com/NvChad/ui)) enhancements
  - Hide statusline and tabline when in dashboard
  - Random dashboard header selection
  - Customized menu
- Set mapleader and maplocalleader to `comma` rather than `space`
- Convenience keymap `semi-colon` enters command mode
- Replace [nvterm](https://github.com/NvChad/nvterm) with [terminal.nvim](https://github.com/rebelot/terminal.nvim)
- Preconfigured autocmds and keymaps for easy execution of terminal and editor commands

## Command keymaps

| **Command** | **Keymap** | **Description**       |
| ----------- | ---------- | --------------------- |
| Lazy        | `,P`       | Lazy plugin manager   |
| Mason       | `,M`       | Mason package manager |
| Htop        | `,H`       | Htop system monitor   |
| Lazygit     | `,G`       | Lazygit command       |
| Lazyman     | `,L`       | Lazyman main menu     |
| Lazyconf    | `,C`       | Lazyman configuration |

## Convenience keymaps

| **Keymap** | **Description**                |
| ---------- | ------------------------------ |
| `,tt`      | Toggle theme                   |
| `,tT`      | Toggle transparency            |
| `,cs`      | Symbols outline                |
| `,de`      | Open floating diagnostic       |
| `,dt`      | Toggle diagnostics             |
| `,dq`      | Set diagnostics location list  |
| `,ts`      | Terminal send                  |
| `,to`      | Terminal toggle                |
| `,tO`      | New Terminal toggle            |
| `,tr`      | Terminal run                   |
| `,tR`      | New Terminal run               |
| `,tk`      | Terminal kill                  |
| `,t]`      | Terminal next                  |
| `,t[`      | Terminal prev                  |
| `,tl`      | Terminal move below right      |
| `,tL`      | Terminal move bottom right     |
| `,th`      | Terminal move below right new  |
| `,tH`      | Terminal move bottom right new |
| `,tf`      | Terminal move float            |
| `,q`       | Quit                           |

