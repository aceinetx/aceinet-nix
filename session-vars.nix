{ pkgs, ... }: {
  environment.sessionVariables = {
    EDITOR = "nvim";
    JAVA_HOME = "${pkgs.jdk25}";
    JAVA_HOME1 = ":${pkgs.jdk25}";
  };
}
