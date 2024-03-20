{
  description = "akosnad's neovim config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    neovim = {
      url = "github:neovim/neovim/stable?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, neovim }: 
  let
    variants = builtins.attrNames (import ./config/variants.nix);

    overlayFlakeInputs = prev: final: {
      neovim = neovim.packages.x86_64-linux.neovim;
    };

    overlayNeovim = prev: final:
      builtins.listToAttrs (
        builtins.map (variant: { name = "neovim-${variant}"; value = import ./packages/neovim.nix { inherit variant; pkgs = final; }; }) variants
      );

    pkgs = import nixpkgs {
      system = "x86_64-linux";
      overlays = [ overlayFlakeInputs overlayNeovim ];
    };
  in {
    packages.x86_64-linux.default = pkgs.neovim-full;
    apps.x86_64-linux.default = {
      type = "app";
      program = "${pkgs.neovim-full}/bin/nvim";
    };

    packages.x86_64-linux.minimal = pkgs.neovim-minimal;
    apps.x86_64-linux.minimal = {
      type = "app";
      program = "${pkgs.neovim-minimal}/bin/nvim";
    };
  };
}
