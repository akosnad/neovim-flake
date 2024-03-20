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
''
