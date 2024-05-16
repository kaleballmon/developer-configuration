-- Set the path to the directory where lazy.nvim will be installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if the lazy.nvim directory already exists
if not vim.loop.fs_stat(lazypath) then
  -- If the directory does not exist, clone the lazy.nvim repository using Git
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
-- Prepend the runtime path with the path to lazy.nvim to ensure it loads first
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "github/copilot.vim",
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
      dependencies = { 'nvim-lua/plenary.nvim' },
    }
})

-- Copilot keybindings
-- Use nvim_set_keymap for Copilot accept since using keymap.set appends
-- weird characters to the end of what you accept
vim.api.nvim_set_keymap('i', '<C-L>', 'copilot#Accept("CR")', {expr = true, silent = true})
vim.keymap.set('i', '<C-J>', 'copilot#Next()', {expr = true, silent = true})
vim.keymap.set('i', '<C-H>', 'copilot#Previous()', {expr = true, silent = true})
vim.keymap.set('n', '<Leader>cp', ':Copilot toggle<CR>', {noremap = true, silent = true})

-- Map the "strong" H and L to move to the beginning and endings of lines
-- respectively. Disable the ^ character to force usage of H.
vim.keymap.set('n', 'H', '^', {noremap = true})
vim.keymap.set('n', 'L', 'g_', {noremap = true})
vim.keymap.set('n', '^', '<nop>', {noremap = true, silent = true})

-- Disable arrow keys in Normal, Visual, Insert, and Operator-pending modes
vim.keymap.set('n', '<Up>', '<nop>', {noremap = true, silent = true})
vim.keymap.set('n', '<Down>', '<nop>', {noremap = true, silent = true})
vim.keymap.set('n', '<Left>', '<nop>', {noremap = true, silent = true})
vim.keymap.set('n', '<Right>', '<nop>', {noremap = true, silent = true})
vim.keymap.set('v', '<Up>', '<nop>', {noremap = true, silent = true})
vim.keymap.set('v', '<Down>', '<nop>', {noremap = true, silent = true})
vim.keymap.set('v', '<Left>', '<nop>', {noremap = true, silent = true})
vim.keymap.set('v', '<Right>', '<nop>', {noremap = true, silent = true})
vim.keymap.set('i', '<Up>', '<nop>', {noremap = true, silent = true})
vim.keymap.set('i', '<Down>', '<nop>', {noremap = true, silent = true})
vim.keymap.set('i', '<Left>', '<nop>', {noremap = true, silent = true})
vim.keymap.set('i', '<Right>', '<nop>', {noremap = true, silent = true})
vim.keymap.set('o', '<Up>', '<nop>', {noremap = true, silent = true})
vim.keymap.set('o', '<Down>', '<nop>', {noremap = true, silent = true})
vim.keymap.set('o', '<Left>', '<nop>', {noremap = true, silent = true})
vim.keymap.set('o', '<Right>', '<nop>', {noremap = true, silent = true})

-- Map <CTRL-K> to <escape> in Normal, Visual, Select, Operator-pending, and terminal modes
vim.keymap.set('n', '<C-K>', '<ESC>', {noremap = true, silent = true})
vim.keymap.set('v', '<C-K>', '<ESC>', {noremap = true, silent = true})
vim.keymap.set('s', '<C-K>', '<ESC>', {noremap = true, silent = true})
vim.keymap.set('o', '<C-K>', '<ESC>', {noremap = true, silent = true})

-- Map <CTRL-K> to <CTRL-C> in Insert and Command-line modes
vim.keymap.set('i', '<C-K>', '<C-C>', {noremap = true, silent = true})
vim.keymap.set('c', '<C-K>', '<C-C>', {noremap = true, silent = true})

-- Disable the <escape> key in Normal, Visual, Select, Insert, Operator-pending, Command-line, and Terminal modes
vim.keymap.set('n', '<ESC>', '<NOP>', {noremap = true, silent = true})
vim.keymap.set('v', '<ESC>', '<NOP>', {noremap = true, silent = true})
vim.keymap.set('s', '<ESC>', '<NOP>', {noremap = true, silent = true})
vim.keymap.set('o', '<ESC>', '<NOP>', {noremap = true, silent = true})
vim.keymap.set('i', '<ESC>', '<NOP>', {noremap = true, silent = true})
vim.keymap.set('c', '<ESC>', '<NOP>', {noremap = true, silent = true})

-- Telescope keybindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-P>', builtin.find_files, {})
vim.keymap.set('n', '<C-F>', builtin.live_grep, {})

-- Map <Leader>in to open the init.lua file in a new tab
vim.keymap.set('n', '<Leader>in', ':tabnew $MYVIMRC<CR>', { noremap = true, silent = true })

-- Source filetype-specific configuration files
vim.cmd [[
  autocmd FileType lua lua require('ftplugin.lua').setup()
]]
