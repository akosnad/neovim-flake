# vim: ft=lua
{ pkgs }:
''
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local nvim_lsp = require("lspconfig")

nvim_lsp.tsserver.setup({
  capabilities = capabilities,
  init_options = {
    tsserver = {
      path = "${pkgs.nodePackages.typescript}/lib/node_modules/typescript/lib",
    },
  },
})

nvim_lsp.pyright.setup({
  capabilities = capabilities,
  cmd = {"${pkgs.nodePackages.pyright}/bin/pyright-langserver", "--stdio"},
})

require('neodev').setup({
})
nvim_lsp.lua_ls.setup({
    capabilities = capabilities,
})

nvim_lsp.rust_analyzer.setup({
    capabilities = capabilities,
})
''
