{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
in rec {
  default = inputs.std.std.lib.mkShell {
    imports = [
      cell.devshellProfiles.default
      inputs.cells.data.devshellProfiles.zed
    ];
    env = [];
  };
  spicy = inputs.cells-lab.main.library.mergeDevShell {
    mkShell = nixpkgs.mkShell {
      nativeBuildInputs = with nixpkgs; [llvmPackages.clang];
    };
    inherit default;
  };
}
