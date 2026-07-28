{
  description = "aceinet's nixos flake";

  inputs = {
    dwl.url = "git+https://codeberg.org/aceinet/dwl.git";
    gf2.url = "github:aceinetx/gf";
    happ-nixos.url = "github:aceinetx/happ-nixos";
  };

  outputs =
    {
      self,
      dwl,
      gf2,
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
        ];
      };
    };
}
