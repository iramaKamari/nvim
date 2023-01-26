return {
  dir = "~/nvim/lua/iramakamari/plugins/scratch.lua",
  keys = { { "<leader>S", ":call Scratch()<CR>" } },
  config = function()
    vim.api.nvim_exec([[
      function! Scratch()
	split
	noswapfile hide enew
	setlocal buftype=nofile
	setlocal bufhidden=hide
      endfunction
    ]], false)
  end,
}
