{ config, pkgs, ... }:
{
  gtk.enable = true;
  gtk.theme = {
    name = "catppuccin-mocha-mauve-compact+rimless";
    package = pkgs.catppuccin-gtk.override {
      variant = "mocha";
      accents = [ "mauve" ];
      size = "compact";
      tweaks = [
        "rimless"
      ];
    };
  };

  # Now symlink the `~/.config/gtk-4.0/` folder declaratively:
  xdg.configFile = {
    "gtk-4.0/assets".source =
      "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source =
      "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source =
      "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

}
