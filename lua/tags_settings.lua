--vim.keymap.set("n", "<leader>tr", ":GscopeFind s <C-R><C-W><cr>")
--vim.keymap.set("n", "<leader>td", ":GscopeFind g <C-R><C-W><cr>")
--vim.keymap.set("n", "<leader>tic", ":GscopeFind c <C-R><C-W><cr>")
--vim.keymap.set("n", "<leader>tg", ":GscopeFind t <C-R><C-W><cr>")
--vim.keymap.set("n", "<leader>tG", ":GscopeFind e <C-R><C-W><cr>")
--vim.keymap.set("n", "<leader>tgf", ":GscopeFind f <C-R>=expand('<cfile>')<cr><cr>")
--vim.keymap.set("n", "<leader>tgi", ":GscopeFind i <C-R>=expand('<cfile>')<cr><cr>")
--vim.keymap.set("n", "<leader>toc", ":GscopeFind d <C-R><C-W><cr>")
--vim.keymap.set("n", "<leader>tga", ":GscopeFind a <C-R><C-W><cr>")
--vim.keymap.set("n", "<leader>tgz", ":GscopeFind z <C-R><C-W><cr>")
vim.keymap.set("n", "<leader>tgb", ":TagbarToggle<cr>")

vim.api.nvim_exec([[
  " enable gtags module
"  let g:gutentags_modules = ['ctags', 'gtags_cscope']

  " generate datebases in my cache directory, prevent gtags files polluting my project
  let g:gutentags_cache_dir = expand('~/.cache/tags')

  " change focus to quickfix window after search (optional).
  let g:gutentags_plus_switch = 1
]], false)
