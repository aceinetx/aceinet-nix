{
  description = "aceinet's nixos flake";

  inputs = {
    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";
    dwl.url = "git+https://codeberg.org/aceinet/dwl.git";
    gf2.url = "github:aceinetx/gf";
    # hy3 = {
    #  url = "github:outfoxxed/hy3?ref=hl0.55.0";
    #};
  };

  outputs =
    {
      self,
      zapret-discord-youtube,
      dwl,
      gf2,
    }:
    {
      nixosModules.zapret = { lib, config, ... }: {
        imports = [ (zapret-discord-youtube.nixosModules.withTestTools { inherit lib; }) ];

        services.zapret-discord-youtube = {
          enable = true;
          config = "general (SIMPLE FAKE ALT)";
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
      };
      nixosModules.aceinet-nix = { lib, config, ... }: {
        imports = [
          ./default.nix
          ./virtualbox.nix
        ];

        environment.systemPackages = [
          dwl.packages.x86_64-linux.default
          gf2.packages.x86_64-linux.default
        ];
        environment.sessionVariables = {
          EDITOR = "nvim";
        };
      };
    };
}
