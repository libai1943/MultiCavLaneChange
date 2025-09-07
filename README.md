# MultiCavLaneChange

Multi-vehicle cooperative lane-change motion planning (MVMP) implemented in MATLAB with AMPL+IPOPT back-end. This code corresponds to the peer-reviewed article:

**Bai Li, Youmin Zhang, Yiheng Feng, Yue Zhang, Yuming Ge, and Zhijiang Shao**,  
“*Balancing Computation Speed and Quality: A Decentralized Motion Planning Method for Cooperative Lane Changes of Connected and Automated Vehicles*,”  
**IEEE Transactions on Intelligent Vehicles**, 3(3):340–350, 2018.  
DOI: https://doi.org/10.1109/TIV.2018.2843159

---

## Overview

This repository reproduces a two-stage MVMP pipeline:

- **Stage 2**: Computes simultaneous cooperative lane-change trajectories via a bicycle-model NLP.  
- **Delay list**: Applies conservative horizontal translations to remove residual inter-vehicle conflicts.  
- **Stage 1**: Performs longitudinal formation reconfiguration to obtain sparse, safe spacing while preserving the cooperative outcome.

The MATLAB front-end orchestrates data generation, writes AMPL initial values and parameters, calls AMPL+IPOPT to solve both stages, and renders a compact video of the resulting multi-vehicle motion.

To reduce exposure of modeling code, the AMPL `.mod` and `.run` files for both stages are generated with obfuscated filenames at runtime and deleted immediately after each solve. The solver outputs (`x.txt`, `y.txt`, `theta.txt`, `v.txt`, `a.txt`, `phy.txt`, `w.txt`, `terminal_moment.txt`) are consumed by MATLAB to assemble the final trajectories.

---

## Requirements

- MATLAB with VideoWriter support  
- AMPL available on the system `PATH`  
- IPOPT (or a compatible AMPL nonlinear solver)

Windows users can run the repository as-is. If using Linux or macOS, replace the Windows `del` commands inside the generated `.run` templates with `rm -f`.

---

## Quick start

Clone the repository, open MATLAB in the repository root, and run:

    runme

The script initializes parameters, generates a random multi-lane task, builds a Stage 2 initial guess, solves Stage 2 and Stage 1 via AMPL+IPOPT, and finally produces a video named `SIM.mp4`.

Vehicle geometry and bounds can be edited in `InitParams.m`.  
The color palette is defined in `ProvideRGBInfo.m`.  
The video renderer is `dsa(coop_traj)` and uses `CreateVehiclePolygon.m` to draw rectangles from the rear-axle reference.

---

## Files of interest

- `runme.m`: entry point coordinating both stages  
- `SolveNlpAtStage2.m` and `SolveNlpAtStage1.m`: generate temporary AMPL model/run files, execute AMPL, and clean up  
- `ProduceDelayList.m`: fixed-part validation loop and spacing translation  
- `dsa.m`, `ProvideRGBInfo.m`, `CreateVehiclePolygon.m`: visualization functions  
- Auxiliary scripts: writers/readers for AMPL initial values and parameter files

---

## Citation

If you use this repository in your research or derivative works, please cite:

    @article{Li2018MVMP,
      author  = {Bai Li and Youmin Zhang and Yiheng Feng and Yue Zhang and Yuming Ge and Zhijiang Shao},
      title   = {Balancing Computation Speed and Quality: A Decentralized Motion Planning Method for Cooperative Lane Changes of Connected and Automated Vehicles},
      journal = {IEEE Transactions on Intelligent Vehicles},
      volume  = {3},
      number  = {3},
      pages   = {340--350},
      year    = {2018},
      doi     = {10.1109/TIV.2018.2843159}
    }

---

## License and usage

© 2018–2025 Bai Li and collaborators. The code is provided for research and educational use. Users must cite the above article in publications or software derived from this repository. AMPL, IPOPT, and any other third-party components remain under their respective licenses. The software is provided “as is,” without warranties of any kind. For commercial licensing or collaboration, please contact the maintainer.

---
