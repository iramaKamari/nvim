vim.api.nvim_exec([[
function! Scratch()
split
noswapfile hide enew
setlocal buftype=nofile
setlocal bufhidden=hide
endfunction
]], false)
vim.keymap.set("n", "<leader>S", ":call Scratch()<CR>")
