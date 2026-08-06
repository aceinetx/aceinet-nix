{ ... }: {
  security.doas.enable = true;
  security.sudo.enable = false;
  security.doas.extraRules = [
    {
      users = [ "aceinet" ];
      keepEnv = true;
      persist = true;
    }
  ];
}
