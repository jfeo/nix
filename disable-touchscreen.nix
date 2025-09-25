{ pkgs, ... }:
let
  driverPath = "/sys/bus/hid/drivers/hid-multitouch";
  deviceID = "0018:04F3:2EA3.0001";
in
{
  systemd.services.unbind-touchscreen = {
    description = "Disable touchscreen by unbinding the HID device on boot";
    path = [ pkgs.coreutils ];
    script = ''
      [ -e "${driverPath}/${deviceID}" ] && echo "${deviceID}" | tee ${driverPath}/unbind || echo "Touchscreen device '${deviceID}' not found, probably already disabled"
    '';
    wantedBy = [ "multi-user.target" ];
  };
}
