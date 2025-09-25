{ ... }:
{
  services.hyprsunset.enable = true;
  services.swaync.enable = true;
  services.blueman-applet.enable = true;
  services.swayosd.enable = true;
  services.batsignal.enable = true;
  services.batsignal.extraArgs = [
    "-w"
    "20"
    "-c"
    "10"
    "-d"
    "5"
    "-p"
    "-m"
    "2"
  ];
}
