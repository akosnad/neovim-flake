let
  variants = import ./variants.nix;
in
{ pkgs, variant }:
let
  variantDeps = variants.${variant}.inherits or [];

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

  variantActionWrapper = action:
    builtins.map (base: action base) (variantDeps ++ [variant]);

in builtins.concatStringsSep "\n"
  (builtins.map (configs: sourceConfigFiles configs) (
    variantActionWrapper (base: scripts2ConfigFiles "${base}/vim") ++
    variantActionWrapper (base: nixFiles2ConfigFiles "${base}/vimnix") ++
    variantActionWrapper (base: scripts2ConfigFiles "${base}/lua") ++
    variantActionWrapper (base: nixFiles2ConfigFiles "${base}/luanix")
    )
  )
