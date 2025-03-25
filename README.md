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
export HG_API_TOKEN="your-token" # huggingface token 
export DEEPSEEK_API_TOKEN="your-token" # deepseek token
```

## Plugin Ecosystem

Managed by [lazy.nvim](https://github.com/folke/lazy.nvim):

**Complete list of current plugins(these are LLM descriptions):**

### 🛠️ Developer Experience
- **code-companion** - Your AI pair programmer (that actually listens)
- **gitsigns** - Git blame without the shame
- **neogit** - Git magic, now with 20% more drama
- **autopairs** - Closing brackets so you don't have to
- **treesitter** - Makes your code look pretty(er)
- **typr** - Judges your typing speed mercilessly
- **dressing** - Makes vim inputs less 1990s
- **which-key** - "Wait, what does this do again?"
- **startup** - Fancy dashboard to hide slow startup
- **lualine** - Status bar with delusions of grandeur
- **barbar** - Tabs that don't suck (mostly)
- **nvim-highlight-colors** - Because #FF0000 should look red
- **noice** - Notifications that won't ruin your day
- **spectre** - Find/replace on digital steroids
- **neotree** - File explorer for keyboard warriors
- **telescope** - Fuzzy find everything, hell yeah
- **undotree** - Time machine for your mistakes

### 🎨 Colorschemes
- **catppuccin** - Like drinking latte through your eyes
- **gruvbox** - Retro vibe for hipster devs
- **rose-pine** - "I'm a designer" mode
- **shadow** - For when you code at 3AM

### 🐞 Debug Tools
- **nvim-dap** - Debugging without leaving your comfy editor  
- **plenary** - Lua utilities you'll pretend to understand  
- **nvim-dap-ui** - Makes bugs look presentable  

### 💬 Language Servers & Friends
- **mason** - App store for dev tools  
- **mason-lspconfig** - The middleman you didn't know you needed  
- **lsp-zero** - LSP without the configuration migraine  
- **lspconfig** - Official way to confuse your editor  
- **cmp-nvim-lsp** - Autocomplete that reads your mind (sometimes)  
- **luasnip** - Code templates for lazy typists  
- **rustaceanvim** - Makes Rust feel less rusty  
- **neodev** - Lua knows what Lua needs  

### 🧪 Testing
- **neotest** - Tests that don't make you testy  
- **nvim-coverage** - Shows you what you forgot to test  

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
