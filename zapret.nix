{
  description = "NixOS configuration with zapret-discord-youtube";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";
  };

  outputs = { self, nixpkgs, zapret-discord-youtube }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix

        zapret-discord-youtube.nixosModules.withTestTools
        {
          services.zapret-discord-youtube = {
            enable = true;
            config = "general(ALT9)"; 
            gameFilter = "null";  
            listGeneral = [ "example.com" "test.org" "mysite.net" ];
            listExclude = [ "ubisoft.com" "origin.com" ];
            ipsetAll = [ "192.168.1.0/24" "10.0.0.1" ];
            ipsetExclude = [ "203.0.113.0/24" ];
          };
        }
      ];
    };
  };
}
