% 电压 (mV) 和电流 (mA) 的实验数据
V_data_mV = [192, 378, 567, 757, 947, 1133, 1325, 1514, 1704, 1893];  % 电压数据 (mV)
I_s_data_mA = [0.25, 0.50, 0.75, 1.00, 1.25, 1.50, 1.75, 2.00, 2.25, 2.50];  % 电流数据 (mA)

% 转换单位
V_data = V_data_mV * 1e-3;  % 电压转换为 V
I_s_data = I_s_data_mA * 1e-3;  % 电流转换为 A

% 线性拟合：拟合电流与电压的关系 I_s = G * V
p = polyfit(V_data, I_s_data, 1);  % 线性拟合，p(1) 是电导 G

% 计算拟合曲线的电流值
I_s_fit = polyval(p, V_data);

% 绘制原始数据和拟合直线
figure;
plot(V_data, I_s_data, 'bo', 'MarkerFaceColor', 'b', 'DisplayName', 'Original Data');  % 绘制原始数据点
hold on;
plot(V_data, I_s_fit, 'r-', 'LineWidth', 1.5, 'DisplayName', 'Linear Fit');  % 绘制拟合直线
xlabel('Voltage V (V)');
ylabel('Current I_s (A)');
title('I_s-V Linear Fit');
legend('Location', 'best');
grid on;
hold off;

% 输出拟合方程的系数和电导 G
G = p(1);  % 拟合得到的电导 G
fprintf('电导 G = %.4f S\n', G);

% 假设材料的几何尺寸
L = 0.0181;  % 材料的长度 (m)
A = 3.14 * (0.0021)^2;  % 材料的截面积 (m²)

% 计算电导率 σ
sigma = G * L / A;
fprintf('电导率 σ = %.4f S/m\n', sigma);
