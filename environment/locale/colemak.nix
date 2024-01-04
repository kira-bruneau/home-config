{ config, ... }:

{
  environment.etc."sway/config.d/colemak.conf".text = ''
    input * xkb_layout "us,us"
    input * xkb_variant "colemak,"
    input * xkb_options "grp:win_space_toggle"
  '';

  console.keyMap = ./colemak.map;

  # Fallback to initrd console configuration
  systemd.services = {
    systemd-vconsole-setup.enable = false;
    reload-systemd-vconsole-setup.enable = false;
  };
}
