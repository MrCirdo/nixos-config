let launchScript = ''
#!/bin/sh

# Session
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway

# Wayland stuff
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland
export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1

exec .sway-wrapped
'';
in
self: super: {
  sway = super.sway.overrideAttrs(oldAttrs: {
    installPhase = (oldAttrs.installPhase or "") + ''
    mv $out/bin/sway $out/bin/.sway-wrapped
    echo "${launchScript}" > $out/bin/sway
'';
  });
}
