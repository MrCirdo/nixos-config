{theme}: let
  colorShade = "500";
in ''
  /********************************
   * 1. Configuration globale
   ********************************/

  * {
    font-family: "Ubuntu Nerd Font";
    font-size: 14px;
    font-weight: 500;
  }

  window#waybar {
    color: white;
    background-color: rgba(0, 0, 0, 0.0);
  }

  /********************************
   * 2. Modules système standards
   ********************************/

  #cpu, #memory, #disk, #temperature, #pulseaudio {
    background-color: ${theme.backgroundColor};
    margin-top: 5px;
    padding: 5px 8px;
  }

  #cpu        { color: ${theme.tailwindcss.lime."${colorShade}"}; }
  #memory     { color: ${theme.tailwindcss.violet."${colorShade}"}; }
  #disk       { color: ${theme.tailwindcss.blue."${colorShade}"}; }
  #temperature{ color: ${theme.tailwindcss.red."${colorShade}"}; }
  #pulseaudio { color: ${theme.tailwindcss.pink."${colorShade}"}; }

  /********************************
   * 3. Modules custom (power & autres)
   ********************************/

  #custom-hibernation,
  #custom-sleep,
  #custom-reboot,
  #custom-lock {
    background-color: ${theme.backgroundColor2};
    margin-top: 5px;
    padding: 0 8px;
  }

  #custom-hibernation { color: ${theme.tailwindcss.purple."${colorShade}"}; }
  #custom-sleep       { color: ${theme.tailwindcss.yellow."${colorShade}"}; }
  #custom-reboot      { color: ${theme.tailwindcss.lime."${colorShade}"}; }
  #custom-lock        { color: ${theme.tailwindcss.sky."${colorShade}"}; }

  #custom-poweroff {
    background-color: ${theme.backgroundColor};
    color: ${theme.tailwindcss.red."${colorShade}"};
    margin-top: 5px;
    padding: 5px 8px;
  }

  #custom-begin {
    background-color: ${theme.backgroundColor};
    border-radius: 8px 0 0 8px;
    margin-top: 5px;
    padding: 5px 3px 5px 0;
  }

  #custom-nixos {
    background-color: ${theme.backgroundColor};
    color: ${theme.focusColor};
    margin: 5px 8px 0 0;
    padding: 0 5px;
    border-radius: 0 8px 8px 0;
  }

  #custom-tray-icon {
    color: ${theme.tailwindcss.teal."${colorShade}"};
    background-color: ${theme.backgroundColor};
    margin-top: 5px;
    padding: 5px 8px;
  }

  /********************************
   * 4. Tray & espace
   ********************************/

  #tray,
  #custom-space-tray {
    background-color: ${theme.backgroundColor2};
    margin-top: 5px;
  }

  #tray {
    padding: 0;
  }

  #custom-space-tray {
    padding: 0 5px;
  }

  /********************************
   * 5. MPRIS, RSS & notifications
   ********************************/

  #mpris {
    background-color: ${theme.backgroundColor};
    color: ${theme.tailwindcss.green."${colorShade}"};
    margin-top: 5px;
    padding: 5px 8px;
  }

  #mpris.firefox { color: ${theme.tailwindcss.orange."${colorShade}"}; }
  #mpris.paused,
  #mpris.stopped { color: ${theme.focusColor}; }

  #custom-rss {
    background-color: ${theme.backgroundColor};
    color: ${theme.tailwindcss.orange."${colorShade}"};
    border-radius: 0 8px 4px 0;
    margin-top: 5px;
    padding: 5px 12px 5px 8px;
  }

  #custom-notification {
    background-color: ${theme.backgroundColor};
    border-radius: 4px 0 0 8px;
    margin-top: 5px;
    padding: 5px 8px 5px 12px;
  }

  /********************************
   * 6. Batterie
   ********************************/

  #battery {
    background-color: ${theme.backgroundColor};
    color: ${theme.tailwindcss.green."${colorShade}"};
    border-radius: 0 8px 8px 0;
    margin: 5px 10px 0 0;
    padding: 5px 15px 5px 8px;
  }

  #battery.warning  { color: ${theme.tailwindcss.yellow."${colorShade}"}; }
  #battery.critical { color: ${theme.tailwindcss.red."${colorShade}"}; }

  /********************************
   * 7. Réseau
   ********************************/

  #network {
    background-color: ${theme.backgroundColor};
    color: ${theme.tailwindcss.yellow."${colorShade}"};
    border-radius: 8px 0 0 8px;
    margin: 5px 0 0 10px;
    padding: 5px 8px 5px 15px;
  }

  /********************************
   * 8. Workspaces
   ********************************/

  #workspaces {
    background-color: ${theme.backgroundColor};
    border-radius: 8px;
    margin-top: 5px;
  }

  #workspaces button {
    color: ${theme.focusColor};
    padding: 0 5px;
    border-radius: 8px;
    background: none;
    box-shadow: none;
    text-shadow: none;
    transition: none;
  }

  #workspaces button.visible,
  #workspaces button:hover {
    background-color: ${theme.backgroundColor2};
    color: ${theme.focusColor};
  }

  #workspaces button.focused {
    color: ${theme.backgroundColor};
    background-color: ${theme.focusColor};
  }

  #workspaces button.urgent {
    color: ${theme.backgroundColor};
    background-color: ${theme.tailwindcss.red."${colorShade}"};
  }

  /********************************
   * 9. Horloge
   ********************************/

  #clock {
    background-color: ${theme.backgroundColor};
    color: ${theme.focusColor};
    border-radius: 8px;
    margin-top: 5px;
    padding: 0 10px;
  }
''
