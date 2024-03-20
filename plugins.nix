{ pkgs }:
with pkgs.vimPlugins; rec {
  full = minimal ++ [
    nvim-lspconfig
    nvim-cmp
    cmp-nvim-lsp
    neodev-nvim

    nvim-snippy
    cmp-snippy
    vim-snippets

    crates-nvim
  ];

  minimal = [
    vim-airline
    vim-airline-themes
    telescope-nvim
    ranger-vim
    copilot-vim
  ];

}
