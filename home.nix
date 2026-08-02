{ ... }: {
  home-manager.useGlobalPkgs = true;

  home-manager.users.aceinet = { pkgs, ... }: {
    home.packages = [ ];

    home.stateVersion = "26.05";
  };
}
