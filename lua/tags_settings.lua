vim.keymap.set("n", "tr", ":GscopeFind s <C-R><C-W><cr>")
vim.keymap.set("n", "td", ":GscopeFind g <C-R><C-W><cr>")
vim.keymap.set("n", "tic", ":GscopeFind c <C-R><C-W><cr>")
vim.keymap.set("n", "tg", ":GscopeFind t <C-R><C-W><cr>")
vim.keymap.set("n", "tG", ":GscopeFind e <C-R><C-W><cr>")
vim.keymap.set("n", "tgf", ":GscopeFind f <C-R>=expand('<cfile>')<cr><cr>")
vim.keymap.set("n", "tgi", ":GscopeFind i <C-R>=expand('<cfile>')<cr><cr>")
vim.keymap.set("n", "toc", ":GscopeFind d <C-R><C-W><cr>")
vim.keymap.set("n", "tga", ":GscopeFind a <C-R><C-W><cr>")
vim.keymap.set("n", "tgz", ":GscopeFind z <C-R><C-W><cr>")
vim.keymap.set("n", "tgb", ":TagbarToggle<cr>")
vim.api.nvim_command([[set cscopeprg=gtags-cscope]])

vim.api.nvim_exec([[
  " enable gtags module
  let g:gutentags_modules = ['ctags', 'gtags_cscope']

  " generate datebases in my cache directory, prevent gtags files polluting my project
  let g:gutentags_cache_dir = expand('~/.cache/tags')

  " change focus to quickfix window after search (optional).
  let g:gutentags_plus_switch = 1
]], false)
