clear
clc
tic
warning off

%% 1.������·����
% fbus tbus    r      x     b   L ������·��� ��·����
Line_system = [; ...
    2, 3, 0.4930, 0.2511, 0, 1, 2, 6; ...
    3, 4, 0.3660, 0.1864, 0, 1, 3, 6; ...
    4, 5, 0.3811, 0.1941, 0, 1, 4, 6; ...
    5, 6, 0.8190, 0.7070, 0, 1, 5, 6; ...
    6, 7, 0.1872, 0.6188, 0, 1, 6, 4.5; ...
    7, 8, 0.7114, 0.2351, 0, 1, 7, 4.5; ...
    8, 9, 1.0300, 0.7400, 0, 1, 8, 4.5; ...
    9, 10, 1.0440, 0.7400, 0, 1, 9, 4.5; ...
    10, 11, 0.1966, 0.0650, 0, 1, 10, 4.5; ...
    11, 12, 0.3744, 0.1238, 0, 1, 11, 4.5; ...
    12, 13, 1.4680, 1.1550, 0, 1, 12, 4.5; ...
    13, 14, 0.5416, 0.7129, 0, 1, 13, 4.5; ...
    14, 15, 0.5910, 0.5260, 0, 1, 14, 4.5; ...
    15, 16, 0.7463, 0.5450, 0, 1, 15, 4.5; ...
    16, 17, 1.2890, 1.7210, 0, 1, 16, 4.5; ...
    17, 18, 0.7320, 0.5740, 0, 1, 17, 4.5; ...
    2, 19, 0.1640, 0.1565, 0, 1, 18, 4.5; ...
    19, 20, 1.5042, 1.3554, 0, 1, 19, 4.5; ...
    20, 21, 0.4095, 0.4784, 0, 1, 20, 4.5; ...
    21, 22, 0.7089, 0.9373, 0, 1, 21, 4.5; ...
    3, 23, 0.4512, 0.3083, 0, 1, 22, 4.5; ...
    23, 24, 0.8980, 0.7091, 0, 1, 23, 4.5; ...
    24, 25, 0.8960, 0.7011, 0, 1, 24, 4.5; ...
    6, 26, 0.2030, 0.1034, 0, 1, 25, 4.5; ...
    26, 27, 0.2842, 0.1447, 0, 1, 26, 4.5; ...
    27, 28, 1.0590, 0.9337, 0, 1, 27, 4.5; ...
    28, 29, 0.8042, 0.7006, 0, 1, 28, 4.5; ...
    29, 30, 0.5075, 0.2585, 0, 1, 29, 4.5; ...
    30, 31, 0.9744, 0.9630, 0, 1, 30, 4.5; ...
    31, 32, 0.3105, 0.3619, 0, 1, 31, 4.5; ...
    32, 33, 0.3410, 0.5302, 0, 1, 32, 4.5; ...
    1, 2, 0.0922, 0.0470, 0, 1, 1, 6; ...
];

%�ڵ㸺��ֵ/kW
power_system = [; ...
    2, 1, 100, 60, 3; ...
    3, 1, 90, 40, 3; ...
    4, 1, 120, 80, 3; ...
    5, 1, 60, 30, 3; ...
    6, 1, 60, 20, 3; ...
    7, 1, 200, 100, 3; ...
    8, 1, 200, 100, 3; ...
    9, 1, 60, 20, 3; ...
    10, 1, 60, 20, 3; ...
    11, 1, 45, 30, 3; ...
    12, 1, 60, 35, 3; ...
    13, 1, 60, 35, 2; ...
    14, 1, 120, 80, 2; ...
    15, 1, 60, 10, 2; ...
    16, 1, 60, 20, 2; ...
    17, 1, 60, 20, 2; ...
    18, 1, 90, 40, 2; ...
    19, 1, 90, 40, 2; ...
    20, 1, 90, 40, 2; ...
    21, 1, 90, 40, 2; ...
    22, 1, 90, 40, 2; ...
    23, 1, 90, 50, 2; ...
    24, 1, 420, 200, 1; ...
    25, 1, 420, 200, 1; ...
    26, 1, 60, 25, 1; ...
    27, 1, 60, 25, 1; ...
    28, 1, 60, 20, 1; ...
    29, 1, 120, 70, 1; ...
    30, 1, 200, 600, 1; ...
    31, 1, 150, 70, 1; ...
    32, 1, 210, 100, 1; ...
    33, 1, 60, 40, 1; ...
    1, 3, 0, 0, 3; ...
];

