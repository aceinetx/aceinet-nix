{ ... }: {
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "aceinetx";
        email = "mouselin82@gmail.com";
      };
    };
  };
}
