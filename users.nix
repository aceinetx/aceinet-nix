{ pkgs, ... }: {
  users.users."aceinet" = {
    isNormalUser = true;
    description = "aceinet";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    shell = pkgs.zsh;
  };
}
