{ pkgs, ... }:
{
  services.printing = {
    enable = true;
    drivers = [ pkgs.pantum-driver ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  users.users.aceinet.extraGroups = [ "lpadmin" ];

  environment.etc.pantum-driver.source = "${pkgs.pantum-driver}/share";
}
