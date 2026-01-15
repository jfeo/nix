{...}: {
  imports = [
    ./gtk.nix
    ./qt.nix
    ./cursor.nix
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "rosewater";
  };
}
