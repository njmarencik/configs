-- Set terminal color support to 16
vim.o.termguicolors = true

-- Enable syntax highlighting if available
if vim.fn.has('syntax') == 1 then
  vim.cmd('syntax on')
end

-- Auto command to go to the last edit position
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*',
  callback = function()
    if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line('$') then
      vim.cmd('normal! g`\"')
    end
  end,
})

-- Set terminal color support to 16 (again, this is duplicated)
vim.o.termguicolors = true

-- Set laststatus to always show the status line
vim.o.laststatus = 2

-- Enable line numbers
vim.wo.number = true

-- Make the line numbers relative
vim.wo.relativenumber = true

local opts = { noremap = true, silent = true }

-- Create new terminals
vim.keymap.set({'n','i','v','t'}, '<M-`><Right>',  ':Vex!<CR>', opts)
vim.keymap.set({'n','i','v','t'}, '<M-`><Left>',   ':Vex<CR>',  opts)
vim.keymap.set({'n','i','v','t'}, '<M-`><Down>',   ':Hex!<CR>', opts)
vim.keymap.set({'n','i','v','t'}, '<M-`><Up>',     ':Hex<CR>',  opts)

-- Move between terminals
--vim.keymap.set({'n','i','v','t'}, '<M-Right>',  '<C-w>l', opts)
--vim.keymap.set({'n','i','v','t'}, '<M-Left>',   '<C-w>h',  opts)
--vim.keymap.set({'n','i','v','t'}, '<M-Down>',   '<C-w>j', opts)
--vim.keymap.set({'n','i','v','t'}, '<M-Up>',     '<C-w>k',  opts)
--
---- Move terminal to side
--vim.keymap.set({'n','i','v','t'}, '<M-`><M-Right>',  '<C-w>L', opts)
--vim.keymap.set({'n','i','v','t'}, '<M-`><M-Left>',   '<C-w>H',  opts)
--vim.keymap.set({'n','i','v','t'}, '<M-`><M-Down>',   '<C-w>J', opts)
--vim.keymap.set({'n','i','v','t'}, '<M-`><M-Up>',     '<C-w>K',  opts)


-- 1. Navigation for Normal (n), Insert (i), and Visual (v) modes
vim.keymap.set({'n', 'i', 'v'}, '<M-S-Right>', '<C-w>l', opts)
vim.keymap.set({'n', 'i', 'v'}, '<M-S-Left>',  '<C-w>h', opts)
vim.keymap.set({'n', 'i', 'v'}, '<M-S-Down>',  '<C-w>j', opts)
vim.keymap.set({'n', 'i', 'v'}, '<M-S-Up>',    '<C-w>k', opts)

-- 2. Navigation specifically for Terminal (t) mode 
-- (Uses <C-\><C-n> to safely exit terminal input mode first)
vim.keymap.set('t', '<M-S-Right>', [[<C-\><C-n><C-w>l]], opts)
vim.keymap.set('t', '<M-S-Left>',  [[<C-\><C-n><C-w>h]], opts)
vim.keymap.set('t', '<M-S-Down>',  [[<C-\><C-n><C-w>j]], opts)
vim.keymap.set('t', '<M-S-Up>',    [[<C-\><C-n><C-w>k]], opts)

-- 3. Moving windows to the sides (Normal, Insert, Visual)
vim.keymap.set({'n', 'i', 'v'}, '<M-`><S-Right>', '<C-w>L', opts)
vim.keymap.set({'n', 'i', 'v'}, '<M-`><S-Left>',  '<C-w>H', opts)
vim.keymap.set({'n', 'i', 'v'}, '<M-`><S-Down>',  '<C-w>J', opts)
vim.keymap.set({'n', 'i', 'v'}, '<M-`><S-Up>',    '<C-w>K', opts)

-- 4. Moving windows to the sides (Terminal mode)
vim.keymap.set('t', '<M-`><S-Right>', [[<C-\><C-n><C-w>L]], opts)
vim.keymap.set('t', '<M-`><S-Left>',  [[<C-\><C-n><C-w>H]], opts)
vim.keymap.set('t', '<M-`><S-Down>',  [[<C-\><C-n><C-w>J]], opts)
vim.keymap.set('t', '<M-`><S-Up>',    [[<C-\><C-n><C-w>K]], opts)



-- Create an augroup to manage the highlights cleanly
local statusline_colors = vim.api.nvim_create_augroup("StatusLineColors", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter", "SessionLoadPost" }, {
  group = statusline_colors,
  callback = function()
    -- Get the visual attributes of the active StatusLine
    local active_hl = vim.api.nvim_get_hl(0, { name = 'StatusLine' })
    -- Force the inactive StatusLineNC to use the exact same styling
    vim.api.nvim_set_hl(0, 'StatusLineNC', active_hl)
  end,
})



vim.cmd("colorscheme custom_colors")

