# My Neovim Configuration

This thing is my Neovim configuration! This setup is nothing, but monstrosity with custom preferences without any real direction in use. 

## Prerequisites

Before getting started, make sure you have the following prerequisites installed:

- Neovim (v0.5.0+ recommended)
- Git

## Photos

<img width="530" alt="image" src="https://github.com/Vterebenin/rnjee-nvim-config/assets/38083529/b08bb532-6ddb-40b2-b7c3-f7d9c29f3ab6">
<img width="953" alt="image" src="https://github.com/Vterebenin/rnjee-nvim-config/assets/38083529/42853008-b123-4320-8cd9-c274a95baabb">

## Installation

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/Vterebenin/rnjee-nvim-config ~/.config/nvim
    ```

2. Open Neovim and run the following command to install plugins using `lazy`:

    ```vim
    :Lazy
    ```

    This will automatically install and configure all the plugins specified in the configuration. (press U if nothing happened)
    Also it worth to checkhealth on Lazy, so everything is fine.

    ```vim
    :checkhealth lazy
    ```

## Plugins

I use the [lazy](https://github.com/folke/lazy.nvim) plugin manager.

**List of current plugins(todo: add links):**

- **Plugins Included:**
  - lazy.nvim - the manager itself
  - LuaSnip - lua snippets and stuff
  - lualine.nvim - another lua shit
  - diffview.nvim - git diff view
  - dressing.nvim - better modals
  - gitsigns.nvim - git inline help for hunk actions
  - neogit - git integration
  - harpoon - feels like i was selled out by this, not really using it
  - image.nvim - images preview
  - kanagawa.nvim - my theme
  - lsp-zero.nvim - this guy have a fancy chair in my plugins room
  - mason.nvim - this is the servent of the guy above
  - nvim-lspconfig - this is the maid of the plugins above
  - neo-tree.nvim - my tree, but i wasn't a planter 
  - neodev.nvim - this thing helps developing config
  - neoformat - formatter, probably?
  - nui.nvim - idk
  - nvim-cmp - autocompletes
  - nvim-treesitter - my man
  - nvim-web-devicons - icons and shit
  - rust-tools.nvim - uhum, rust, yep
  - startup.nvim - my fancy startup page
  - telescope.nvim - this thing look things up
  - undotree - never really using it, but might come handy one day
  - which-key.nvim - keymaps documentations
}

## Customization

Customize at your own risk. I dont bother well documenting this abomination, nope, not happening.

## Troubleshooting

If you encounter any issues or have questions, well, bad for you. Figure it out yourself. Git gud, dude.

## Contributing

Contributions are acceptable... If you have suggestions, improvements, or bug fixes, feel free to open a pull request.

