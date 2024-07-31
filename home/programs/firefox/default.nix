{
  lib,
  config,
  pkgs,
  ...
}:

{
  programs.firefox = {
    enable = true;

    policies = {
      ExtensionSettings = {
        "@testpilot-containers" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/multi-account-containers/latest.xpi";
        };

        "PopupWindow@ettoolong" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/popup-window/latest.xpi";
        };

        "sponsorBlocker@ajay.app" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
        };

        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        };

        "{0d7cafdd-501c-49ca-8ebb-e3341caaa55e}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/youtube-nonstop/latest.xpi";
        };

        "{74145f27-f039-47ce-a470-a662b129930a}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
        };

        "{9a41dee2-b924-4161-a971-7fb35c053a4a}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/enhanced-h264ify/latest.xpi";
        };

        "{b86e4813-687a-43e6-ab65-0bde4ab75758}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/localcdn-fork-of-decentraleyes/latest.xpi";
        };

        "{c2c003ee-bd69-42a2-b0e9-6f34222cb046}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/auto-tab-discard/latest.xpi";
        };
      };
    };

    profiles =
      let
        baseProfile = {
          search = {
            force = true;
            default = "DuckDuckGo";

            order = [
              "DuckDuckGo"
              "Google"
            ];

            engines = {
              "Amazon.ca".metaData.alias = "@a";
              "Bing".metaData.hidden = true;
              "eBay".metaData.hidden = true;
              "Google".metaData.alias = "@g";
              "Wikipedia (en)".metaData.alias = "@w";

              "GitHub" = {
                urls = [
                  {
                    template = "https://github.com/search";
                    params = [
                      {
                        name = "q";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];

                iconUpdateURL = "https://github.githubassets.com/favicons/favicon.svg";
                updateInterval = 7 * 24 * 60 * 60 * 1000; # every week
                definedAliases = [ "@gh" ];
              };

              "Nixhub.io" = {
                urls = [
                  {
                    template = "https://www.nixhub.io/search";
                    params = [
                      {
                        name = "q";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];

                iconUpdateURL = "https://www.nixhub.io/favicon.svg";
                updateInterval = 7 * 24 * 60 * 60 * 1000; # every week
                definedAliases = [ "@nh" ];
              };

              "Nix Options" = {
                urls = [
                  {
                    template = "https://search.nixos.org/options";
                    params = [
                      {
                        name = "channel";
                        value = "unstable";
                      }
                      {
                        name = "query";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];

                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@no" ];
              };

              "Nix Packages" = {
                urls = [
                  {
                    template = "https://search.nixos.org/packages";
                    params = [
                      {
                        name = "channel";
                        value = "unstable";
                      }
                      {
                        name = "query";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];

                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@np" ];
              };

              "NixOS Wiki" = {
                urls = [
                  {
                    template = "https://wiki.nixos.org/w/index.php";
                    params = [
                      {
                        name = "search";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];

                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@nw" ];
              };

              "Nixpkgs Issues" = {
                urls = [
                  {
                    template = "https://github.com/NixOS/nixpkgs/issues";
                    params = [
                      {
                        name = "q";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];

                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@ni" ];
              };

              # A good way to find genuine discussion
              "Reddit" = {
                urls = [
                  {
                    template = "https://www.reddit.com/search";
                    params = [
                      {
                        name = "q";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];

                iconUpdateURL = "https://www.redditstatic.com/shreddit/assets/favicon/512x512.png";
                updateInterval = 7 * 24 * 60 * 60 * 1000; # every week
                definedAliases = [ "@r" ];
              };

              "Youtube" = {
                urls = [
                  {
                    template = "https://www.youtube.com/results";
                    params = [
                      {
                        name = "search_query";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];

                iconUpdateURL = "https://www.youtube.com/s/desktop/103479f3/img/favicon_144x144.png";
                updateInterval = 7 * 24 * 60 * 60 * 1000; # every week
                definedAliases = [ "@y" ];
              };
            };
          };

          settings = {
            "accessibility.typeaheadfind.flashBar" = 0;
            "apz.gtk.pangesture.delta_mode" = 2; # pixel mode
            "apz.gtk.pangesture.pixel_delta_mode_multiplier" = "80"; # default is 40
            "apz.overscroll.enabled" = true;
            "browser.aboutConfig.showWarning" = false;
            "browser.aboutwelcome.enabled" = false;
            "browser.contentblocking.category" = "strict";

            "browser.newtabpage.blocked" = builtins.toJSON {
              # Dismiss builtin shortcuts
              "26UbzFJ7qT9/4DhodHKA1Q==" = 1; # youtube.com
              "4gPpjkxgZzXPVtuEoAL9Ig==" = 1; # facebook.com
              "eV8/WsSLxHadrTL1gAxhug==" = 1; # wikipedia.org
              "gLv0ja2RYVgxKdp0I5qwvA==" = 1; # reddit.com
              "K00ILysCaEq8+bEqV/3nuw==" = 1; # amazon.com
              "oYry01JR5qiqP3ru9Hdmtg==" = 1; # amazon.ca
              "T9nJot5PurhJSy8n038xGA==" = 1; # twitter.com
            };

            "browser.newtabpage.enabled" = true;
            "browser.crashReports.unsubmittedCheck.enabled" = false;
            "browser.newtabpage.pinned" = builtins.toJSON [ ];
            "browser.places.importBookmarksHTML" = true;
            "browser.shell.checkDefaultBrowser" = false;
            "browser.startup.homepage" = "about:home";
            "browser.startup.page" = 3; # Restore previous session
            "browser.tabs.firefox-view" = false;
            "browser.tabs.tabClipWidth" = 999; # Hide close button on inactive tabs
            "browser.tabs.warnOnClose" = false;
            "browser.toolbars.bookmarks.visibility" = "newtab";

            "browser.uiCustomization.state" = builtins.toJSON {
              placements = {
                widget-overflow-fixed-list = [ ];
                unified-extensions-area = [ ];

                nav-bar = [
                  "back-button"
                  "forward-button"
                  "stop-reload-button"
                  "urlbar-container"
                  "downloads-button"
                  "fxa-toolbar-menu-button"

                  # Extensions
                  "_testpilot-containers-browser-action"
                  "keepassxc-browser_keepassxc_org-browser-action"
                  "ublock0_raymondhill_net-browser-action"

                  "unified-extensions-button"
                ];

                toolbar-menubar = [ "menubar-items" ];

                TabsToolbar = [
                  "tabbrowser-tabs"
                  "new-tab-button"
                  "alltabs-button"
                ];

                PersonalToolbar = [
                  "import-button"
                  "personal-bookmarks"
                ];
              };

              seen = [
                "save-to-pocket-button"
                "developer-button"

                # Extensions
                "_0d7cafdd-501c-49ca-8ebb-e3341caaa55e_-browser-action" # Youtube NonStop
                "_74145f27-f039-47ce-a470-a662b129930a_-browser-action" # ClearURLs
                "_9a41dee2-b924-4161-a971-7fb35c053a4a_-browser-action" # enhanced-h264ify
                "_b86e4813-687a-43e6-ab65-0bde4ab75758_-browser-action" # LocalCDN
                "_c2c003ee-bd69-42a2-b0e9-6f34222cb046_-browser-action" # Auto Tab Discard
                "_testpilot-containers-browser-action"
                "keepassxc-browser_keepassxc_org-browser-action"
                "popupwindow_ettoolong-browser-action"
                "sponsorblocker_ajay_app-browser-action"
                "ublock0_raymondhill_net-browser-action"
              ];

              dirtyAreaCache = [
                "nav-bar"
                "toolbar-menubar"
                "TabsToolbar"
                "PersonalToolbar"
                "unified-extensions-area"
              ];

              currentVersion = 20;
              newElementCount = 2;
            };

            "browser.warnOnQuit" = false;
            "devtools.selfxss.count" = 5; # Allow pasting into console
            "dom.security.https_only_mode" = true;
            "extensions.formautofill.creditCards.available" = false;
            "extensions.formautofill.creditCards.enabled" = false;
            "extensions.unifiedExtensions.enabled" = false;
            "layout.spellcheckDefault" = 1;
            "services.sync.engine.creditcards" = false;
            "services.sync.engine.passwords" = false;
            "services.sync.engine.prefs" = false;
            "signon.rememberSignons" = false; # Use keepassxc instead
            "widget.wayland.fractional-scale.enabled" = true;

            # Search
            "browser.search.suggest.enabled" = false;
            "browser.search.update" = false;
            "browser.urlbar.merino.enabled" = false;
            "browser.urlbar.merino.endpointURL" = "https://127.0.0.1";

            # Activity stream
            "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
            "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
            "browser.newtabpage.activity-stream.feeds.snippets" = false;
            "browser.newtabpage.activity-stream.feeds.topsites" = true;
            "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned" = "google"; # Don't autopin google on first run
            "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
            "browser.newtabpage.activity-stream.showSponsored" = false;
            "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;

            # Extension recommendation
            "browser.discovery.enabled" = false;
            "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
            "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;

            # Normandy preference rollout
            "app.normandy.api_url" = "https://127.0.0.1";
            "app.normandy.enabled" = false;

            # Safe browsing
            "browser.safebrowsing.downloads.enabled" = false;
            "browser.safebrowsing.downloads.remote.url" = "https://127.0.0.1";
            "browser.safebrowsing.malware.enabled" = false;
            "browser.safebrowsing.phishing.enabled" = false;
            "browser.safebrowsing.provider.google.gethashURL" = "https://127.0.0.1";
            "browser.safebrowsing.provider.google.updateURL" = "https://127.0.0.1";
            "browser.safebrowsing.provider.google4.gethashURL" = "https://127.0.0.1";
            "browser.safebrowsing.provider.google4.updateURL" = "https://127.0.0.1";
            "browser.safebrowsing.provider.mozilla.gethashURL" = "https://127.0.0.1";
            "browser.safebrowsing.provider.mozilla.updateURL" = "https://127.0.0.1";

            # Telemetry
            "app.shield.optoutstudies.enabled" = false;
            "browser.newtabpage.activity-stream.feeds.telemetry" = false;
            "browser.newtabpage.activity-stream.telemetry" = false;
            "browser.ping-centre.telemetry" = false;
            "datareporting.healthreport.uploadEnabled" = false;
            "datareporting.policy.dataSubmissionEnabled" = false;
            "dom.private-attribution.submission.enabled" = false;
            "dom.security.unexpected_system_load_telemetry_enabled" = false;
            "network.trr.confirmation_telemetry_enabled" = false;
            "security.app_menu.recordEventTelemetry" = false;
            "security.certerrors.recordEventTelemetry" = false;
            "security.identitypopup.recordEventTelemetry" = false;
            "security.protectionspopup.recordEventTelemetry" = false;
            "toolkit.telemetry.archive.enabled" = false;
            "toolkit.telemetry.bhrPing.enabled" = false;
            "toolkit.telemetry.enabled" = false;
            "toolkit.telemetry.firstShutdownPing.enabled" = false;
            "toolkit.telemetry.newProfilePing.enabled" = false;
            "toolkit.telemetry.reportingpolicy.firstRun" = false;
            "toolkit.telemetry.server" = "https://127.0.0.1";
            "toolkit.telemetry.shutdownPingSender.enabled" = false;
            "toolkit.telemetry.unified" = false;
            "toolkit.telemetry.updatePing.enabled" = false;

            # EME extension (for DRM media)
            "browser.eme.ui.enabled" = false;
            "media.eme.enabled" = false;
            "media.gmp-widevinecdm.enabled" = false;

            # Trusted Recursive Resolver: I use dnscrypt-proxy instead
            "network.trr.mode" = 5;
          };
        };
      in
      {
        firefox = lib.mkMerge [
          baseProfile
          {
            id = 0;
            name = "Firefox";
            path = config.home.username;
            settings."extensions.activeThemeID" = "firefox-alpenglow@mozilla.org";
          }
        ];
      };
  };

  xdg = {
    desktopEntries = builtins.mapAttrs (id: profile: {
      type = "Application";
      name = profile.name;
      genericName = "Web Browser";
      icon = id;

      categories = [
        "Network"
        "WebBrowser"
      ];

      exec = "firefox -P ${profile.name} --new-tab %U";
    }) config.programs.firefox.profiles;

    mimeApps.defaultApplications = {
      "application/vnd.mozilla.xul+xml" = "firefox.desktop";
      "application/xhtml+xml" = "firefox.desktop";
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
    };
  };

  home = {
    activation.firefoxPermissions =
      let
        permissions = {
          "https://app.element.io" = {
            "desktop-notification" = "allow";
            "persistent-storage" = "allow";
          };

          "https://calendar.proton.me" = {
            "desktop-notification" = "allow";
          };

          "https://discord.com" = {
            "desktop-notification" = "allow";
          };

          "https://mail.proton.me" = {
            "desktop-notification" = "allow";
          };
        };

        db = lib.escapeShellArg "${config.home.homeDirectory}/.mozilla/firefox/${config.home.username}/permissions.sqlite";

        schemaSQL = pkgs.writeText "schema.sql" ''
          BEGIN TRANSACTION;

          PRAGMA user_version = 12;

          CREATE TABLE moz_perms(
            id INTEGER,
            origin TEXT,
            type TEXT,
            permission INTEGER,
            expireType INTEGER,
            expireTime INTEGER,
            modificationTime INTEGER,
            PRIMARY KEY(id)
          );

          -- Deprecated table, for backwards compatibility
          CREATE TABLE moz_hosts(
            id INTEGER,
            host TEXT,
            type TEXT,
            permission INTEGER,
            expireType INTEGER,
            expireTime INTEGER,
            modificationTime INTEGER,
            isInBrowserElement INTEGER,
            PRIMARY KEY(id)
          );

          COMMIT;
        '';

        dataSQL =
          let
            escapeString = str: "'${builtins.replaceStrings [ "'" ] [ "''" ] str}'";
            escapeInt = int: toString int;
            permissionValue = {
              allow = 1;
              deny = 2;
              prompt = 3;
            };
          in
          pkgs.writeText "data.sql" ''
            BEGIN TRANSACTION;

            -- Add a unique index on moz_perms(origin, type), to support upserts
            CREATE UNIQUE INDEX IF NOT EXISTS moz_perms_upsert_index ON moz_perms(origin, type);

            WITH now(unix_ms) AS (SELECT CAST((julianday('now') - 2440587.5) * 86400000 AS INTEGER))
            INSERT INTO moz_perms(origin, type, permission, expireType, expireTime, modificationTime)
            VALUES
            ${lib.concatStringsSep ",\n" (
              builtins.concatMap (
                origin:
                let
                  originPermissions = permissions.${origin};
                in
                (builtins.map (
                  type:
                  let
                    permission = permissionValue.${originPermissions.${type}};
                  in
                  "  (${escapeString origin}, ${escapeString type}, ${escapeInt permission}, 0, 0, (SELECT unix_ms FROM now))"
                ) (builtins.attrNames originPermissions))
              ) (builtins.attrNames permissions)
            )}
            ON CONFLICT(origin, type) DO UPDATE SET
              permission=excluded.permission,
              expireType=excluded.expireType,
              expireTime=excluded.expireTime,
              modificationTime=excluded.modificationTime;

            COMMIT;
          '';
      in
      lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        if [ ! -e ${db} ]; then
          $DRY_RUN_CMD mkdir -p $VERBOSE_ARG $(dirname ${db})
          $DRY_RUN_CMD ${pkgs.sqlite}/bin/sqlite3 ${db} < ${schemaSQL}
        fi

        # Ignore errors, firefox enforces an exclusive lock on the db while running
        $DRY_RUN_CMD ${pkgs.sqlite}/bin/sqlite3 ${db} < ${dataSQL} || :
      '';
  };

  wayland.windowManager.sway.config = {
    startup = [ { command = "${config.programs.firefox.package}/bin/firefox"; } ];
    assigns."1" = [ { app_id = "^firefox$"; } ];
    window.commands = [
      {
        criteria = {
          app_id = "^firefox$";
          title = "https://www.youtube.com";
        };

        command = "move container to workspace 4";
      }
      {
        criteria = {
          app_id = "^firefox$";
          title = "https://music.youtube.com";
        };

        command = "move container to workspace 4";
      }
      {
        criteria = {
          app_id = "^firefox$";
          title = "https://calendar.google.com";
        };

        command = "move container to workspace 7";
      }
      {
        criteria = {
          app_id = "^firefox$";
          title = "https://calendar.proton.me";
        };

        command = "move container to workspace 7";
      }
      {
        criteria = {
          app_id = "^firefox$";
          title = "https://mail.google.com";
        };

        command = "move container to workspace 9";
      }
      {
        criteria = {
          app_id = "^firefox$";
          title = "https://mail.proton.me";
        };

        command = "move container to workspace 9";
      }
      {
        criteria = {
          app_id = "^firefox$";
          title = "https://outlook.office.com";
        };

        command = "move container to workspace 9";
      }
      {
        criteria = {
          app_id = "^firefox$";
          title = "https://app.cinny.in";
        };

        command = "move container to workspace 10";
      }
      {
        criteria = {
          app_id = "^firefox$";
          title = "https://app.element.io";
        };

        command = "move container to workspace 10";
      }
      {
        criteria = {
          app_id = "^firefox$";
          title = "^Picture-in-Picture$";
        };

        command = "floating enable, sticky enable, border pixel 0, move position 1340 722, opacity 0.95";
      }
    ];
  };
}
