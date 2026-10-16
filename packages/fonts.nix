{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    corefonts
    liberation_ttf
    dejavu_fonts
  ];
}
