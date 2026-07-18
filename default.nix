{ lib, ... }:
{
  imports = [
    ./experimental.nix
    ./packages.nix
    ./bootloader.nix
    ./unfree.nix
    ./nix-ld.nix
    ./docker.nix
    # ./virtualbox.nix
    ./editor.nix
    # ./zapret/zapret.nix
    ./happ.nix
  ];
}
