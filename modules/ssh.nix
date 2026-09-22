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
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL9mBJly7463TEMypiG/H9y8gV5/mb6td4fz1GW6XE/x mouselin82@gmail.com"
  ];
}
