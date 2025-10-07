{ config, pkgs, ... }:
let
  accent = "rosewater";
in
{
  gtk.enable = true;
  gtk.theme = {
    name = "catppuccin-mocha-${accent}-compact+rimless";
    package = pkgs.catppuccin-gtk.override {
      variant = "mocha";
      accents = [ "${accent}" ];
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