%% 2.���븺�ɼ���Դ����
% �硢����������ɵ�ʱ������
WT11 = [2673.55248985227, 2216.20614460840, 892.491973552576, 869.389383834342, 644.604677499358, 0, 1078.09170033530, 236.852243124869, 0, 0, 0, 0, 769.826094958970, 2030, 2030, 2030, 2030, 1865.83649461462, 1803.48080962833, 2030, 2030, 2030, 885.887064575026, 762.833149344300];
WT_max = max(WT11);
WT_time12 = WT11 / WT_max;
PV11 = [0, 0, 0, 0, 0, 0, 0, 0, 16.8777927000000, 31.4912790000000, 61.1677962000000, 269.016288300000, 355.840023600000, 359.809208100000, 324.671224500000, 242.919469800000, 125.523265500000, 8.66288430000000, 0, 0, 0, 0, 0, 0];
PV_max = max(PV11);
PV_time12 = PV11 / PV_max;

% ��������pu��
LOAD_time11 = [0.08, 0.2, 0.23, 0.34, 0.32, 0.2, 0.18, 0.24, 0.23, 0.23, 0.22, 0.2, 0.19, 0.19, 0.35, 0.82, 1, 0.91, 0.88, 0.72, 0.32, 0.19, 0.16, 0.17; ... %��������1
    0, 0, 0, 0, 0.3, 0.81, 0.98, 0.88, 0.77, 0.73, 0.73, 0.825, 0.825, 0.97, 0.97, 1, 0.81, 0.73, 0.73, 0.7, 0.26, 0, 0, 0; ... %������ҵ2
    0.85, 0.85, 0.85, 0.91, 0.91, 0.92, 0.95, 1, 1, 0.91, 0.83, 0.83, 0.96, 0.91, 0.91, 0.92, 0.92, 0.935, 0.935, 0.93, 0.93, 0.84, 0.84, 0.84; ... %��ҵ3
];

%���ǵ�����
for i = 1:24
    LOAD_time12(i) = sum(LOAD_time11(:, i)) / 3;
end

%EV���г��վ������������
EV_FC = [0.0598740025498963, 0.0469892741536211, 0.835590480095827, 0.984863853338497, 1, 0.998835328062984, 0.822812264776470, 0.539188942499377, 0.740044295390544, 0.368046875789167, 0.353430677733604, 0.354176553166055, 0.358361157698707, 0.584487733368315, 0.847754909930659, 0.979278099748080, 0.998438846949231, 0.997464225556574, 0.976783470131740, 0.821702437203797, 0.767925421963904, 0.693865406634946, 0.0911240136910863, 0.0447730983606308];
EV_FC12 = EV_FC * 4 * 175 / 1000;
%�滮����綯��������Ϊ500����
P_SC = 7; %kW
N_EV = 500;
EV_SC11 = [637, 670, 283, 174, 16, 9, 14, 32, 70, 145, 276, 482, 773, 1140, 1546, 1927, 2207, 2322, 2244, 1993, 1627, 1515, 1553, 1042];
EV_SC12 = N_EV * P_SC * EV_SC11 / 10000 / 1000;

%% 3.����ģ��
P_LOAD = LOAD_time12;
Q_LOAD = P_LOAD; %�޹���ͬ�ĸ�������
P_LOAD_ = power_system(:, 3) / 1000; %ת��ΪMW
Q_LOAD_ = power_system(:, 4) / 1000;
P_LOAD = P_LOAD_ * P_LOAD; %�õ�33*24�ĸ���ֵ��ÿһ��ʱ���ÿ���ڵ�ĸ���
Q_LOAD = Q_LOAD_ * Q_LOAD;
BRA = [33, 1; 1, 2; 2, 3; 3, 4; 4, 5; 5, 6; 6, 7; 7, 8; 8, 9; 9, 10; 10, 11; 11, 12; 12, 13; 13, 14; 14, 15; 15, 16; 16, 17; 1, 18; 18, 19; 19, 20; 20, 21; 2, 22; 22, 23; 23, 24; 5, 25; 25, 26; 26, 27; 27, 28; 28, 29; 29, 30; 30, 31; 31, 32]; %֧·���
R = Line_system(:, 3);
X = Line_system(:, 4);
input = zeros(33, 32); %����ڵ�֧·
output = zeros(33, 32); %�����ڵ�֧·

