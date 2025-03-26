# Rnjee nvim config. 

A highly opinionated Neovim setup that somehow works for me. Use at your own risk. It kind of grown on me. 

## Prerequisites

- Neovim (≥ 0.9 recommended)
- Git
- A terminal with true color support(i use [warp](https://www.warp.dev/))
- ripgrep

## Old Screenshots

| Editor View | File Browser |
|-------------|--------------|
| <img width="530" alt="Main Editor" src="https://github.com/Vterebenin/rnjee-nvim-config/assets/38083529/b08bb532-6ddb-40b2-b7c3-f7d9c29f3ab6"> | <img width="953" alt="NeoTree" src="https://github.com/Vterebenin/rnjee-nvim-config/assets/38083529/42853008-b123-4320-8cd9-c274a95baabb"> |

## Installation (install dependencies first!)

```bash
git clone https://github.com/Vterebenin/rnjee-nvim-config ~/.config/nvim
```

1. Launch Neovim - plugins will auto-install via [lazy.nvim](https://github.com/folke/lazy.nvim)
2. If nothing happens, force sync with `:Lazy sync`
3. Verify setup with `:checkhealth lazy`

### API Keys (Optional)

For AI features, add to your shell config:

```bash
export HG_API_TOKEN="your-token" # huggingface token 
export DEEPSEEK_API_TOKEN="your-token" # deepseek token
```

## Plugin Ecosystem

Managed by [lazy.nvim](https://github.com/folke/lazy.nvim):

**Complete list of current plugins:**

### 🛠️ Developer Experience
- **code-companion** - My AI pair programmer (he actually listens)
- **gitsigns** - Git alchemy
- **neogit** - Git magic
- **autopairs** - Closing brackets so i don't have to
- **treesitter** - Makes my code look pretty(er)
- **typr** - Judges my typing speed
- **dressing** - Makes vim inputs less 1990s
- **which-key** - "Wait, what does this do again?"
- **startup** - Fancy dashboard, sure thing
- **lualine** - Status bar... ok
- **barbar** - Tabs that don't suck (mostly)
- **nvim-highlight-colors** - Because #FF0000 should be red
- **noice** - Notifications should look ok...
- **spectre** - Find/replace but better than usual
- **neotree** - File explorer, because i want it
- **telescope** - Fuzzy find everything, hell yeah
- **undotree** - Time machine for my mistakes

### 🎨 Colorschemes
- **catppuccin** - Like drinking latte through my eyes
- **gruvbox** - Retro vibe for hipster devs
- **rose-pine** - "I'm a designer" mode
- **shadow** - For when you code at 3AM

### 🐞 Debug Tools
- **nvim-dap** - Debugging without leaving my comfy editor  
- **plenary** - Lua utilities you'll pretend to understand  
- **nvim-dap-ui** - Makes bugs look presentable  

### 💬 Language Servers & Friends
- **mason** - lsp installer, uhum  
- **mason-lspconfig** - The middleman I didn't know I needed  
- **lsp-zero** - LSP without the configuration migraine  
- **lspconfig** - Official way to confuse my editor  
- **cmp-nvim-lsp** - Autocomplete for lspzero, i think  
- **luasnip** - This shit is in every lua plugin, i've needed, idk 
- **rustaceanvim** - Rusty stuff for rust
- **neodev** - Lua knows what Lua needs  

### 🧪 Testing
- **neotest** - Tests that don't make you testy  
- **nvim-coverage** - Shows you what you forgot to test  

## Customization

This config is:
- ❌ Not beginner-friendly
- ❌ Not minimal
- ❌ Not well-documented
- ❌ Furry based
- ❌ Efficient
- ✔️ Mine

If you want to adapt it:
1. Check `lua/ternow/` for module configurations
2. Bring your own patience

## Troubleshooting

Common issues:
- AI is a paid deepseek currently, configure it
- LSP not working? Run `:Mason` to install servers
- Weird behavior? It's probably a feature

## Contributing

PRs are welcome if you:
- Fix my terrible code
- Add something actually useful
- Don't break my workflow

Remember: This isn't an IDE, it's my text editor with trust issues.
