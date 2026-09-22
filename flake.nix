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
    circuitjs = {
      url = "github:aceinetx/circuitjs-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    namida = {
      url = "github:aceinetx/namida-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mathualizer = {
      url = "github:aceinetx/mathualizer";
      inputs.nixpkgs.follows = "nixpkgs";
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
      sizeof,
      paperstrap,
      circuitjs,
      namida,
      mathualizer,
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
            ./modules/intel.nix
            ./modules/pipewire.nix
            ./modules/xdg.nix
            ./modules/ntsync.nix
            ./modules/android.nix
            ./modules/ssh.nix
            ./modules/openbox.nix
            ./modules/printer.nix
            ./modules/happ.nix

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
              flakePackages = builtins.map (x: x.packages.${system}.default) [
                dwl
                gf2
                krbc
                lampfm
                sizeof
                paperstrap
                circuitjs
                namida
                mathualizer
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
