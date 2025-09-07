# MultiCavLaneChange

This repository provides the complete implementation of multi-vehicle cooperative lane-change motion planning (MVMP). The code corresponds to the paper:

**Bai Li, Youmin Zhang, Yiheng Feng, Yue Zhang, Yuming Ge, and Zhijiang Shao,**  
“*Balancing Computation Speed and Quality: A Decentralized Motion Planning Method for Cooperative Lane Changes of Connected and Automated Vehicles*,”  
IEEE Transactions on Intelligent Vehicles, vol. 3, no. 3, pp. 340–350, 2018.  
doi: [10.1109/TIV.2018.2843159](https://doi.org/10.1109/TIV.2018.2843159)

---

## Overview

The algorithm follows a two-stage framework:
- **Stage 2**: Generate simultaneous cooperative lane-change trajectories using nonlinear programming.  
- **Stage 1**: Apply longitudinal reconfiguration to adjust inter-vehicle spacing while ensuring safety.  
- **Delay list generation**: A collision-avoidance adjustment based on vehicle priority.  
- **Visualization**: MATLAB function `dsa(coop_traj)` produces the video file `SIM.mp4`.

Front-end: MATLAB.  
Back-end: AMPL + IPOPT.  
To reduce exposure, `.mod` and `.run` files are generated at runtime and deleted after use.

---

## Usage

1. Install MATLAB (R2016b or later recommended) and AMPL with the IPOPT solver.  
2. Ensure `ampl` can be called from the command line.  
3. In MATLAB, run:
   ```matlab
   runme
4. After solving Stage 1 and Stage 2, a visualization video will be saved as SIM.mp4.
Vehicle geometry and constraints can be modified in InitParams.m.
Color mapping can be customized in ProvideRGBInfo.m.

## Citation

If you use this code in your research, please cite:
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

## License

© 2018–2025 Bai Li.
This code is provided for research and educational use only. Users must cite the above paper when producing new contributions based on this repository.
AMPL, IPOPT, and other third-party software remain under their respective licenses. The repository is distributed “as-is” without warranties of any kind. For commercial licensing or collaboration, please contact the maintainer.
