{
  description = "aceinet's nixos flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
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
    sizeof = {
      url = "github:aceinetx/sizeof";
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
    lyricedit = {
      url = "github:aceinetx/lyricedit";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    raddebugger = {
      url = "github:aceinetx/raddebugger-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    drop = {
      url = "github:aceinetx/drop?ref=cpp";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ish = {
      url = "github:aceinetx/ish";
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
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay?rev=42252f1d108c3e2051539162e1fb79e76f645af3";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
    nix-auth.url = "github:numtide/nix-auth";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      dwl,
      gf2,
      krbc,
      sizeof,
      circuitjs,
      namida,
      mathualizer,
      lyricedit,
      raddebugger,
      drop,
      ish,
      happ-nixos,
      home-manager,
      zapret-discord-youtube,
      neovim-nightly-overlay,
      nix-auth,
    }:
    {
      nixosModules.aceinet-nix =
        system:
        {
          lib,
          config,
          pkgs,
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
            ./modules/kde_connect.nix
            ./modules/mingw.nix
            ./modules/bincache.nix

            ./home.nix

            happ-nixos.nixosModules.happ-nixos

            home-manager.nixosModules.home-manager

            zapret-discord-youtube.nixosModules.withTestTools
            {
              services.zapret-discord-youtube = {
                enable = true;
                configName = "general(ALT11)";

                gameFilter = "all";

                # Добавляем кастомные домены в list-general-user.txt
                listGeneral = [
                  "example.com"
                  "test.org"
                  "mysite.net"
                ];

                # Добавляем домены в list-exclude-user.txt (исключения)
                listExclude = [
                  "ubisoft.com"
                  "origin.com"
                ];

                # Добавляем IP адреса в ipset-all.txt
                ipsetAll = [
                  "192.168.1.0/24"
                  "10.0.0.1"
                ];

                # Добавляем IP адреса в ipset-exclude-user.txt (исключения)
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
                sizeof
                circuitjs
                namida
                mathualizer
                lyricedit
                raddebugger
                drop
                ish
                nix-auth
                neovim-nightly-overlay
              ];
            in
            flakePackages
            ++ [
              pkgs.maven
            ]
            ++ (with nixpkgs-unstable.legacyPackages.${system}; [
              c3c
              c3-lsp
              zig_0_17
              zls
            ]);
        };
    };
}
