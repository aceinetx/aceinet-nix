{ pkgs, ... }: {
  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];

    config.common.default = "*";
  };

  environment.sessionVariables = {
    XDG_CURRENT_DESKTOP = "wlroots";
  };
}
