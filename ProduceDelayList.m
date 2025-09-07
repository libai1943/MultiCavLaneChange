function coop_traj22 = ProduceDelayList(coop_traj)
global params
init_position = [];
for ii = 1 : params.user.num_cars
    init_position = [init_position, coop_traj(ii).x(1)];
end
[~, list] = sort(init_position, 'descend');

coop_traj2 = [];
coop_traj2 = [coop_traj2, coop_traj(list(1))];
id_list = [list(1)];
for ii = 2 : params.user.num_cars
    id = list(ii);
    while (~IsCurTrajValidWithFixedPart(coop_traj(id), coop_traj2))
        y_init = coop_traj(id).y(1);
        for jj = ii : params.user.num_cars
            id2 = list(jj);
            y_init2 = coop_traj(id2).y(1);
            if (y_init2 == y_init)
                coop_traj(id2).x = coop_traj(id2).x - params.planner.ds;
            end
        end
    end
    coop_traj2 = [coop_traj2, coop_traj(id)];
    id_list = [id_list, id];
end

coop_traj22 = coop_traj2;
for ii = 1 : params.user.num_cars
    id = id_list(ii);
    coop_traj22(id) = coop_traj2(ii);
end
end