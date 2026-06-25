{
  description = "aceinet's nixos flake";

  inputs = {
    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";
  };

  outputs = { self, zapret-discord-youtube }: {
    nixosModules.zapret = { lib, config, ... }: {
      imports = [ (zapret-discord-youtube.nixosModules.withTestTools { inherit lib; }) ];
      
      services.zapret-discord-youtube = {
        enable = true;
        config = "general (SIMPLE FAKE ALT)"; 
        gameFilter = "null";  
        listGeneral = [ "example.com" "test.org" "mysite.net" ];
        listExclude = [ "ubisoft.com" "origin.com" ];
        ipsetAll = [ "192.168.1.0/24" "10.0.0.1" ];
        ipsetExclude = [ "203.0.113.0/24" ];
      };
    };
    nixosModules.aceinet-nix = { lib, config, ...}: {
      imports = [ ./default.nix ];
    };
  };
}
