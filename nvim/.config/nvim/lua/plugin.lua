local on_attach = function(client, bufnr)
  local options = { noremap = true, silent = true }

  -- Show hover popup on Ctrl+N.
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<C-N>",
    "<Cmd>lua vim.lsp.buf.hover()<CR>",
    options
  )
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

require("clangd_extensions").setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
})

local cmp = require("cmp")
local luasnip = require("luasnip")

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
    ["<C-B>"] = cmp.mapping.scroll_docs(-4),
    ["<C-E>"] = cmp.mapping.abort(),
    ["<C-F>"] = cmp.mapping.scroll_docs(4),
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
  }),
})
