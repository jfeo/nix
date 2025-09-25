{ pkgs, ... }:
{
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
    kvantum.enable = true;
  };

  home.pointerCursor = {
    enable = true;
    name = "Catpuccin Mocha Dark";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 24;
  };
}
