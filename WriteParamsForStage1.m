function WriteParamsForStage1()
global params
warning off

delete('params');
fid = fopen('params', 'w');
fprintf(fid, '1  %f\r\n', params.user.num_cars);
fprintf(fid, '2  %g\r\n', params.user.nfe_stage1);
fprintf(fid, '3  %f\r\n', params.vehicle.vmax);
fprintf(fid, '4  %f\r\n', params.vehicle.amax);
fprintf(fid, '5  %f\r\n', params.user.v_std);
fclose(fid);
end