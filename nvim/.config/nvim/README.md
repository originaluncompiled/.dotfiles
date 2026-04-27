# Neovim Config Shortcuts

Leader key: `Space`

## Files And Search

| Shortcut | Mode | What it does |
| --- | --- | --- |
| `<leader>pv` | Normal | Open netrw file explorer. |
| `<C-l>` | Normal | Toggle Neo-tree on the right. |
| `ff` | Normal | Find files with Telescope. |
| `fg` | Normal | Live grep with Telescope. |
| `<C-p>` | Normal | Find git-tracked files. |
| `<leader>pws` | Normal | Search current word. |
| `<leader>pWs` | Normal | Search current WORD. |
| `<leader>ps` | Normal | Prompt for text to grep. |
| `<leader>vh` | Normal | Search help tags. |

## Editing

| Shortcut | Mode | What it does |
| --- | --- | --- |
| `J` / `K` | Visual | Move selected lines down/up. |
| `<` / `>` | Visual | Indent and keep the selection. |
| `J` | Normal | Join next line without moving cursor. |
| `<C-d>` / `<C-u>` | Normal | Half-page down/up and recenter. |
| `n` / `N` | Normal | Next/previous search result and recenter. |
| `<leader>p` | Visual | Paste over selection without replacing yank. |
| `<leader>y` | Normal/Visual | Yank to system clipboard. |
| `<leader>Y` | Normal | Yank line to system clipboard. |
| `<leader>d` | Normal/Visual | Delete without yanking. |
| `<C-c>` | Insert | Escape insert mode. |
| `Q` | Normal | Disabled. |
| `<leader>s` | Normal | Start project-wide replace for word under cursor. |
| `<leader>x` | Normal | Make current file executable. |
| `<leader>ee` | Normal | Insert a Go `if err != nil` block. |
| `<leader><leader>` | Normal | Source the current file. |

## LSP And Diagnostics

| Shortcut | Mode | What it does |
| --- | --- | --- |
| `gd` | Normal | Go to definition. |
| `K` | Normal | Hover docs. |
| `<leader>vws` | Normal | Workspace symbol search. |
| `<leader>vd` | Normal | Show diagnostic float. |
| `<leader>vca` | Normal | Code actions. |
| `<leader>vrr` | Normal | References. |
| `<leader>vrn` | Normal | Rename symbol. |
| `<C-h>` | Insert | Signature help. |
| `[d` / `]d` | Normal | Next/previous diagnostic. |
| `<leader>fr` | Normal | Format buffer. |

## Lists And Navigation

| Shortcut | Mode | What it does |
| --- | --- | --- |
| `<C-k>` / `<C-j>` | Normal | Next/previous quickfix item. |
| `<leader>k` / `<leader>j` | Normal | Next/previous location-list item. |
| `<leader>tt` | Normal | Toggle Trouble. |
| `[t` / `]t` | Normal | Next/previous Trouble item. |

## Git

| Shortcut | Mode | What it does |
| --- | --- | --- |
| `<leader>gs` | Normal | Open Fugitive Git status. |
| `<leader>p` | Fugitive | Git push. |
| `<leader>P` | Fugitive | Git pull --rebase. |
| `<leader>t` | Fugitive | Start `Git push -u origin ...`. |
| `gu` | Normal | Take left side of diff conflict. |
| `gh` | Normal | Take right side of diff conflict. |
| `<leader>gp` | Normal | Preview current hunk inline. |
| `<leader>gb` | Normal | Toggle current-line blame. |

## Plugins And Tools

| Shortcut | Mode | What it does |
| --- | --- | --- |
| `<leader>u` | Normal | Toggle Undotree. |
| `<leader>zz` | Normal | Toggle Zen Mode, width 90, with numbers. |
| `<leader>zZ` | Normal | Toggle Zen Mode, width 80, no numbers. |
| `<leader>tc` | Normal | Run nearest test. |
| `<leader>tf` | Normal | Run tests in current file. |
| `<leader>nf` | Normal | Generate function docs. |
| `<leader>nt` | Normal | Generate type docs. |
| `<leader>vwm` | Normal | Start Vim With Me. |
| `<leader>svwm` | Normal | Stop Vim With Me. |
| `<leader>vpp` | Normal | Edit the old packer config. |
| `<leader>mr` | Normal | Make it rain. |
| `<C-f>` | Normal | Open tmux-sessionizer in a new tmux window. |

## Snippets

| Shortcut | Mode | What it does |
| --- | --- | --- |
| `<C-s>e` | Insert | Expand snippet. |
| `<C-s>;` | Insert/Select | Jump to next snippet field. |
| `<C-s>,` | Insert/Select | Jump to previous snippet field. |
| `<C-E>` | Insert/Select | Cycle snippet choice. |

## Opencode

| Shortcut | Mode | What it does |
| --- | --- | --- |
| `<leader>ai` | Normal/Terminal | Toggle opencode. |
| `<leader>oa` | Normal/Visual | Ask opencode about current context. |
| `<leader>op` | Normal/Visual | Prompt opencode with current context. |
| `<C-w>` | Opencode terminal | Send a window command from terminal mode. |
