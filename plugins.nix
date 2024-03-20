{ pkgs }:
with pkgs.vimPlugins; [
  vim-airline
  vim-airline-themes
  telescope-nvim
  nvim-lspconfig
  copilot-vim
  ranger-vim
]
