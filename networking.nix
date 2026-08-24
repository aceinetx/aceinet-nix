{ ... }: {
  networking.firewall.allowedTCPPorts = [
    8080
    8000
    25565
    19132
    27015
  ];
  networking.firewall.allowedUDPPorts = [
    8080
    8000
    25565
    19132
    27015
  ];
}
