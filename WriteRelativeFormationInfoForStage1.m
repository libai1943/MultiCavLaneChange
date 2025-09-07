function WriteRelativeFormationInfoForStage1(coop_traj2)
global params

delete('formation');
fid = fopen('formation', 'w');
x1 = coop_traj2(1).x(1);
for ii = 2 : params.user.num_cars
    xi = coop_traj2(ii).x(1);
    dx = xi - x1;
    fprintf(fid, '%g %f\r\n', ii-1, dx);
end
fclose(fid);
end