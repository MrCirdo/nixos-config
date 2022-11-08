{theme}: ''
  * {
      border: none;
      font-family: "Ubuntu Nerd Font";
      font-size: 13px;
      min-height: 0;
      color: white;
  }

  button {
      /* Use box-shadow instead of border so the text isn't offset */
      box-shadow: inset 0 -3px transparent;
      /* Avoid rounded borders under each button name */
      border: none;
      border-radius: 0;
  }

  window#waybar {
      background: #1C1917;
      color: white;
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
      color: white;
      background: ${theme.focusColor};
  }

  #mode {
      background: #64727D;
      border-bottom: 3px solid white;
  }

  #clock,
  #battery,
  #cpu,
  #memory,
  #network,
  #pulseaudio,
  #tray,
  #mode,
  #taskbar {
      padding: 0 3px;
      margin: 0 2px;
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
      background: rgba(0, 0, 0, 0.4);
  }

  @keyframes blink {
      to {
          background-color: #ffffff;
          color: black;
      }
  }

  #battery.warning:not(.charging) {
      color: white;
      animation-name: blink;
      animation-duration: 0.5s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
  }

  #network.disconnected {
      background: #f53c3c;
  }

  #custom-spotify {
      color: rgb(102, 220, 105);
  }

''
