function coop_traj = GenerateInitialGuessForStage2()
global params

tf_est = 8;
coop_traj = [];
for ii = 1 : params.user.num_cars
    x0 = params.task.x_init;
    y0 = params.task.y_init;
    yg = params.task.y_goal;
    dx = params.user.v_std * tf_est;

    elem.x = linspace(x0, x0 + dx, params.user.nfe_stage2);
    elem.y = linspace(y0, yg, params.user.nfe_stage2);
    elem.theta = zeros(1, params.user.nfe_stage2);
    elem.v = ones(1, params.user.nfe_stage2) .* params.user.v_std;
    elem.a = zeros(1, params.user.nfe_stage2);
    elem.phy = zeros(1, params.user.nfe_stage2);
    elem.w = zeros(1, params.user.nfe_stage2);
    elem.tf = tf_est;
    coop_traj = [coop_traj, elem];
end
end