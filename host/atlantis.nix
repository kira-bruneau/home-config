{ lib, ... }:

{
  imports = [
    ../environment/cli.nix
    ../environment/gaming.nix
    ../environment/gui.nix
  ];

  programs.waybar.settings.mainBar.temperature = {
    hwmon-path-abs = "/sys/devices/platform/asus-ec-sensors/hwmon";
    input-filename = "temp2_input";
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "clonehero"
    "clonehero-unwrapped"
    "discord"
    "runescape-launcher"
    "sm64ex"
    "steam"
    "steam-original"
    "steam-run"
    "unrar"
    "data.zip"
    "vvvvvv"
  ];

  home.stateVersion = "22.11";
}
