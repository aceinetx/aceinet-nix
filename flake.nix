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
      nixosModules.aceinet-nix = { lib, config, ... }: {
        imports = [
          ./default.nix

          happ-nixos.nixosModules.happ-nixos
        ];

        environment.systemPackages = [
          dwl.packages.x86_64-linux.default
          gf2.packages.x86_64-linux.default
          krbc.packages.x86_64-linux.default
        ];
      };
    };
}
