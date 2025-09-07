function InitParams()
global params

params.vehicle.lf = 0.96;
params.vehicle.lw = 2.8;
params.vehicle.lr = 0.929;
params.vehicle.lb = 1.942;
params.vehicle.vmax = 12;
params.vehicle.amax = 0.5;
params.vehicle.phymax = 0.6;
params.vehicle.wmax = 0.25;

params.planner.ds = 0.5;

params.user.num_cars = 10;
params.user.num_lanes = 3;
params.user.max_gap_between_adjacent_cavs_at_beginning = 5.0;
params.user.nfe_stage2 = 100;
params.user.nfe_stage1 = 300;
params.user.v_std = 10;
params.user.simulation_unit_time_step = 0.02;
end