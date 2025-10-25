{
  pkgs,
  ...
}:
  with pkgs;
    mkShell {
      inputsFrom = [
        llvmPackages.llvm
      ];
      buildInputs = [
        llvmPackages.clang
        llvmPackages.compiler-rt
      ];
    }
