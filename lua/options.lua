vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.foldcolumn = "0"

vim.opt.termguicolors = true
vim.opt.autoread = true
--vim.opt.guicursor = ""
vim.opt.lazyredraw = true
vim.opt.showmatch = true
vim.opt.complete = ".,w,b,u,t"
vim.opt.completeopt = "menu,menuone,noselect,noinsert"
vim.opt.wildmode = "longest:full,full"
vim.opt.formatoptions = "jcroqlnt"

vim.cmd([[set signcolumn=number]])
vim.cmd([[set noswapfile nobackup noshowmode]])
vim.cmd([[set cursorline]])
vim.cmd([[set mouse=]])
vim.cmd([[set path+=**]])
-- Extend MatchParen list
vim.cmd([[set mps+=<:>]])
vim.cmd([[set splitbelow splitright]])
vim.cmd([[set number relativenumber]])

vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true
vim.opt.isfname:append("@-@")
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 6
--vim.opt.colorcolumn:append("+2")
vim.api.nvim_exec([[
autocmd BufEnter,InsertEnter,InsertLeave * match ColorColumn "\%82v."
]], false)

-- Buffer settings
vim.opt.textwidth = 80
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cindent = true
vim.opt.autoindent = true

vim.api.nvim_exec([[autocmd VimResized * wincmd =]], false)
vim.api.nvim_exec([[
augroup buffer_number_toggle
autocmd!
autocmd BufEnter,FocusGained,InsertLeave * setlocal relativenumber
autocmd BufLeave,FocusLost,InsertEnter   * setlocal norelativenumber
augroup END
]], false)

vim.api.nvim_exec([[
augroup terminal_number_toggle
autocmd!
autocmd TermOpen,TermEnter term://* startinsert
autocmd TermLeave,TermClose term://* stopinsert
autocmd TermOpen,TermEnter term://* :setlocal nonumber norelativenumber
autocmd TermLeave,TermClose term://* :setlocal nonumber norelativenumber
augroup END
]], false)

-- Omnicomple in insert mode
vim.api.nvim_exec([[
autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
]], false)

-- show cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
    if ok and cl then
      vim.wo.cursorline = true
      vim.api.nvim_win_del_var(0, "auto-cursorline")
    end
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    local cl = vim.wo.cursorline
    if cl then
      vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
      vim.wo.cursorline = false
    end
  end,
})

-- create directories when needed, when saving a file
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
  callback = function(event)
    local file = vim.loop.fs_realpath(event.match) or event.match

    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    local backup = vim.fn.fnamemodify(file, ":p:~:h")
    backup = backup:gsub("[/\\]", "%%")
    vim.go.backupext = backup
  end,
})

-- Fix conceallevel for json & help files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})
