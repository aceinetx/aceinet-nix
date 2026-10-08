{ pkgs, ... }: {
  home.packages = with pkgs; [
    nerd-fonts.iosevka
    nerd-fonts.terminess-ttf
    nerd-fonts.zed-mono
    nerd-fonts.bigblue-terminal
  ];
}
