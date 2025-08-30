{
  description = "A simple flake for nodejs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }@inputs:
    flake-utils.lib.eachSystem [ "x86_64-darwin" "aarch64-darwin" "x86_64-linux" "aarch64-linux" ] (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        devPackages = with nixpkgs; [
          pkgs.nodejs_24
          pkgs.pnpm
        ];

        postShellHook = '''';
      in
      {

        devShells = {
          default = pkgs.mkShell {
            name = "nodejs-sample";
            packages = devPackages;
            postShellHook = postShellHook;
          };
        };
      }
    );
}
