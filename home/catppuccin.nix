{pkgs, ...}: {
  qt.enable = true;
  qt.style.name = "kvantum";

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "rosewater";
    kvantum.enable = true;
  };

  home.pointerCursor = {
    enable = true;
    name = "catppuccin-mocha-dark-cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 22;
  };
}
