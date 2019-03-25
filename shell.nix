let
  nixpkgs = builtins.fromJSON (builtins.readFile ./.nixpkgs-version.json);
  pkgs = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/${nixpkgs.rev}.tar.gz";
    inherit (nixpkgs) sha256;
  }) {};

in pkgs.stdenv.mkDerivation {
  name = "dhall-template";
  buildInputs = [
    pkgs.dhall-text
    pkgs.dhall
    pkgs.gitAndTools.pre-commit
    pkgs.git
  ];
}
