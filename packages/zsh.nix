{ ... }: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      cd = "z";
      vi = "busybox vi";
      wbuild = "cc wbuild.c -o /tmp/wbuild && /tmp/wbuild";
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
