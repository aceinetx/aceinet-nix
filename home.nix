{ ... }: {
  home-manager.useGlobalPkgs = true;

  home-manager.users.aceinet = { pkgs, ... }: {
    home.packages = [ ];

    programs.git = {
      enable = true;

      settings = {
        user = {
          name = "aceinetx";
          email = "mouselin82@gmail.com";
        };
      };
    };

    home.stateVersion = "26.05";
  };
}
