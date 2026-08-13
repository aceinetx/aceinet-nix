{ ... }: {
  boot.extraModprobeConfig = ''
    options ntsync some=default
  '';
  boot.kernelModules = [ "ntsync" ];
}
