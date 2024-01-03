{
  description = "Sonata System";
  inputs = {
    lowrisc-nix.url = "github:lowRISC/lowrisc-nix";
    nixpkgs.follows = "lowrisc-nix/nixpkgs";
    flake-utils.follows = "lowrisc-nix/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
    lowrisc-nix,
  }: let
    system_outputs = system: let
      sonata_version = "0.0.1";

      pkgs = import nixpkgs {
        inherit system;
      };
      lr_pkgs = lowrisc-nix.outputs.packages.${system};

      sonata-simulator = pkgs.stdenv.mkDerivation {
        pname = "sonata-system-simulator";
        version = sonata_version;
        src = ./.;
        buildInputs = with pkgs; [libelf zlib];
        nativeBuildInputs = [pkgs.python311Packages.pip] ++ (with lr_pkgs; [python_ot verilator_ot]);
        buildPhase = ''
          HOME=$TMPDIR fusesoc --cores-root=. run \
            --target=sim --tool=verilator --setup \
            --build lowrisc:sonata:system
        '';
        installPhase = ''
          mkdir -p $out/bin/
          cp -r build/lowrisc_sonata_system_0/sim-verilator/Vsonata_system $out/bin/
        '';
      };
    in {
      formatter = pkgs.alejandra;
      devShells.default = pkgs.mkShell {
        name = "sonata-system-devshell";
        packages = [pkgs.gtkwave] ++ (with sonata-simulator; buildInputs ++ nativeBuildInputs);
      };
      packages = {inherit sonata-simulator;};
    };
  in
    flake-utils.lib.eachDefaultSystem system_outputs;
}
