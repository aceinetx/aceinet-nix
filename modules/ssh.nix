{ pkgs, ... }: {
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  users.users.aceinet.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJZ8tI2m8MZI64Clbm+C5yDreLXh9sk89Z+0nFjjN9bz mouselin82@gmail.com"
  ];
}
