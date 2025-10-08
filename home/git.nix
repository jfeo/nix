{ ... }:
{

  programs.git = {
    enable = true;
    userEmail = "jens@feodor.dk";
    userName = "Jens Feodor Nielsen";
    aliases = {
      co = "checkout";
      amend = "commit --amend --no-edit";
    };
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
