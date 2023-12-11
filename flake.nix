{
  description = "Example for testing coverage of C code";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
  { self
  , nixpkgs
  , flake-utils
  , ...
  }:
  flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
    let
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      devShells = {
        default = pkgs.mkShell {
          buildInputs = with pkgs; [
            just
            lcov
          ];
        };
        clang = pkgs.mkShell.override {
          stdenv = pkgs.clangStdenv;
        } {
          buildInputs = with pkgs; [
            just
            lcov
            llvm
          ];
        };
      };
    }
  );
}
