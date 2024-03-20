{ pkgs, variant ? builtins.filter (f: f != "default.nix") (builtins.attrNames (builtins.readDir ./.)) }:
let
  nixFiles2ConfigFiles = dir:
    builtins.map (file:
      pkgs.writeTextFile {
        name = pkgs.lib.strings.removeSuffix ".nix" file;
        text = import ./${dir}/${file} { inherit pkgs; };
      }) (builtins.attrNames (builtins.readDir ./${dir}));

  scripts2ConfigFiles = dir:
    let
      configDir = pkgs.stdenv.mkDerivation {
        name = "nvim-${dir}-configs";
        src = ./${dir};
        installPhase = ''
          mkdir -p $out/
          cp ./* $out/
        '';
      };
    in builtins.map (file: "${configDir}/${file}")
    (builtins.attrNames (builtins.readDir configDir));

  sourceConfigFiles = files:
    builtins.concatStringsSep "\n" (builtins.map (file:
      (if pkgs.lib.hasSuffix "lua" file then "luafile" else "source")
      + " ${file}") files);

  vim = scripts2ConfigFiles "${variant}/vim";
  vimnix = nixFiles2ConfigFiles "${variant}/vimnix";
  lua = scripts2ConfigFiles "${variant}/lua";
  luanix = nixFiles2ConfigFiles "${variant}/luanix";

in builtins.concatStringsSep "\n"
  (builtins.map (configs: sourceConfigFiles configs)
    [ vim vimnix lua luanix ])
