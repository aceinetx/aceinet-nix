{ lib, config, pkgs, ... }:

{
  programs.hyprland.enable = true;
  programs.zsh.enable = true;
  programs.nix-ld.enable = true;
  programs.steam.enable = true;
  programs.java.enable = true;

  environment.systemPackages = with pkgs; [
    javaPackages.compiler.openjdk17-bootstrap jdt-language-server
    ghc haskellPackages.haskell-language-server
    git github-cli forgejo-cli
    man-pages man-pages-posix
    discord telegram-desktop
    clang clang-tools gcc
    hyprpaper hyprlock
    python3 pyrefly
    readline rlwrap
    neovim neovide
    zig zls
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
  ];
}
