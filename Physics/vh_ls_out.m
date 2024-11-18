% 从 CSV 文件中导入数据
data = readtable('your_data_file.csv');  % 假设文件名为 your_data_file.csv

% 假设 CSV 文件中有两列: I_s 和 V_h
I_s_data = data.I_s;  % 读取电流数据
V_h_data = data.V_h;  % 读取电压数据

% 绘制电压与电流的关系曲线
% 线性拟合：拟合电压与电流的关系 V_h = a * I_s + b
p = polyfit(I_s_data, V_h_data, 1);  % 1表示线性拟合，p是拟合的系数 [a, b]

% 计算拟合曲线的电压值
V_h_fit = polyval(p, I_s_data);  % 使用拟合的系数计算拟合曲线的值

% 绘制原始数据和拟合直线
figure;
plot(I_s_data, V_h_data, 'bo', 'MarkerFaceColor', 'b');  % 绘制原始数据点
hold on;
plot(I_s_data, V_h_fit, 'r-', 'LineWidth', 1.5);  % 绘制拟合直线
xlabel('Current I_s (A)');
ylabel('Voltage V_h (V)');
title('V_h vs I_s with Linear Fit');
legend('Original Data', 'Linear Fit', 'Location', 'best');
grid on;
hold off;

% 输出拟合方程的系数
fprintf('Linear fit equation: V_h = %.2f * I_s + %.2f\n', p(1), p(2));
