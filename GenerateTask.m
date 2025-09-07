function GenerateTask()
global params
gap_max = params.user.max_gap_between_adjacent_cavs_at_beginning;
cur_x_in_each_lane = randn(1, params.user.num_lanes);

params.task = [];
delete('task');
fid = fopen('task', 'w');
for ii = 1 : params.user.num_cars
    starting_lane_id = ceil(rand * params.user.num_lanes);
    ending_lane_id = ceil(rand * params.user.num_lanes);
    x_init = cur_x_in_each_lane(starting_lane_id) - (params.vehicle.lf + params.vehicle.lw + params.vehicle.lr) - rand * gap_max;
    cur_x_in_each_lane(starting_lane_id) = x_init;
    y_init = starting_lane_id * 3.75;
    y_goal = ending_lane_id * 3.75;

    fprintf(fid,'%g 1 %f \r\n', ii, x_init);
    fprintf(fid,'%g 2 %f \r\n', ii, y_init);
    fprintf(fid,'%g 3 %f \r\n', ii, y_goal);
    elem.x_init = x_init;
    elem.y_init = y_init;
    elem.y_goal = y_goal;
    params.task = [params.task, elem];
end
fclose(fid);
end