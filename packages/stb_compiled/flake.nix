{
  description = "stb libraries but compiled";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = pkgs.stdenv.mkDerivation {
          name = "stb_compiled";
          version = "0.1.0";

          src = self;

          buildInputs = [
            pkgs.makeWrapper
            pkgs.stdenv.cc
            pkgs.lua
          ];

          buildPhase = "lua build.lua";
        };
      }
    );
}
