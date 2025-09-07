function V = CreateVehiclePolygon(x, y, theta)
% 以后轴中点为参考坐标，返回车辆四边形顶点序列 A->B->C->D->A
global params
Lf = params.vehicle.lf;   % 前悬
Lw = params.vehicle.lw;   % 轴距
Lr = params.vehicle.lr;   % 后悬
W  = params.vehicle.lb;   % 车宽

hW = 0.5 * W;
c = cos(theta);
s = sin(theta);

AX = x + (Lw + Lf) * c - hW * s;
BX = x + (Lw + Lf) * c + hW * s;
CX = x - Lr * c            + hW * s;
DX = x - Lr * c            - hW * s;

AY = y + (Lw + Lf) * s + hW * c;
BY = y + (Lw + Lf) * s - hW * c;
CY = y - Lr * s        - hW * c;
DY = y - Lr * s        + hW * c;

V.x = [AX, BX, CX, DX, AX];
V.y = [AY, BY, CY, DY, AY];
end