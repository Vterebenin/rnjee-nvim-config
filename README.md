# Rnjee nvim config. 

A highly opinionated Neovim setup that somehow works for me. Use at your own risk. It kind of grown on me. 

## Prerequisites

- Neovim (≥ 0.9 recommended)
- Git
- A terminal with true color support (ghostty on this machine)
- ripgrep
- Godot 4.x (for the godotdev setup below)

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

> 💡 **Treesitter pin:** this config uses the old `nvim-treesitter.configs` API, which
> requires `nvim-treesitter = v0.9.2`. `lazy-lock.json` already pins it there, so nothing
> to do. If `:Lazy sync` ever reverts it to `main`, fix with:
> ```bash
> git -C ~/.local/share/nvim/lazy/nvim-treesitter fetch --tags --force \
>   && git -C ~/.local/share/nvim/lazy/nvim-treesitter checkout v0.9.2
> ```
> Then install parsers with `:TSInstallSync gdscript godot_resource javascript typescript lua`.

### API Keys (Optional)

For AI features, add to your shell config:

```bash
export HG_API_TOKEN="your-token" # huggingface token 
export DEEPSEEK_API_TOKEN="your-token" # deepseek token
```

## 🎮 Godot Development (godotdev.nvim)

This config ships a working godotdev.nvim setup:
- `lua/ternow/plugins/habamax-godot.lua` — plugin wired up (`nvim-dap`, `nvim-dap-ui`, `nvim-treesitter` deps)
- `after/plugin/dap.lua` — Godot debug adapter on port **6006** + DAP UI auto open/close
- `after/plugin/lsp.lua` / `after/ftplugin/gdscript.lua` — gdscript indent settings (spaces, 4 wide)

### Godot → Neovim external editor ("session" scripts)

Two scripts live in `~/.local/bin` (already on PATH). They create a Neovim *session*
socket so Godot can click-open scripts into the already-running Neovim and focus its
terminal window. This works purely with nvim 0.12's native `--remote-send` / `--remote-expr`
— **no `nvr` (neovim-remote) install needed**.

**`~/.local/bin/godotdev.sh`** — starts the Neovim session (`nvim --listen /tmp/godot.nvim`), recovers stale sockets, and reuses an existing session:

```bash
#!/usr/bin/env bash
set -euo pipefail

SOCKET="${GODOT_NVIM_SOCKET:-/tmp/godot.nvim}"

if [[ -S "$SOCKET" ]]; then
  if nvim --server "$SOCKET" --remote-expr '1' >/dev/null 2>&1; then
    echo "Neovim server already running at $SOCKET"
    exit 0
  fi

  echo "Removing stale socket: $SOCKET"
  rm -f "$SOCKET"
fi

printf '\033]0;Godot-Neovim\007' # mark this terminal window
exec nvim --listen "$SOCKET" "$@"
```

**`~/.local/bin/godot-nvr.sh`** — launcher called by Godot; opens `{file}` (optionally at `+{line}`) in the session and focuses the terminal window:

```bash
#!/usr/bin/env bash
# Godot → Neovim launcher with GUI terminal focus
# Usage:
#   godot-nvr.sh [terminal_name] +{line} {file} [--tab|--vsplit]

# -----------------------------
# Arguments
# -----------------------------
DEFAULT_TERMINAL="ghostty"
ARG0="${1:-}"

if [[ -n "$ARG0" && "$ARG0" != +* && "$ARG0" != --* && ! -f "$ARG0" ]]; then
  # First argument is terminal name
  GODOT_TERMINAL="$ARG0"
  shift
else
  # No terminal argument provided, use default
  GODOT_TERMINAL="$DEFAULT_TERMINAL"
fi

SOCKET="${GODOT_NVIM_SOCKET:-/tmp/godot.nvim}" # Neovim socket path

if ! nvim --server "$SOCKET" --remote-expr '1' >/dev/null 2>&1; then
  echo "No Neovim server listening on $SOCKET (start one with godotdev.sh or nvim --listen $SOCKET)" >&2
  exit 1
fi

OPEN_MODE="window"
LINE=""
FILE=""

# -----------------------------
# Parse remaining arguments
# -----------------------------
while [[ $# -gt 0 ]]; do
   case "$1" in
     --tab) OPEN_MODE="tab"; shift ;;
     --vsplit) OPEN_MODE="vsplit"; shift ;;
     +[0-9]*) LINE="${1#+}"; shift ;;
     *) FILE="$1"; shift ;;
   esac
done

[ -z "$FILE" ] && exit 0

# -----------------------------
# Open file in Neovim
# -----------------------------
FILE_VIM="${FILE//\'/\'\\\'\'}"
case "$OPEN_MODE" in
  window) CMD=":execute 'edit ' . fnameescape('${FILE_VIM}')" ;;
  tab) CMD=":execute 'tabedit ' . fnameescape('${FILE_VIM}')" ;;
  vsplit) CMD=":execute 'vsplit ' . fnameescape('${FILE_VIM}')" ;;
esac

[ -n "$LINE" ] && CMD="$CMD | call cursor($LINE,1)"
CMD="$CMD | normal! zz"

nvim --server "$SOCKET" --remote-send "<C-\\><C-N>${CMD}<CR>"

# -----------------------------
# Focus the Neovim terminal window
# -----------------------------
if command -v hyprctl >/dev/null 2>&1; then
  # Lua-config Hyprland (0.55+) — use the structured dispatcher API
  hyprctl dispatch 'hl.dsp.focus({ window = "title:^Godot-Neovim$" })' >/dev/null 2>&1 \
    || hyprctl dispatch 'hl.dsp.focus({ window = "class:^(com.mitchellh.ghostty)$" })' >/dev/null 2>&1 \
    || hyprctl dispatch "focuswindow class:^(com\\.mitchellh\\.ghostty|ghostty)$" >/dev/null 2>&1 \
    || true
fi

# Focus GUI terminal (macOS only; no-op elsewhere)
if command -v osascript >/dev/null 2>&1; then
  osascript -e "tell application \"$GODOT_TERMINAL\" to activate"
fi
```

