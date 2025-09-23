{
  config,
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.nvf.homeManagerModules.default
    inputs.catppuccin.homeModules.catppuccin
    ./home
  ];

  home = {
    stateVersion = "25.05"; # Do not change without ensuring compatibility

    username = "feo";
    homeDirectory = "/home/feo";

    packages = with pkgs; [
      wget
      curl
      jq
      swww
      hyprpolkitagent
      hyprlock
      obsidian
      dunst
      wl-clipboard
      networkmanagerapplet
      wl-color-picker
      playerctl
      brightnessctl
      pavucontrol
      wev
      nwg-look
      nwg-displays
      catppuccin-gtk
      rofi-power-menu
    ];

    sessionVariables = {
      EDITOR = "vim";
    };
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
    kvantum.enable = true;
  };

  gtk = {
    enable = true;

    theme = {
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

  programs.firefox.enable = true;
  programs.alacritty = {
    enable = true;
    settings = {
      font.size = 12;
      font.normal.family = "Berkeley Mono Nerd Font";
    };
  };
  programs.rofi.enable = true;
  programs.wofi.enable = true;
  programs.git = {
    enable = true;
    userEmail = "jens@feodor.dk";
    userName = "Jens Feodor Nielsen";
    aliases = {
      co = "checkout";
    };
  };

  services.hyprsunset.enable = true;
  services.swaync.enable = true;
  services.blueman-applet.enable = true;
  services.swayosd.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
