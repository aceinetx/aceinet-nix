{
  lib,
  config,
  pkgs,
  ...
}:

{
  programs.zsh.enable = true;
  programs.nix-ld.enable = true;
  programs.steam.enable = true;
  programs.java.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    libX11
    wayland
    fontconfig
    libxcursor
    libxext
    libxkbcommon
    xinput
  ];
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    javaPackages.compiler.openjdk17-bootstrap
    jdt-language-server
    ghc haskellPackages.haskell-language-server ormolu
    git
    github-cli
    forgejo-cli
    man-pages
    man-pages-posix
    discord
    telegram-desktop
    clang
    clang-tools
    gcc
    hyprpaper
    hyprlock
    python3
    pyrefly
    readline
    rlwrap
    vim neovim
    neovide
    nil
    nixfmt
    zig
    zls
    xmake
    rustup
    fastfetch
    zsh
    gdm
    librewolf
    fuzzel
    thunar
    unzip
    kitty
    zoxide
    raylib
    wget
    brightnessctl
    lua
    cloudflare-warp
    cloc
    steam
    gdb
    pavucontrol
    prismlauncher
    zenity
    openssl
    fzf
    mpv
    grim
    slurp
    feh
    bvi
    file
    go
    vulkan-tools
    setxkbmap
    fasm
    qrencode
    zbar
    llvm
    steam-run
    aseprite
    pnpm
    nodejs
    godotPackages_4_7.godot
    gdtoolkit_4
  ];
}
