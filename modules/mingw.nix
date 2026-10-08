{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    pkgsCross.mingwW64.stdenv.cc
    pkgsCross.mingwW64.windows.mcfgthreads
  ];
}
