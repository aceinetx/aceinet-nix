{ createLampFMConfig, system }: { ... }: {
  home-manager.useGlobalPkgs = true;

  home-manager.users.aceinet = { pkgs, ... }: {
    home.packages = [ ];

    imports = [
      ./home_modules/git.nix
      ./home_modules/gtk.nix
    ];

    xdg.configFile."lampfm/config.toml".text = createLampFMConfig { };

    home.stateVersion = "26.05";
  };
}
