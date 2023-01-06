{theme}: ''
    * {
        border: none;
        font-family: "Ubuntu Nerd Font";
        font-size: 13px;
        min-height: 0;
        color: ${theme.textColor};
    }

    button {
        box-shadow: inset 0 -3px transparent;
        border-radius: 10px;
        padding: 0 5px;
        background: ${theme.backgroundColor};
        border: 2px solid ${theme.backgroundColor2};
    }

    window#waybar {
        background: transparent; /* rgba(43, 48, 59, 0.5); */
        color: ${theme.textColor};
        /* border-bottom: 3px solid ${theme.backgroundColor}; */
    }

    #window {
        font-weight: bold;
        font-family: "Ubuntu";
    }

    #workspaces {
        margin: 5px;
  }

    #workspaces button {
        background: ${theme.backgroundColor};
        color: ${theme.textColor};
        margin: 2px;
    }

    #workspaces button.focused {
        color: ${theme.textColor};
        background: ${theme.focusColor};
        border: 2px solid ${theme.focusColor2};
    }

    #mode {
        background: ${theme.backgroundColor2};
        border-bottom: 3px solid ${theme.textColor};
    }

  .modules-right {
        margin: 5px 5px;
        background: ${theme.backgroundColor};
        border: 2px solid ${theme.backgroundColor2};
        border-radius: 10px;
  }

  #cpu,
  #disk,
  #memory,
  #pulseaudio,
  #temperature,
  #clock,
  #battery {
      margin: 2px 8px;
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
