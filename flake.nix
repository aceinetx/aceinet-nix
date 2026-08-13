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
    lampfm = {
      url = "github:aceinetx/lampfm";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    bedrock-on-linux = {
      url = "github:Wyze3306/BedrockOnLinux";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    happ-nixos.url = "github:aceinetx/happ-nixos";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      dwl,
      gf2,
      krbc,
      lampfm,
      bedrock-on-linux,
      happ-nixos,
      home-manager,
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
            (import ./home.nix (
              with lampfm;
              {
                inherit createLampFMConfig;
                inherit system;
              }
            ))

            happ-nixos.nixosModules.happ-nixos
            home-manager.nixosModules.home-manager
          ];

          environment.systemPackages =
            let
              packages = [
                dwl
                gf2
                krbc
                lampfm
                bedrock-on-linux
              ];
            in
            builtins.map (x: x.packages.${system}.default) packages;
        };
    };
}