for i = 1:32
    input(i, i) = 1;
end

for i = [1:16, 18:20, 22:23, 25:31]
    output(i, i+1) = 1;
end

output(1, 18) = 1;
output(2, 22) = 1;
output(5, 25) = 1;
output(33, 1) = 1;

Vmax = [1.05 * 1.05 * 12.66^2 * ones(32, 24); 12.66^2 * ones(1, 24)];
Vmin = [0.9 * 0.9 * 12.66^2 * ones(32, 24); 12.66^2 * ones(1, 24)];

Pgmax = [zeros(32, 24); ...
    10 * ones(1, 24)];
Pgmin = [zeros(32, 24); ...
    0 * ones(1, 24)];
Qgmax = [zeros(32, 24); ...
    10 * ones(1, 24)];
Qgmin = [zeros(32, 24); ...
    0 * ones(1, 24)];

%��ʱ���
pri = [0.334400000000000, 0.334400000000000, 0.334400000000000, 0.334400000000000, 0.334400000000000, 0.334400000000000, 0.334400000000000, 0.563600000000000, 0.640000000000000, 0.640000000000000, 0.640000000000000, 0.640000000000000, 0.640000000000000, 0.640000000000000, 0.937975000000000, 1.03730000000000, 1.03730000000000, 1.03730000000000, 1.03730000000000, 1.03730000000000, 1.03730000000000, 1.03730000000000, 0.640000000000000, 0.334400000000000];

%% 4.�����
C1 = sdpvar(1, 1);
C2 = sdpvar(1, 1);
C3 = sdpvar(1, 1);
C4 = sdpvar(1, 1);
C5 = sdpvar(1, 1);
C6 = sdpvar(1, 1);
C7 = sdpvar(1, 1);
V = sdpvar(33, 24); %��ѹ��ƽ��
I = sdpvar(32, 24); %������ƽ��
P = sdpvar(32, 24); %��·�й�
Q = sdpvar(32, 24); %��·�޹�
Pg = sdpvar(33, 24); %�׶˽ڵ��ѹ���й�
Qg = sdpvar(33, 24); %�׶˽ڵ��ѹ���޹�
p_wt = sdpvar(3, 24); %����й�
S_wt = sdpvar(3, 1); %���װ��
p_pv = sdpvar(3, 24); %����й�
S_pv = sdpvar(3, 1); %���װ��
p_mt = sdpvar(1, 24); %MT�й�
p_ess_c = sdpvar(1, 24); %ESS����й�
p_ess_d = sdpvar(1, 24); %ESS�ŵ��й�
a_ess_c = binvar(1, 24); %ESS���״̬
a_ess_d = binvar(1, 24); %ESS�ŵ�״̬
W_ess = sdpvar(1, 25); %ESS����

%% 5.��Լ��
C = [];
% ���+���Լ��
C = [C, 0 <= p_wt <= S_wt * WT_time12, 0 <= S_wt,];
C = [C, 0 <= p_pv <= S_pv * PV_time12, 0 <= S_pv,];
C = [C, sum(S_wt) <= 1, sum(S_pv) <= 1.5];
P_wt = [zeros(6, 24); p_wt(1, :); zeros(5, 24); p_wt(2, :); zeros(14, 24); p_wt(3, :); zeros(5, 24)]; %���װ��ڵ�
P_pv = [zeros(2, 24); p_pv(1, :); zeros(14, 24); p_pv(2, :); zeros(3, 24); p_pv(3, :); zeros(11, 24)]; %���װ��ڵ�
%EV����Լ��
%SCԼ��
P_SC = [zeros(14, 24); EV_SC12 / 4; zeros(4, 24); EV_SC12 / 4; zeros(2, 24); EV_SC12 / 4; zeros(6, 24); EV_SC12 / 4; zeros(3, 24)]; %SCװ��ڵ�
%FCԼ��
%�����ڽڵ�11
P_FC = [zeros(10, 24); EV_FC12; zeros(22, 24)];
%P_FC = [zeros(21, 24); EV_FC12; zeros(11, 24)];
%�����ڽڵ�29
%P_FC = [zeros(28, 24); EV_FC12; zeros(4, 24)];
%MT����Լ��
pp_mt = [zeros(14, 24); p_mt; zeros(18, 24)];
C = [C, 0 <= p_mt <= 0.25]; %����С��1MW��
%ESS����Լ��
%��ŵ�״̬Լ��
C = [C, a_ess_c + a_ess_d <= 1];
%����Լ��
C = [C, 0 <= p_ess_c <= a_ess_c * 0.2];
C = [C, 0 <= p_ess_d <= a_ess_d * 0.2];

