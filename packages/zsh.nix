{ ... }: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      cd = "z";
      vi = "busybox vi";
    };
  };
  programs.zsh.ohMyZsh = {
    enable = true;
    theme = "refined";
    plugins = [
      "zoxide"
      "git"
    ];
  };
}
