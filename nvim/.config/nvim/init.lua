vim.opt.autochdir = true
vim.opt.clipboard:prepend("unnamed,unnamedplus")
vim.opt.colorcolumn = "+1"
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.foldenable = false
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.infercase = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.report = 0
vim.opt.scrolloff = 5
vim.opt.shortmess:append({ I = true })
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.timeout = false
vim.opt.virtualedit = "block"
vim.opt.wildmode = "list:longest,full"
vim.opt.wrap = false

require("plugin")
