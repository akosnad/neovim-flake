{ pkgs }:
let
  customRC = import ../config { inherit pkgs; variant = "minimal"; };
  plugins = import ../plugins.nix { inherit pkgs; };
  runtimeDeps = import ../runtimeDeps.nix { inherit pkgs; };
  neovimRuntimeDeps = pkgs.symlinkJoin {
    name = "neovim-runtime-deps";
    paths = runtimeDeps.minimal;
  };
  neovimUnwrapped = pkgs.wrapNeovim pkgs.neovim {
    configure = {
      inherit customRC;
      packages.all.start = plugins.minimal;
    };
  };
in pkgs.writeShellApplication {
  name = "nvim";
  runtimeInputs = [ neovimRuntimeDeps ];
  text = ''
    ${neovimUnwrapped}/bin/nvim "$@"
  '';
}
