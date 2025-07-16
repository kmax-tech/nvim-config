-- "in- Neovim Configuration (Logically Ordered)

local indent = 4  -- Set indentation size

-- === Editor Behavior ===
local opt = vim.opt
opt.hidden = true           -- Enable background buffers (switch buffers without saving)
opt.equalalways = true      -- Keep window sizes equal when closing one
opt.lazyredraw = true       -- Improves performance by not redrawing during macros/scripts

-- === Indentation & Tabs ===
opt.expandtab = true        -- Use spaces instead of tabs
opt.tabstop = indent        -- Display width of a tab
opt.softtabstop = indent    -- Number of spaces a <Tab> counts for in insert mode
opt.shiftwidth = indent     -- Number of spaces used for auto-indent

-- === Line Numbers & Cursor ===
opt.number = true           -- Show line numbers
-- opt.relativenumber = true -- Enable relative line numbers (commented out)
opt.cursorline = true       -- Highlight the current line
-- opt.cursorcolumn = true     -- Highlight the current column
opt.cursorlineopt = "both"  -- Highlight line and number

-- === Searching & Replacements ===
opt.ignorecase = true       -- Ignore case in searches
opt.hlsearch = true         -- Highlight search matches
opt.incsearch = true        -- Show matches while typing
opt.inccommand = "split"    -- Live preview for :substitute command

-- === Clipboard & Backspace ===
opt.clipboard = "unnamedplus" -- Use system clipboard, instead of vims own registers
opt.backspace = { "indent", "eol", "start" } -- Allow backspace over indents, line breaks, and start of insert mode

-- === Completion & Menus ===
opt.completeopt = "menu,menuone,noselect" -- Configure completion menu
-- vim.o.shortmess = vim.o.shortmess .. "S"  -- Disable match count messages for searches

-- === Text Formatting & Wrapping ===
opt.linebreak = true        -- Prevent word splitting on line wrap
opt.joinspaces = false      -- Avoid double spaces after a period

-- === Displaying Special Characters ===
opt.list = true             -- Show invisible characters
opt.listchars = { tab = " ", trail = "·", nbsp = "%" } -- Define special character symbols

-- === Folding ===
opt.foldenable = true       -- Enable code folding
opt.foldmethod = "manual"   -- Manual folding

opt.mouse = "a" -- "not in visual mode so selection is copied to the clipboard"


-- No use of SwapFiles
vim.opt.swapfile = false


vim.api.nvim_create_augroup("SetISO88591Encoding", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "BufWritePre", "BufWritePost" }, {
  group = "SetISO88591Encoding",
  pattern = "/Users/max/cvsrepo/*",
  callback = function()
    vim.opt_local.fileencoding = "latin1"
  end,
})

vim.opt.statusline = table.concat({
  "%f",                  -- file name
  " [%{&fileencoding}]", -- file encoding
  " %y",                 -- file type
  " %m",                 -- modified flag
  "%=",                  -- right-align
  "%p%%",                -- percent through file
  " %l:%c",              -- line:column
})

-- specify colorschemes
vim.cmd[[colorscheme tokyonight]]

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
opt.termguicolors = true

vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
    group = vim.api.nvim_create_augroup("KittySetVarVimEnter", { clear = true }),
    callback = function()
        io.stdout:write("\x1b]1337;SetUserVar=in_editor=MQo\007")
    end,
})

vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
    group = vim.api.nvim_create_augroup("KittyUnsetVarVimLeave", { clear = true }),
    callback = function()
        io.stdout:write("\x1b]1337;SetUserVar=in_editor\007")
    end,
})


-- Reference: https://jdhao.github.io/2019/04/29/nvim_spell_check/

-- Enable spell check and set languages
opt.spell = true
opt.spelllang = { "en", "de" } -- cjk

-- Limit spelling suggestions to the 7 best matches
opt.spellsuggest = "best,7"
-- Highlight misspelled words in red
vim.cmd([[hi SpellBad cterm=underline guifg=Red]])


-- Is installed into the following directories
-- Downloading de.utf-8.spl...                                                                                                                                                         
-- :!wget 'https://ftp.nluug.nl/pub/vim/runtime/spell/de.utf-8.spl' -q -O '/var/folders/dr/0yc90r590w1123s1wvj7mjhc0000gn/T/nvim.max/klxWvx/0.spl'                                     
-- "/opt/homebrew/Cellar/neovim/0.11.0/share/nvim/runtime/spell/de.utf-8.spl" [New] 5845L, 2683941B written                                                                            
-- Downloading de.utf-8.sug...                                                                                                                                                         
-- :!wget 'https://ftp.nluug.nl/pub/vim/runtime/spell/de.utf-8.sug' -q -O '/var/folders/dr/0yc90r590w1123s1wvj7mjhc0000gn/T/nvim.max/klxWvx/0.sug'                                     
-- "/opt/homebrew/Cellar/neovim/0.11.0/share/nvim/runtime/spell/de.utf-8.sug" [New] 8932L, 4147729B written

