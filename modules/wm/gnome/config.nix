{...}: {
  home-manager.sharedModules = [
    (
      {
        lib,
        config,
        ...
      }:
        with lib.hm.gvariant; {
          dconf.settings = lib.mkIf config.gnome.enable {
            "ca/desrt/dconf-editor" = {
              saved-pathbar-path = "/";
              saved-view = "/";
              show-warning = false;
              window-height = 500;
              window-is-maximized = false;
              window-width = 540;
            };

            "com/github/johnfactotum/Foliate/library" = {
              height = 982;
              maximized = true;
              page = "library";
              width = 1920;
            };

            "com/github/johnfactotum/Foliate/view" = {
              brightness = 0.5192307692307693;
              fg-color = "#ddd";
            };

            "org/gnome/Connections" = {
              first-run = true;
            };

            "org/gnome/Weather" = {
              locations = "[<(uint32 2, <('Paris', 'LFPB', true, [(0.85462956287765413, 0.042760566673861078)], [(0.8528842336256599, 0.040724343395436846)])>)>]";
            };

            "org/gnome/desktop/a11y/applications" = {
              screen-keyboard-enabled = false;
            };

            "org/gnome/desktop/a11y/interface" = {
              high-contrast = false;
            };

            "org/gnome/desktop/app-folders" = {
              folder-children = ["Utilities" "YaST"];
            };

            "org/gnome/desktop/app-folders/folders/Utilities" = {
              apps = ["gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.eog.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop"];
              categories = ["X-GNOME-Utilities"];
              name = "X-GNOME-Utilities.directory";
              translate = true;
            };

            "org/gnome/desktop/app-folders/folders/YaST" = {
              categories = ["X-SuSE-YaST"];
              name = "suse-yast.directory";
              translate = true;
            };

            "org/gnome/desktop/background" = {
              color-shading-type = "solid";
              picture-options = "zoom";
              picture-uri = "${./wallpapers/khachik-simonian.jpg}";
              picture-uri-dark = "${./wallpapers/khachik-simonian.jpg}";
              primary-color = "#000000000000";
              secondary-color = "#000000000000";
            };

            "org/gnome/desktop/input-sources" = {
              per-window = false;
              show-all-sources = false;
              sources = [(mkTuple ["xkb" "us+alt-intl"]) (mkTuple ["xkb" "fr+mac"])];
              xkb-options = ["terminate:ctrl_alt_bksp" "caps:swapescape" "lv3:ralt_switch"];
            };

            "org/gnome/desktop/interface" = {
              color-scheme = "prefer-dark";
              enable-animations = true;
              font-antialiasing = "grayscale";
              font-hinting = "slight";
              gtk-theme = "Nordic";
              locate-pointer = false;
              show-battery-percentage = true;
              toolkit-accessibility = false;
            };

            "org/gnome/desktop/notifications" = {
              application-children = ["gnome-power-panel" "discord" "spotify" "org-gnome-tweaks" "firefox" "signal-desktop" "code" "org-gnome-settings" "org-gnome-evolution-alarm-notify" "gnome-network-panel" "org-gnome-geary" "org-gnome-seahorse-application" "org-gnome-nautilus"];
              show-banners = true;
            };

            "org/gnome/desktop/notifications/application/code" = {
              application-id = "code.desktop";
            };

            "org/gnome/desktop/notifications/application/discord" = {
              application-id = "discord.desktop";
            };

            "org/gnome/desktop/notifications/application/firefox" = {
              application-id = "firefox.desktop";
            };

            "org/gnome/desktop/notifications/application/gnome-network-panel" = {
              application-id = "gnome-network-panel.desktop";
            };

            "org/gnome/desktop/notifications/application/gnome-power-panel" = {
              application-id = "gnome-power-panel.desktop";
            };

            "org/gnome/desktop/notifications/application/org-gnome-evolution-alarm-notify" = {
              application-id = "org.gnome.Evolution-alarm-notify.desktop";
            };

            "org/gnome/desktop/notifications/application/org-gnome-geary" = {
              application-id = "org.gnome.Geary.desktop";
            };

            "org/gnome/desktop/notifications/application/org-gnome-nautilus" = {
              application-id = "org.gnome.Nautilus.desktop";
            };

            "org/gnome/desktop/notifications/application/org-gnome-seahorse-application" = {
              application-id = "org.gnome.seahorse.Application.desktop";
            };

            "org/gnome/desktop/notifications/application/org-gnome-settings" = {
              application-id = "org.gnome.Settings.desktop";
            };

            "org/gnome/desktop/notifications/application/org-gnome-tweaks" = {
              application-id = "org.gnome.tweaks.desktop";
            };

            "org/gnome/desktop/notifications/application/signal-desktop" = {
              application-id = "signal-desktop.desktop";
            };

            "org/gnome/desktop/notifications/application/spotify" = {
              application-id = "spotify.desktop";
            };

            "org/gnome/desktop/peripherals/keyboard" = {
              delay = mkUint32 200;
              repeat = true;
              repeat-interval = mkUint32 10;
            };

            "org/gnome/desktop/peripherals/mouse" = {
              accel-profile = "default";
              natural-scroll = false;
            };

            "org/gnome/desktop/peripherals/touchpad" = {
              two-finger-scrolling-enabled = true;
            };

            "org/gnome/desktop/screensaver" = {
              color-shading-type = "solid";
              picture-options = "zoom";
              picture-uri = "${./wallpapers/khachik-simonian.jpg}";
              primary-color = "#000000000000";
              secondary-color = "#000000000000";
            };

            "org/gnome/desktop/search-providers" = {
              sort-order = ["org.gnome.Contacts.desktop" "org.gnome.Documents.desktop" "org.gnome.Nautilus.desktop"];
            };

            "org/gnome/desktop/session" = {
              idle-delay = mkUint32 300;
            };

            "org/gnome/desktop/sound" = {
              event-sounds = true;
              theme-name = "__custom";
            };

            "org/gnome/desktop/wm/keybindings" = {
              minimize = [];
              move-to-workspace-1 = ["<Alt><Super>1"];
              move-to-workspace-2 = ["<Alt><Super>2"];
              move-to-workspace-3 = ["<Alt><Super>3"];
              move-to-workspace-4 = ["<Alt><Super>4"];
              switch-to-workspace-1 = ["<Super>1"];
              switch-to-workspace-2 = ["<Super>2"];
              switch-to-workspace-3 = ["<Super>3"];
              switch-to-workspace-4 = ["<Super>4"];
              switch-windows = ["<Control>Tab"];
              switch-windows-backward = ["<Shift><Control>Tab"];
              toggle-fullscreen = ["<Super>f"];
              toggle-maximized = ["<Super>e"];
            };

            "org/gnome/desktop/wm/preferences" = {
              focus-mode = "click";
              theme = "Nordic";
            };

            "org/gnome/evince/default" = {
              continuous = true;
              dual-page = false;
              dual-page-odd-left = false;
              enable-spellchecking = true;
              fullscreen = false;
              inverted-colors = false;
              show-sidebar = false;
              sidebar-page = "thumbnails";
              sidebar-size = 132;
              sizing-mode = "automatic";
              window-ratio = mkTuple [1.6134453781512605 1.2446555819477434];
            };

            "org/gnome/evolution-data-server" = {
              migrated = true;
              network-monitor-gio-name = "";
            };

            "org/gnome/evolution-data-server/calendar" = {
              reminders-past = [];
            };

            "org/gnome/file-roller/dialogs/extract" = {
              recreate-folders = true;
              skip-newer = false;
            };

            "org/gnome/file-roller/listing" = {
              list-mode = "as-folder";
              name-column-width = 250;
              show-path = false;
              sort-method = "name";
              sort-type = "ascending";
            };

            "org/gnome/file-roller/ui" = {
              sidebar-width = 200;
              window-height = 1001;
              window-width = 960;
            };

            "org/gnome/gnome-system-monitor" = {
              maximized = false;
              network-total-in-bits = false;
              show-dependencies = false;
              show-whose-processes = "user";
              window-state = mkTuple [700 500];
            };

            "org/gnome/gnome-system-monitor/disktreenew" = {
              col-6-visible = true;
              col-6-width = 0;
            };

            "org/gnome/gnome-system-monitor/memmapstree" = {
              sort-col = 0;
              sort-order = 0;
            };

            "org/gnome/mutter" = {
              attach-modal-dialogs = true;
              dynamic-workspaces = true;
              edge-tiling = true;
              focus-change-on-pointer-rest = true;
              workspaces-only-on-primary = true;
            };

            "org/gnome/mutter/keybindings" = {
              toggle-tiled-left = ["<Shift><Super>h"];
              toggle-tiled-right = ["<Shift><Super>l"];
            };

            "org/gnome/nautilus/compression" = {
              default-compression-format = "zip";
            };

            "org/gnome/nautilus/list-view" = {
              default-zoom-level = "small";
            };

            "org/gnome/nautilus/preferences" = {
              default-folder-viewer = "list-view";
              migrated-gtk-settings = true;
              search-filter-time-type = "last_modified";
              search-view = "list-view";
            };

            "org/gnome/settings-daemon/plugins/color" = {
              night-light-enabled = true;
              night-light-temperature = mkUint32 1993;
            };

            "org/gnome/settings-daemon/plugins/media-keys" = {
              custom-keybindings = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"];
              next = ["AudioNext"];
              pause = [];
              play = ["AudioPlay"];
              previous = ["AudioPrev"];
              screensaver = ["<Alt>l"];
              search = ["<Super>d"];
              volume-down = [];
              volume-mute = ["AudioMute"];
              volume-up = ["AudioRaiseVolume"];
            };

            "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
              binding = "<Super>Return";
              command = "alacritty";
              name = "Alacritty";
            };

            "org/gnome/settings-daemon/plugins/power" = {
              power-button-action = "hibernate";
              sleep-inactive-ac-timeout = 7200;
              sleep-inactive-ac-type = "nothing";
            };

            "org/gnome/shell" = {
              app-picker-layout = "[{'org.gnome.Contacts.desktop': <{'position': <0>}>, 'org.gnome.Weather.desktop': <{'position': <1>}>, 'org.gnome.clocks.desktop': <{'position': <2>}>, 'org.gnome.Maps.desktop': <{'position': <3>}>, 'org.gnome.Extensions.desktop': <{'position': <4>}>, 'org.gnome.Totem.desktop': <{'position': <5>}>, 'org.gnome.Calculator.desktop': <{'position': <6>}>, 'cups.desktop': <{'position': <7>}>, 'simple-scan.desktop': <{'position': <8>}>, 'org.gnome.Epiphany.desktop': <{'position': <9>}>, 'nixos-manual.desktop': <{'position': <10>}>, 'org.gnome.Settings.desktop': <{'position': <11>}>, 'org.gnome.Photos.desktop': <{'position': <12>}>, 'org.gnome.Music.desktop': <{'position': <13>}>, 'gnome-system-monitor.desktop': <{'position': <14>}>, 'org.gnome.TextEditor.desktop': <{'position': <15>}>, 'org.gnome.Tour.desktop': <{'position': <16>}>, 'Utilities': <{'position': <17>}>, 'xterm.desktop': <{'position': <18>}>, 'yelp.desktop': <{'position': <19>}>, 'org.gnome.Cheese.desktop': <{'position': <20>}>, 'org.gnome.Geary.desktop': <{'position': <21>}>, 'bitwarden.desktop': <{'position': <22>}>, 'org.gnome.Calendar.desktop': <{'position': <23>}>}, {'btop.desktop': <{'position': <0>}>, 'discord-canary.desktop': <{'position': <1>}>, 'freetube.desktop': <{'position': <2>}>, 'ghidra.desktop': <{'position': <3>}>, 'htop.desktop': <{'position': <4>}>, 'com.github.iwalton3.jellyfin-media-player.desktop': <{'position': <5>}>, 'networkmanager_dmenu.desktop': <{'position': <6>}>, 'pavucontrol.desktop': <{'position': <7>}>, 'qv4l2.desktop': <{'position': <8>}>, 'qvidcap.desktop': <{'position': <9>}>, 'signal-desktop.desktop': <{'position': <10>}>, 'thunderbird.desktop': <{'position': <11>}>, 'virt-manager.desktop': <{'position': <12>}>, 'code.desktop': <{'position': <13>}>, 'whatsapp-for-linux.desktop': <{'position': <14>}>, 'nvim.desktop': <{'position': <15>}>}]";
              disable-user-extensions = false;
              disabled-extensions = ["native-window-placement@gnome-shell-extensions.gcampax.github.com" "launch-new-instance@gnome-shell-extensions.gcampax.github.com" "gsconnect@andyholmes.github.io" "just-perfection-desktop@just-perfection" "user-theme@gnome-shell-extensions.gcampax.github.com" "dash-to-dock@micxgx.gmail.com" "widgets@aylur" "window-list@gnome-shell-extensions.gcampax.github.com" "windowsNavigator@gnome-shell-extensions.gcampax.github.com" "workspace-indicator@gnome-shell-extensions.gcampax.github.com" "screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com" "apps-menu@gnome-shell-extensions.gcampax.github.com"];
              enabled-extensions = ["openweather-extension@jenslody.de" "Vitals@CoreCoding.com" "blur-my-shell@aunetx" "auto-move-windows@gnome-shell-extensions.gcampax.github.com" "hibernate-status@dromi"];
              favorite-apps = ["Alacritty.desktop" "firefox.desktop" "spotify.desktop" "discord.desktop" "org.gnome.Nautilus.desktop" "bitwarden.desktop"];
              last-selected-power-profile = "performance";
              welcome-dialog-last-shown-version = "42.4";
            };

            "org/gnome/shell/extensions/auto-move-windows" = {
              application-list = ["Alacritty.desktop:1" "firefox.desktop:2"];
            };

            "org/gnome/shell/extensions/aylurs-widgets" = {
              background-clock = false;
              battery-bar = false;
              battery-bar-low-threshold = 10;
              battery-bar-position = 2;
              dash-board = false;
              dash-link-names = ["reddit" "youtube" "gmail" "twitter" "github"];
              dash-link-urls = ["https://www.reddit.com/" "https://www.youtube.com/" "https://www.gmail.com/" "https://twitter.com/" "https://www.github.com/"];
              date-menu-mod = false;
              media-player = true;
              notification-indicator = true;
              power-menu = true;
              quick-toggles = true;
              quick-toggles-style = 2;
              workspace-indicator = true;
            };

            "org/gnome/shell/extensions/blur-my-shell" = {
              brightness = 1.0;
              color-and-noise = false;
              hacks-level = 0;
              noise-amount = 0.0;
              noise-lightness = 0.0;
              sigma = 37;
            };

            "org/gnome/shell/extensions/blur-my-shell/applications" = {
              blur = true;
            };

            "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
              blur = true;
              style-dash-to-dock = 0;
              unblur-in-overview = false;
            };

            "org/gnome/shell/extensions/blur-my-shell/window-list" = {
              customize = true;
            };

            "org/gnome/shell/extensions/dash-to-dock" = {
              apply-custom-theme = true;
              background-color = "rgb(61,56,70)";
              background-opacity = 0.98;
              custom-background-color = false;
              custom-theme-shrink = false;
              customize-alphas = true;
              dash-max-icon-size = 48;
              disable-overview-on-startup = false;
              dock-fixed = true;
              dock-position = "RIGHT";
              height-fraction = 0.9;
              intellihide-mode = "FOCUS_APPLICATION_WINDOWS";
              max-alpha = 0.8;
              multi-monitor = false;
              preferred-monitor = -2;
              preferred-monitor-by-connector = "HDMI-2";
              preview-size-scale = 0.0;
              running-indicator-style = "DOTS";
              transparency-mode = "FIXED";
            };

            "org/gnome/shell/extensions/gsconnect/preferences" = {
              window-maximized = false;
              window-size = mkTuple [640 440];
            };

            "org/gnome/shell/extensions/just-perfection" = {
              accessibility-menu = true;
              activities-button = true;
              animation = 1;
              app-menu = true;
              app-menu-icon = true;
              app-menu-label = true;
              background-menu = true;
              clock-menu = true;
              dash = true;
              dash-icon-size = 0;
              double-super-to-appgrid = true;
              gesture = true;
              hot-corner = false;
              keyboard-layout = true;
              osd = true;
              panel = true;
              panel-arrow = true;
              panel-corner-size = 0;
              panel-in-overview = true;
              panel-size = 0;
              quick-settings = true;
              ripple-box = true;
              search = true;
              show-apps-button = true;
              startup-status = 1;
              theme = false;
              top-panel-position = 0;
              window-demands-attention-focus = false;
              window-picker-icon = true;
              window-preview-caption = true;
              workspace = true;
              workspace-background-corner-size = 0;
              workspace-popup = true;
              workspaces-in-app-grid = true;
            };

            "org/gnome/shell/extensions/openweather" = {
              city = "48.8588897,2.3200410217200766>Paris, Île-de-France, France métropolitaine, France>0";
            };

            "org/gnome/shell/extensions/user-theme" = {
              name = "Nordic-Polar";
            };

            "org/gnome/shell/extensions/vitals" = {
              fixed-widths = true;
              hide-icons = false;
              hide-zeros = false;
              hot-sensors = ["__network-rx_max__" "_processor_usage_" "_memory_allocated_"];
              position-in-panel = 2;
              show-battery = true;
              show-memory = true;
              storage-measurement = 1;
            };

            "org/gnome/shell/extensions/window-list" = {
              grouping-mode = "auto";
            };

            "org/gnome/shell/keybindings" = {
              switch-to-application-1 = [];
              switch-to-application-2 = [];
              switch-to-application-3 = [];
              switch-to-application-4 = [];
            };

            "org/gnome/shell/weather" = {
              automatic-location = true;
              locations = "[<(uint32 2, <('Paris', 'LFPB', true, [(0.85462956287765413, 0.042760566673861078)], [(0.8528842336256599, 0.040724343395436846)])>)>]";
            };

            "org/gnome/shell/world-clocks" = {
              locations = "@av []";
            };

            "org/gnome/tweaks" = {
              show-extensions-notice = false;
            };

            "org/gtk/gtk4/settings/color-chooser" = {
              custom-colors = [(mkTuple [0.0 0.0])];
              selected-color = mkTuple [true 0.0];
            };

            "org/gtk/gtk4/settings/file-chooser" = {
              date-format = "regular";
              location-mode = "path-bar";
              show-hidden = false;
              show-size-column = true;
              show-type-column = true;
              sidebar-width = 183;
              sort-column = "name";
              sort-directories-first = false;
              sort-order = "ascending";
              type-format = "category";
              window-size = mkTuple [922 374];
            };

            "org/virt-manager/virt-manager/confirm" = {
              delete-storage = true;
              forcepoweroff = true;
              unapplied-dev = true;
            };

            "org/virt-manager/virt-manager/connections" = {
              autoconnect = ["qemu:///session"];
              uris = ["qemu:///session"];
            };

            "org/virt-manager/virt-manager/details" = {
              show-toolbar = true;
            };

            "system/proxy" = {
              mode = "none";
            };
          };
        }
    )
  ];
}
