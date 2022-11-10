{theme}: ''
  * {
      border: none;
      font-family: "Ubuntu Nerd Font";
      font-size: 13px;
      min-height: 0;
      color: ${theme.textColor}
  }

  button {
      /* Use box-shadow instead of border so the text isn't offset */
      box-shadow: inset 0 -3px transparent;
      /* Avoid rounded borders under each button name */
      border: none;
      border-radius: 0;
  }

  window#waybar {
      background: ${theme.backgroundColor};
      color: ${theme.textColor};
  }

  #window {
      font-weight: bold;
      font-family: "Ubuntu";
  }

  #workspaces button {
      padding: 0 5px;
      background: transparent;
      color: white;
  }

  #workspaces button.focused {
      color: ${theme.textColor};
      background: ${theme.focusColor};
  }

  #mode {
      background: ${theme.backgroundColor2};
      border-bottom: 3px solid ${theme.textColor};
  }

  #battery,
  #cpu,
  #memory,
  #network,
  #pulseaudio,
  #tray,
  #mode,
  #taskbar {
      padding: 2 12px;
      margin: 2 0px;
  }

  #custom-spotify {
      margin: 0px;
      padding: 0px;
  }

  #custom-spotify-prev {
      padding-left: 3px;
      padding-right: 1px;
      margin: 0 1px;
  }

  #custom-spotify-next {
      padding-right: 3px;
      padding-left: 1px;
      margin: 0 1px;
  }

  #clock:hover,
  #battery:hover,
  #cpu:hover,
  #memory:hover,
  #network:hover,
  #pulseaudio:hover,
  #custom-spotify:hover,
  #custom-spotify-next:hover,
  #custom-spotify-prev:hover,
  #tray:hover,
  #mode:hover,
  #taskbar:hover {
      background: ${theme.backgroundColor};
  }
''
