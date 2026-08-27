{ pkgs, ... }: {
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    libX11
    wayland
    fontconfig
    libxcursor
    libxext
    libxkbcommon
    xinput
    wxwidgets_3_2
    fuse
    fuse2
    fuse3
  ];
}
