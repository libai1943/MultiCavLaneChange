% ==============================================================================
% MATLAB Source Codes for "Balancing Computation Speed and Quality: A Decentralized
% Motion Planning Method for Cooperative Lane Changes of Connected and Automated Vehicles".
% ==============================================================================
%
%   Copyright (C) 2018 Bai Li
%   Users should cite the following article when utilizing these source codes to produce new contributions.
%   Bai Li, Youmin Zhang, Yiheng Feng, Yue Zhang, Yuming Ge, and Zhijiang Shao,
%   "Balancing Computation Speed and Quality: A Decentralized Motion Planning Method for
%   Cooperative Lane Changes of Connected and Automated Vehicles," IEEE Transactions on
%   Intelligent Vehicles, vol. 3, no. 3, pp. 340–350, 2018. doi:10.1109/TIV.2018.2843159.
%
% ==============================================================================
%
%   If there are inquiries, feel free to contact libai@zju.edu.cn or
%   libaioutstanding@163.com
%
%   2025-09-07
% ==============================================================================

close all; clear all; clc;

InitParams();
GenerateTask();

ig2 = GenerateInitialGuessForStage2();
WriteInitialGuessForStage2(ig2);
WriteParamsForStage2();
SolveNlpAtStage2();
coop_traj = LoadOptimumForStage2();
tf2 = coop_traj(1).tf;

coop_traj2 = ProduceDelayList(coop_traj);
WriteRelativeFormationInfoForStage1(coop_traj2);

ig1 = GenerateInitialGuessForStage1();
WriteInitialGuessForStage1(ig1);
WriteParamsForStage1();
SolveNlpAtStage1();
coop_traj0 = LoadOptimumForStage1();
tf1 = coop_traj0(1).tf;

coop_traj_final = StitchTwoStages(coop_traj0, coop_traj2);
dsa(coop_traj_final);
gross_time = tf2 + tf1;