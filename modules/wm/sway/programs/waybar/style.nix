{theme}: ''
  * {
    /* `otf-font-awesome` is required to be installed for icons */
    font-family: "Ubuntu Nerd Font", Material Design Icons, JetBrainsMono Nerd Font, Iosevka Nerd Font;
    font-size: 14px;
    font-weight: 500;
  	min-height: 0;
  	min-width: 0;
  }

  window#waybar {
  	color: white;
  	background-color: rgba(0, 0, 0, 0.0);
  }

  #cpu,
  #disk,
  #memory,
  #temperature,
  #pulseaudio,
  #network,
  #battery {
  	margin-top: 5px;
  	margin-bottom: 0px;
  	margin-right: 0px;
  	margin-left: 0px;
  	padding-left: 8px;
  	padding-right: 8px;
  	padding-top: 5px;
  	padding-bottom: 5px;
  	background-color: ${theme.backgroundColor};
  }

  #custom-rss {
  	margin-top: 5px;
  	margin-bottom: 0px;
  	margin-right: 0px;
  	margin-left: 0px;
  	padding-left: 8px;
  	padding-right: 10px;
  	padding-top: 5px;
  	padding-bottom: 5px;

  	background-color: ${theme.backgroundColor};
  	color: ${theme.tailwindcss.orange."500"};
  	border-radius: 0px 10px 10px 0px;
  }

  #mpris {
  	margin-top: 5px;
  	margin-bottom: 0px;
  	margin-right: 0px;
  	margin-left: 0px;
  	padding-left: 10px;
  	padding-right: 8px;
  	padding-top: 6px;
  	padding-bottom: 6px;
  	background-color: ${theme.backgroundColor};
  	border-radius: 10px 0px 0px 10px;
    color: ${theme.tailwindcss.green."500"};
  }

  #custom-hibernation {
  	border-radius: 10px 0px 0px 10px;
  	margin-top: 5px;
  	margin-bottom: 0px;
  	margin-right: 0px;
  	margin-left: 0px;
  	padding-left: 8px;
  	padding-right: 13px;
  	padding-top: 5px;
  	padding-bottom: 5px;
    color: ${theme.tailwindcss.purple."500"};
  }

  #custom-sleep {
  	margin-top: 5px;
  	margin-bottom: 0px;
  	margin-right: 0px;
  	margin-left: 0px;
  	padding-left: 8px;
  	padding-right: 13px;
  	padding-top: 5px;
  	padding-bottom: 5px;
    color: ${theme.tailwindcss.yellow."500"};
  }

  #custom-reboot {
  	margin-top: 5px;
  	margin-bottom: 0px;
  	margin-right: 0px;
  	margin-left: 0px;
  	padding-left: 8px;
  	padding-right: 13px;
  	padding-top: 5px;
  	padding-bottom: 5px;
    color: ${theme.tailwindcss.lime."500"};

  }

  #custom-lock {
  	margin-top: 5px;
  	margin-bottom: 0px;
  	margin-right: 0px;
  	margin-left: 0px;
  	padding-left: 8px;
  	padding-right: 8px;
  	padding-top: 5px;
  	padding-bottom: 5px;
    color: ${theme.tailwindcss.sky."500"};
  }

  #custom-poweroff {
  	border-radius: 10px 0px 0px 10px;
    background-color: ${theme.backgroundColor};
    color: ${theme.tailwindcss.red."500"};
  	margin-top: 5px;
  	margin-bottom: 0px;
  	margin-right: 0px;
  	margin-left: -5px;
  	padding-left: 8px;
  	padding-right: 8px;
  	padding-top: 5px;
  	padding-bottom: 5px;
  }

  #custom-reboot,
  #custom-sleep,
  #custom-hibernation,
  #custom-lock {
    background-color: ${theme.backgroundColor2};
  }


  #pulseaudio {
  	color: ${theme.tailwindcss.pink."500"};
  }

  #battery {
  	color: ${theme.tailwindcss.green."500"};
  	border-radius: 0px 10px 10px 0px;
  	margin-right: 10px;
  	padding-right: 15px;
  }

  #battery.warning {
  	color: ${theme.tailwindcss.yellow."500"};
  	border-radius: 0px 10px 10px 0px;
  	margin-right: 10px;
  	padding-right: 15px;
  }

  #battery.critical {
  	color: ${theme.tailwindcss.red."500"};
  	border-radius: 0px 10px 10px 0px;
  	margin-right: 10px;
  	padding-right: 15px;
  }

  #temperature {
  		color: ${theme.tailwindcss.red."500"};
  }

  #cpu {
  		color: ${theme.tailwindcss.lime."500"};
  }

  #disk {
  	color: ${theme.tailwindcss.blue."500"};
  }

  #memory {
  	color: ${theme.tailwindcss.violet."500"};
  }

  #network {
    color: ${theme.tailwindcss.yellow."500"};
  	border-radius: 10px 0px 0px 10px;
  	margin-left: 10px;
  	padding-left: 15px;
  }

  #mpris.firefox {
    color: ${theme.tailwindcss.orange."500"};
  }

  #mpris.paused,
  #mpris.stopped {
    color: ${theme.focusColor};
  }

  #custom-nixos {
    margin-left: 5px;
    margin-right: 5px;
    margin-top: 4px;
    margin-bottom: 4px;
    padding-left: 8px;
    padding-right: 5px;
    border-radius: 10px;
    background-color: ${theme.backgroundColor};
    color: ${theme.focusColor};
  }

  #workspaces {
    background-color: ${theme.backgroundColor};
    border-radius: 10px;
    margin-top: 4px;
    margin-bottom: 4px;
  }


  #workspaces button {
    color: ${theme.focusColor};
    padding-left: 6px;
    padding-right: 6px;
    border:none;

    box-shadow: none; /* Remove predefined box-shadow */
    text-shadow: none; /* Remove predefined text-shadow */
    background: none; /* Remove predefined background color (white) */
    transition: none; /* Disable predefined animations */
  }

  #workspaces button.visible {
    background-color: ${theme.backgroundColor2};
    color: ${theme.focusColor};
  }

  #workspaces button.focused {
    color: ${theme.backgroundColor};
    background-color: ${theme.focusColor};
  }

  #workspaces button.urgent {
    color: ${theme.backgroundColor};
    background-color: ${theme.alertColor};
  }

  #workspaces button:hover {
    background-color: ${theme.backgroundColor2};
    color: ${theme.focusColor};
  }

  #clock {
    background-color: ${theme.backgroundColor};
    color: ${theme.focusColor};
    border-radius: 10px;
    margin-top: 5px;
    margin-bottom: 0px;
    padding-left: 10px;
    padding-right: 10px;
  }

''
