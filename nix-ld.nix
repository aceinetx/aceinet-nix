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
    glib
    nspr
    libsecret
    glib
    stdenv.cc.cc.lib
    alsa-lib
    freetype
    curlWithGnuTls
    libGL
    libGLX
    libglvnd
    stdenv.cc.cc
    libXrender
    libjack2
  ];
}
