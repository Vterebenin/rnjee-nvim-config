# Rnjee nvim config. 

A highly opinionated Neovim setup that somehow works for me. Use at your own risk. It kind of grown on me. 

## Prerequisites

- Neovim (≥ 0.9 recommended)
- Git
- A terminal with true color support(i use [warp](https://www.warp.dev/))

## Old Screenshots

| Editor View | File Browser |
|-------------|--------------|
| <img width="530" alt="Main Editor" src="https://github.com/Vterebenin/rnjee-nvim-config/assets/38083529/b08bb532-6ddb-40b2-b7c3-f7d9c29f3ab6"> | <img width="953" alt="NeoTree" src="https://github.com/Vterebenin/rnjee-nvim-config/assets/38083529/42853008-b123-4320-8cd9-c274a95baabb"> |

## Installation

```bash
git clone https://github.com/Vterebenin/rnjee-nvim-config ~/.config/nvim
```

1. Launch Neovim - plugins will auto-install via [lazy.nvim](https://github.com/folke/lazy.nvim)
2. If nothing happens, force sync with `:Lazy sync`
3. Verify setup with `:checkhealth lazy`

### API Keys (Optional)

For AI features, add to your shell config:

```bash
export HG_API_TOKEN="your-token"       
export DEEPSEEK_API_TOKEN="your-token" 
```

## Plugin Ecosystem

Managed by [lazy.nvim](https://github.com/folke/lazy.nvim):

**Complete list of current plugins(these are LLM descriptions):**

- **Developer Experience:**
    - **code-companion** - AI-powered coding assistance
    - **gitsigns** - Git status in sign column
    - **neogit** - Magit-like Git interface
    - **autopairs** - Auto-close brackets/parentheses
    - **treesitter** - Syntax highlighting and parsing
    - **typr** - Typing speed analytics
    - **dressing** - Better UI for vim inputs
    - **which-key** - Keybindings cheat sheet
    - **startup** - Custom startup screen
    - **lualine** - Status line replacement
    - **barbar** - Tab bar for buffers
    - **nvim-highlight-colors** - Color code visualizer
    - **noice** - Modern notification system
    - **spectre** - Find/replace across files
    - **neotree** - File explorer sidebar
    - **telescope** - Fuzzy finder utility
    - **undotree** - Visual undo history
- **Colorschemes:**
    - **catppuccin** – Soothing pastel color theme
    - **gruvbox** – Retro, low-contrast color scheme
    - **rose-pine** – Elegant muted color palette
    - **shadow** – Subtle, soft dark theme
- **Debug:**
    - **nvim-dap** – Debug Adapter Protocol client  
    - **plenary** – Lua utility functions library  
    - **nvim-dap-ui** – UI for debugging sessions  
- **Language servers and stuff around it:**
    - **mason** – LSP/DAP/linter/formatter installer  
    - **mason-lspconfig** – Mason ↔ LSP config bridge  
    - **lsp-zero** – Simplified LSP setup helper  
    - **lspconfig** – Official LSP client configs  
    - **cmp-nvim-lsp** – LSP completions for nvim-cmp  
    - **luasnip** – Snippet engine for Neovim  
    - **rustaceanvim** – Feature-rich Rust LSP integration  
    - **neodev** – Lua LSP development tools  
- **Tests:**
    - **neotest** – Extensible testing framework for Neovim  
    - **nvim-coverage** – Code coverage visualization tool  

## Customization

This config is:
- ❌ Not beginner-friendly
- ❌ Not minimal
- ❌ Not well-documented
- ✔️ Mine

If you want to adapt it:
1. Check `lua/ternow/` for module configurations
2. Bring your own patience

## Troubleshooting

Common issues:
- AI is a paid deepseek currently, configure it yourself
- LSP not working? Run `:Mason` to install servers
- Weird behavior? It's probably a feature

## Contributing

PRs are welcome if you:
- Fix my terrible code
- Add something actually useful
- Don't break my workflow

Remember: This isn't an IDE, it's my text editor with trust issues.
