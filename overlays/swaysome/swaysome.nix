self: super: {
  swaysome = super.swaysome.overrideAttrs (oldAttrs: {
    patches = oldAttrs.patches or [] ++ [./swaysome-reverse-output.patch];
  });
}
