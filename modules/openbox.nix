{ pkgs, ... }: {
  services.xserver.enable = true;

  services.xserver.windowManager.openbox.enable = true;

  environment.systemPackages = with pkgs; [
    obconf
    tint2
    nitrogen
    picom
  ];
}
