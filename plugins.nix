{ pkgs }:
with pkgs.vimPlugins; rec {
  full = minimal ++ [
    nvim-lspconfig
    nvim-cmp
    cmp-nvim-lsp
  ];

  minimal = [
    vim-airline
    vim-airline-themes
    telescope-nvim
    ranger-vim
    copilot-vim
  ];

}
