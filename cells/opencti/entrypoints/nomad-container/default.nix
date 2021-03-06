{
  inputs,
  cell,
}: let
  inherit (cell) nomadJobs;
  inherit (inputs.cells-lab._writers.library) writeConfigurationFromLang;

  name = "opencti-nomad-nixos";

  common = branch:
    writeConfigurationFromLang {
      inherit name;
      target = "nomad";
      source = nomadJobs.nixos-node {
        flake = "/home/gtrun/ghq/github.com/GTrunSec/lambda-microvm-hunting-lab#nixosConfigurations.nomad-tenzir-opencti";
      };
      format = "json";
    };
in {
  dev = common "dev";
  hydration.dev = common "dev" // {};
}
