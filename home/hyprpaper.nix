{ ... }:
let
  imagePath = "/home/feo/Downloads/IMG_20250814_172041.jpg";
in
{
  services.hyprpaper.enable = true;
  services.hyprpaper.settings = {
    preload = [ "${imagePath}" ];
    wallpaper = [ ",${imagePath}" ];
  };
}