%����Լ��
for t = 1:24
    C = [C, W_ess(t+1) == W_ess(t) + 0.9 * p_ess_c(t) - 1.11 * p_ess_d(t)];
end

C = [C, W_ess(1) == W_ess(25)];
C = [C, 0 <= W_ess(:) <= 0.8];
p_ess_c = [zeros(5, 24); p_ess_c; zeros(27, 24)];
p_ess_d = [zeros(5, 24); p_ess_d; zeros(27, 24)];

% ����Լ��
Pin = -input * P + input * (I .* (R * ones(1, 24))) + output * P; %�ڵ�ע���й�
Qin = -input * Q + input * (I .* (X * ones(1, 24))) + output * Q; %�ڵ�ע���޹�
C = [C, Pin + P_LOAD + P_SC + P_FC - Pg - P_wt - P_pv - pp_mt + p_ess_c - p_ess_d == 0];
C = [C, Qin + Q_LOAD - Qg == 0];
C = [C, V(BRA(:, 2), :) == V(BRA(:, 1), :) - 2 * (R * ones(1, 24)) .* P - 2 * (X * ones(1, 24)) .* Q + ((R.^2 + X.^2) * ones(1, 24)) .* I];
C = [C, V(BRA(:, 1), :) .* I >= P.^2 + Q.^2];
C = [C, Vmin <= V <= Vmax];
C = [C, Pgmin <= Pg <= Pgmax, Qgmin <= Qg <= Qgmax];
C = [C, 0 <= I <= 10];

%% 6.��Ŀ�꺯��
f = C1 + C2 + C3 + C4 + C5 + C6 + C7;
%C=[C, C1 == 1.2 * 10^3 * sum(sum(I.*(R * ones(1,24))))];%����ɱ�
C = [C, C1 == sum(pri .* P(1, :) * 10^3)]; %����ɱ�C4
n = 20; %����͹��ʹ������
r = 0.06; % ������
k = (r * (1 + r)^n) / ((1 + r)^n - 1); %���㵽ÿ��ĳɱ�ϵ��
% pwt=11520; %Ԫ/kWh,���װ���ɱ�
% pwt=10800; %Ԫ/kWh,���װ���ɱ�
C = [C, C2 == k * (11520 / 365) * 10^3 * sum(S_wt(:)) + k * (11520 / 365) * 10^3 * sum(S_pv(:))]; %װ���ɱ�
C = [C, C3 == 0.32 * 10^3 * sum(p_wt(:)) + 0.05 * 10^3 * sum(p_pv(:))]; %DG���гɱ�
%C = [C, C4 == sum(0.7 * p_mt * 1000 + 0.78)];%MT���гɱ�
C = [C, C4 >= sum(2900 * p_mt.^2 + 50 * p_mt + 780)]; %MT���гɱ�
C = [C, C5 == sum(0.27 * 1000 * abs(p_ess_c(:) + p_ess_d(:)))]; %ESS���гɱ�
C = [C, C6 >= 50 * sum(0.006 * p_mt(:).^2 + 0.5 * p_mt(:))]; %MT̼�ŷųɱ�
C = [C, C7 >= 50 * sum(0.01 * P(1, :).^2 + 0.85 * P(1, :))]; %����̼�ŷųɱ�
toc %��ģʱ��

%% 7.�������
ops = sdpsettings('verbose', 1, 'solver', 'cplex');
sol = optimize(C, f, ops);
f = value(f)
toc %���ʱ��

%% 8.���������־
if sol.problem == 0
    disp('succcessful solved');
else
    disp('error');
    yalmiperror(sol.problem)
end

%% 9.������
disp('Ŀ�꺯������ɱ�1')
double(C1)
disp('Ŀ�꺯����װ�ɱ�2')
double(C2)
disp('Ŀ�꺯�����гɱ�3')
double(C3)
disp('Ŀ�꺯�����гɱ�4')
double(C4)
disp('Ŀ�꺯�����гɱ�5')
double(C5)
disp('Ŀ�꺯�����гɱ�6')
double(C6)
disp('Ŀ�꺯�����гɱ�7')
double(C7)


disp('�����װ����')
double(S_wt)
disp('�����װ����')
double(S_pv)