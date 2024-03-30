{ pkgs }: with pkgs; rec {
  full = minimal ++ [
    nodePackages.typescript-language-server
    nodePackages.typescript
    nodePackages.pyright

    lua-language-server
    rust-analyzer
  ];

  minimal = [
    ranger
    ripgrep
  ];
}
