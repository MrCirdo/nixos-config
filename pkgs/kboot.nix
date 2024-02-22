{
pgks,
  lib,
  stdenv,
  writeShellApplication,
  jq,
  kexec-tools,
}:
pkgs.writeShellApplication {
  name = "kboot";
  runtimeInputs = [jq kexec-tools];
  text = ''
    kexec --reuse-cmdline --initrd $(jq -r '."org.nixos.bootspec.v1"."initrd"' /nix/var/nix/profiles/system/boot.json) --load $(jq -r '."org.nixos.bootspec.v1"."kernel"' /nix/var/nix/profiles/system/boot.json)
    ls
  '';
}
