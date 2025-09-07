function coop_traj = GenerateInitialGuessForStage1()
global params

tf_est = 8;
coop_traj = [];
for ii = 1 : params.user.num_cars
    x0 = params.task.x_init;
    y0 = params.task.y_init;
    yg = params.task.y_goal;
    dx = params.user.v_std * tf_est;

    elem.x = linspace(x0, x0 + dx, params.user.nfe_stage1);
    elem.y = linspace(y0, y0, params.user.nfe_stage1);
    elem.theta = zeros(1, params.user.nfe_stage1);
    elem.v = ones(1, params.user.nfe_stage1) .* params.user.v_std;
    elem.a = zeros(1, params.user.nfe_stage1);
    elem.phy = zeros(1, params.user.nfe_stage1);
    elem.w = zeros(1, params.user.nfe_stage1);
    elem.tf = tf_est;
    coop_traj = [coop_traj, elem];
end
end