{ pkgs, ... }:

{
  imports = [
    ../environment/server.nix

    # Window managers
    ../package/sway

    # Web
    ../package/firefox
    ../package/jellyfin
    ../package/newsflash

    # Media & Documents
    ../package/anytype
    ../package/emacs
    ../package/loupe
    ../package/evince
    ../package/keepassxc
    ../package/lmms
    ../package/mpv

    # Themes
    ../package/gtk

    # Utils
    ../package/speedcrunch
    ../package/gnome-pomodoro
  ];

  home.packages = with pkgs; [
    # Administration
    gnome.dconf-editor
    helvum
    iwgtk
    pavucontrol

    # Web
    qbittorrent
    syncplay
    ungoogled-chromium
    yt-dlp

    # Chat
    discord

    # Media & Documents
    audacity
    ffmpeg
    gimp
    gnome.file-roller
    gnome.nautilus
    gnucash
    inkscape
    libreoffice
    poke
    sqlitebrowser
    xournalpp
    zynaddsubfx

    # Fonts
    inter

    # Utils
    gnome.gnome-clocks
    libnotify
    yabridge
    yabridgectl

    # Nix
    cachix
    nix-bisect
    nix-index
    nix-init
    nixpkgs-review
    nurl
    patchelf

    # General development
    binutils
    file
    linuxPackages.perf
    tokei

    # Debuggers
    strace
    tcpflow
    valgrind
  ];

  home = {
    pointerCursor = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
      size = 24;
    };

    sessionVariables = {
      # Use Wayland for Chrome & Electron apps
      NIXOS_OZONE_WL = 1;

      # Improve appearance of Java applications
      # https://wiki.archlinux.org/index.php/Java#Tips_and_tricks
      _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel";
    };
  };

  xdg = {
    mimeApps.enable = true;

    # mimeapps.list often gets overwritten by applications adding mimetype associations
    configFile."mimeapps.list".force = true;
  };

  fonts.fontconfig.enable = true;
  xdg.configFile."fontconfig/fonts.conf".text = ''
    <?xml version='1.0'?>
    <!DOCTYPE fontconfig SYSTEM 'urn:fontconfig:fonts.dtd'>
    <fontconfig>
      <alias binding="same">
      <family>sans-serif</family>
      <prefer><family>Inter</family></prefer>
      </alias>
    </fontconfig>
  '';

  wayland.windowManager.sway.config = {
    assigns = {
      "1" = [
        { app_id = "^chromium-browser$"; }
      ];
      "4" = [
        { app_id = "^org.qbittorrent.qBittorrent$"; }
        { title = "^Syncplay"; }
      ];
      "10" = [
        { app_id = "^Caprine$"; }
        { app_id = "^discord$"; }
      ];
    };

    window.commands = [
      {
        criteria = { app_id = "^discord$"; title = "^$"; };
        command = "floating enable, sticky enable, border pixel 0, resize set 480 270, move position 1004 680, opacity 0.8";
      }
    ];
  };

  programs.waybar.settings.mainBar = {
    network = {
      on-click = "${pkgs.iwgtk}/bin/iwgtk";
    };

    wireplumber = {
      on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
      on-click-right = "${pkgs.helvum}/bin/helvum";
    };
  };

  services.gpg-agent.pinentryFlavor = "gnome3";

  services.easyeffects.enable = true;
}
