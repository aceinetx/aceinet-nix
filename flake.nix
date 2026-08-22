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
    sizeof = {
      url = "github:aceinetx/sizeof";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    paperstrap = {
      url = "git+https://codeberg.org/aceinet/paperstrap.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    happ-nixos.url = "github:aceinetx/happ-nixos";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zapret-discord-youtube = {
      url = "github:kartavkun/zapret-discord-youtube";
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
      sizeof,
      paperstrap,
      happ-nixos,
      home-manager,
      zapret-discord-youtube,
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
            ./intel.nix
            ./pipewire.nix
            ./xdg.nix
            ./ntsync.nix

            (import ./home.nix (
              with lampfm;
              {
                inherit createLampFMConfig;
                inherit system;
              }
            ))

            happ-nixos.nixosModules.happ-nixos
            home-manager.nixosModules.home-manager

            zapret-discord-youtube.nixosModules.withTestTools
            {
              services.zapret-discord-youtube = {
                enable = true;
                config = "general(ALT11)";

                gameFilter = "null";

                listGeneral = [
                  "example.com"
                  "test.org"
                  "mysite.net"
                ];

                listExclude = [
                  "ubisoft.com"
                  "origin.com"
                ];

                ipsetAll = [
                  "192.168.1.0/24"
                  "10.0.0.1"
                ];

                ipsetExclude = [ "203.0.113.0/24" ];
              };
            }
          ];

          environment.systemPackages =
            let
              flakePackages = builtins.map (x: x.packages.${system}.default) [
                dwl
                gf2
                krbc
                lampfm
                sizeof
                paperstrap
              ];
              pkgs = nixpkgs.legacyPackages.${system};
            in
            flakePackages
            ++ [
              pkgs.maven_4
            ];
        };
    };
}
