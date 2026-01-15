{
  pkgs,
  lib,
  ...
}: {
  programs.swaylock = {
    enable = true;
    settings = {
      color = "1e1e2e"; # Catppuccin mocha base
      font-size = 24;
      indicator-idle-visible = false;
      indicator-radius = 100;
      show-failed-attempts = true;
    };
  };
}
