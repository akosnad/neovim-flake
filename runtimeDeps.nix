{ pkgs }: with pkgs; rec {
  full = minimal ++ [
    nodePackages.typescript-language-server
    nodePackages.typescript
    nodePackages.pyright
    nodePackages.prettier

    lua-language-server
    rust-analyzer
  ];

  minimal = [
    ranger
  ];
}