Recreate both on a fresh machine with:

```bash
touch ~/.local/bin/godotdev.sh ~/.local/bin/godot-nvr.sh  # then paste contents
chmod +x ~/.local/bin/godotdev.sh ~/.local/bin/godot-nvr.sh
```

> ⚠️ **Hyprland 0.55+ focus note:** `hyprctl dispatch focuswindow ...` (legacy syntax)
> no longer works on Lua-config Hyprland — it must use the structured API
> `hyprctl dispatch 'hl.dsp.focus({ window = "..." })'`. The script above already does
> this with a legacy fallback. If your WM isn't Hyprland, that block is a no-op.

### Godot editor settings

Enable **Advanced Settings** (top of the dialog), then set:

| Setting | Value |
|---|---|
| `Text Editor → External → Exec Path` | `/home/rnjee/.local/bin/godot-nvr.sh` |
| `Text Editor → External → Exec Flags` | `+{line} {file}` (or `--tab +{line} {file}` / `--vsplit +{line} {file}`) |
| `Network → Enable TCP LSP server` | ✅ on (required for GDScript LSP) |

Recommended (optional):
- `Text Editor → Behavior → Auto Reload Scripts on External Change`
- `Interface → Editor → Save on Focus Loss`
- `Interface → Editor → Import Resources When Unfocused`

### Workflow

```bash
godotdev.sh                      # 1. start the nvim session (in ghostty, or ghostty -e ~/.local/bin/godotdev.sh)
godot-nvr.sh +10 path/file.gd    # 2. test manually; opens file at line 10 + focuses ghostty
```
Then click any script in Godot → opens in the session, ghostty window comes to the front.

### Debugging (DAP)

Already configured. Keymaps (from `after/plugin/dap.lua`):
- `<leader>dt` — toggle breakpoint, `<leader>dx` — terminate
- `<leader>do` — step over, `<leader>du` — step out
- Launch config "Launch scene" (port 6006); Godot must be running the project.

### Also handy

- `:GodotRunProject`, `:GodotRunCurrentScene`, `:GodotReconnectLSP`, `:GodotDocs <Class>`
- `:checkhealth godotdev` — verify everything
- Optional formatter: install `gdscript-formatter` (or `gdformat`) for autoformat-on-save
  of `.gd` files, otherwise you'll get a warning notification.
- **Blender (this machine):** installed via Steam at
  `~/.local/share/Steam/steamapps/common/Blender/blender` (v5.2). Not on PATH;
  symlink it if you want it global.

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
- Godot LSP won't attach? Godot editor must be running AND `Network → Enable TCP LSP server` must be on
- "No Neovim server listening on /tmp/godot.nvim"? Start the session with `godotdev.sh` first
- Treesitter broken after `:Lazy sync`? Re-pin to v0.9.2 (see Installation notes)
- Godot shows "Cannot execute"? `chmod +x ~/.local/bin/godot-nvr.sh` and use the absolute path
- Unknown `.gd` filetype? Check `ftdetect/gdscript.lua` is present after clone

## Contributing

PRs are welcome if you:
- Fix my terrible code
- Add something actually useful
- Don't break my workflow

Remember: This isn't an IDE, it's my text editor with trust issues.
