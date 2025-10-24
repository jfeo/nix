{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # desktop environment
    hyprpolkitagent
    hypridle
    hyprlock
    wev
    nwg-look
    nwg-displays
    networkmanagerapplet
    dunst
    rofi-power-menu
    grimblast
    catppuccin-gtk
    catppuccin-cursors.mochaDark
    playerctl
    brightnessctl
    pavucontrol
    swww
    wl-color-picker

    # cli utils
    silver-searcher
    starship
    wget
    curl
    jq
    file
    wl-clipboard

    # fonts
    font-awesome
    fira

    # programming
    typst
    typstyle

    # file management and viewers
    xfce.thunar
    xfce.tumbler # thumbnails
    xfce.catfish
    kdePackages.okular
    qimgv

    # editing and office software
    obsidian
    gimp
    inkscape
    libreoffice
  ];
}
