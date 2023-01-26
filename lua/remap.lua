vim.keymap.set('n', '<leader>w', ':split<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>v', ':vs<CR>', { noremap = true, silent = true })
-- Move between splits
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { noremap = true, silent = true })
-- Change split size
vim.keymap.set('n', '<A-l>', '<C-w><C-->', { noremap = true, silent = true })
vim.keymap.set('n', '<A-k>', '<C-w><C-+>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-l>', '<C-w><C->>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-h>', '<C-w><C-<>', { noremap = true, silent = true })
-- Don't go over wrapped lines
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
-- Move lines up and down in visual mode
vim.keymap.set('v', 'J', '<Esc>:m +1<CR>gv=gv', { noremap = true, silent = true })
vim.keymap.set('v', 'K', '<Esc>:m -2<CR>gv=gv', { noremap = true, silent = true })
-- Don't move cursor when joining lines
vim.keymap.set("n", "J", "mzJ`z")
-- Center cursor when scrolling down/up
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Center next highlighted search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set('n', '<leader>n', ':normal ', { noremap = true, silent = false })
-- Replace all occurences on a line
vim.keymap.set('n', '<leader>r', ':s/<C-r><C-w>//g<Left><Left>', { noremap = true, silent = false })
-- Replace all occurences in a file
vim.keymap.set('n', '<leader>R', ':%s/<C-r><C-w>//gc<Left><Left><Left>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader><space>', ':nohlsearch<CR>', { noremap = true, silent = true })
-- Range commands for incsearch
vim.keymap.set('c', '$t', '<CR>:t\'\'<CR>', { noremap = true, silent = true })
vim.keymap.set('c', '$m', '<CR>:m\'\'<CR>', { noremap = true, silent = true })
vim.keymap.set('c', '$d', '<CR>:d<CR>``', { noremap = true, silent = true })
-- Open a ZSH terminal
vim.keymap.set('n', '<leader>t', ':terminal zsh<CR>', { noremap = true, silent = true })
-- Normal mode in terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
-- Quit
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })
-- Save
vim.keymap.set('n', '<leader>s', ':w<CR>', { noremap = true, silent = true })

-- Whitespace
vim.api.nvim_exec([[hi ExtraWhitespace ctermbg=124 guibg=#cc241d]], false)
-- Highlight leading whitespace
vim.keymap.set('n', '<leader>i', '/^\\s\\+/<CR>', { noremap = true, silent = true })
-- Highlight trailing whitespace
vim.keymap.set('n', '<leader>T', ':call TrimWhitespace()<CR>', { noremap = true, silent = false })
vim.api.nvim_exec([[
match ExtraWhitespace /\s\+$/
autocmd BufEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufLeave,TermOpen * call clearmatches()
]], false)
-- Trim trailing whitespace
vim.api.nvim_exec([[
fun! TrimWhitespace()
let l:save = winsaveview()
%s/\s\+$//e
call winrestview(l:save)
endfun
]], false)

-- Zoom/Restore window
--vim.keymap.set('n', '<leader>z', ':call ZoomToggle()<CR>', { noremap = true, silent = true })
--vim.api.nvim_exec([[
--function! ZoomToggle()
--if exists('t:zoomed') && t:zoomed
--execute t:zoom_winrestcmd
--let t:zoomed = 0
--else
--let t:zoom_winrestcmd = winrestcmd()
--resize
--vertical resize
--let t:zoomed = 1
--endif
--endfunction
--]], false)

