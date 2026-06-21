{ lib, config, pkgs, ... }:

{
  programs.hyprland.enable = true;
  programs.zsh.enable = true;
  programs.nix-ld.enable = true;
  programs.java.enable = true;

  environment.systemPackages = with pkgs; [
    javaPackages.compiler.openjdk17-bootstrap jdt-language-server
    man-pages man-pages-posix
    clang clang-tools gcc
    hyprpaper hyprlock
    xmake cmake ninja
    git github-cli
    zig zls
    rustup
    fastfetch
    zsh
    neovim
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
    fmt
    m4
    bison
    python3
    lua
    pkg-config
    cloudflare-warp
    cloc
    gnumake
    discord
    steam
    gdb
    pavucontrol
    prismlauncher
    zenity
    openssl
    fzf
    mpv
  ];

  # Allow some unfree programs
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "cloudflare-warp" "discord" "steam" "steam-unwrapped"
  ];
}
