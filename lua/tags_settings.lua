vim.api.nvim_exec([[
  " enable gtags module
"  let g:gutentags_modules = ['ctags', 'gtags_cscope']

  " generate datebases in my cache directory, prevent gtags files polluting my project
  let g:gutentags_cache_dir = expand('~/.cache/tags')

  " change focus to quickfix window after search (optional).
  let g:gutentags_plus_switch = 1
]], false)
