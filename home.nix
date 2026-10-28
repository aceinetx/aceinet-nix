{ pkgs, ... }: {
  home-manager.useGlobalPkgs = true;

  home-manager.users.aceinet = { pkgs, ... }: {
    imports = [
      ./home_modules/fonts.nix
      ./home_modules/git.nix
      ./home_modules/gtk.nix
      ./home_modules/direnv.nix
    ];

    home.stateVersion = "26.05";
  };
}
