function WriteParamsForStage2()
global params
warning off

delete('params');
fid = fopen('params', 'w');
fprintf(fid, '1  %f\r\n', params.vehicle.lw);
fprintf(fid, '2  %f\r\n', params.user.num_cars);
fprintf(fid, '3  %g\r\n', params.user.nfe_stage2);
fprintf(fid, '4  %f\r\n', params.vehicle.vmax);
fprintf(fid, '5  %f\r\n', params.vehicle.amax);
fprintf(fid, '6  %f\r\n', params.vehicle.phymax);
fprintf(fid, '7  %f\r\n', params.vehicle.wmax);
fprintf(fid, '8  %f\r\n', params.user.v_std);
fclose(fid);
end