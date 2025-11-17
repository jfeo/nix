{ ... }:
{
  programs.git.enable = true;

  programs.git.settings = {
    user = {
      email = "jens@feodor.dk";
      name = "Jens Feodor Nielsen";
    };

    alias = {
      co = "checkout";
      amend = "commit --amend --no-edit";
    };

    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
