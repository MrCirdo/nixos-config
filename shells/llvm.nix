{pkgs, ...}:
with pkgs;
  mkShell {
    packages = [
      libllvm
      sccache
    ];
    inputsFrom = [
      llvmPackages.llvm
    ];
    buildInputs = [
      llvmPackages.clang
      llvmPackages.compiler-rt
    ];
    shellHook = ''
      export CXX=clang++
      export CC=clang
      export SCCACHE_SERVER_UDS=/var/run/sccache/sccache.sock
      export SCCACHE_CACHE_SIZE=500000000000
    '';
  }
