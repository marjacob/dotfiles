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

local clangd_extensions = require("clangd_extensions")
local cmp = require("cmp")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local luasnip = require("luasnip")

local capabilities const = cmp_nvim_lsp.update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

clangd_extensions.setup({
  server = {
    capabilities = capabilities
  },
})

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Esc>"] = cmp.mapping.close(),
  }),
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "luasnip" },
  })
})
