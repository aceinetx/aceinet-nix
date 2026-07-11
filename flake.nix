{
  description = "aceinet's nixos flake";

  inputs = {
    dwl.url = "git+https://codeberg.org/aceinet/dwl.git";
    gf2.url = "github:aceinetx/gf";
  };

  outputs =
    {
      self,
      dwl,
      gf2,
    }:
    {
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
