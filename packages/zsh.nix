{ ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      cd = "z";
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
