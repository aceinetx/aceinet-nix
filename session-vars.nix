{ pkgs, ... }: {
  environment.sessionVariables = {
    EDITOR = "nvim";
    JAVA_HOME = "${pkgs.jdk25}";
  };
}
