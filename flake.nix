{
  description = "aceinet's nixos flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    dwl = {
      url = "git+https://codeberg.org/aceinet/dwl.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    gf2 = {
      url = "github:aceinetx/gf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    krbc = {
      url = "github:aceinetx/krbc";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    happ-nixos.url = "github:aceinetx/happ-nixos";
  };

  outputs =
    {
      self,
      nixpkgs,
      dwl,
      gf2,
      krbc,
      happ-nixos,
    }:
    {
      nixosModules.aceinet-nix =
        system:
        {
          lib,
          config,
          ...
        }:
        {
          imports = [
            ./default.nix

            happ-nixos.nixosModules.happ-nixos
          ];

          environment.systemPackages = [
            dwl.packages.${system}.default
            gf2.packages.${system}.default
            krbc.packages.${system}.default
          ];
        };
    };
}
