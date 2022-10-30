# Special overlay to activate spotify with wayland.
self: super: {
  spotify-unwrapped = super.spotify-unwrapped.overrideAttrs (oldAttrs: {
    buildInputs = (oldAttrs.buildInputs or [ ]) ++ [ self.makeWrapper ];
    postFixup = (oldAttrs.postFixup or "") + ''
      wrapProgram $out/bin/spotify \
      --add-flags "--enable-features=UseOzonePlatform \
      --ozone-platform=wayland"
    '';
  });
}

