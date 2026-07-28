{ ... }: {
  environment.sessionVariables = {
    EDITOR = "nvim";
    GDK_BACKEND = "x11"; # librewolf doesn't display text otherwise, workaround
  };
}
