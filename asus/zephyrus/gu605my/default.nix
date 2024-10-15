{ ... }:

{
  imports = [
    ../../../common/cpu/intel
    ../../../common/gpu/nvidia/prime.nix
    ../../../common/gpu/nvidia/ampere
    ../../../common/pc/laptop
    ../../../common/pc/ssd
  ];

  hardware.nvidia.prime = {
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  boot.kernelPatches = [{
    # See https://discourse.nixos.org/t/fix-freeze-after-wake-from-sleep-suspend-with-intel-raptor-lake-and-alder-lake-p/51677
    # Thanks to j.book for figuring that one out

    name = "Fix freeze after sleep";
    path = ./kernel-patches/sleep.patch;
  }];
}
