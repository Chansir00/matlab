% 假设 V_h_data 和 I_s_data 分别是电压和电流数据
V_h_data = [0.56,1.11,1.67,2.22,2.78,3.34];  % 电压数据 (V)
I_s_data = [0.05,1.00,1.50,2.00,2.50,3.00];  % 电流数据 (A)

% 线性拟合：拟合电压与电流的关系 V_h = a * I_s + b
p = polyfit(I_s_data, V_h_data, 1);  % 1表示线性拟合，p是拟合的系数 [a, b]

% 计算拟合曲线的电压值
V_h_fit = polyval(p, I_s_data);  % 使用拟合的系数计算拟合曲线的值

% 绘制原始数据和拟合直线
figure;
plot(I_s_data, V_h_data, 'bo', 'MarkerFaceColor', 'b');  % 绘制原始数据点
hold on;
plot(I_s_data, V_h_fit, 'r-', 'LineWidth', 1.5);  % 绘制拟合直线
xlabel('Current I_s (mA)');
ylabel('Voltage V_h (mV)');
title('Vh - Is');
legend('Original Data', 'Linear Fit', 'Location', 'best');
grid on;
hold off;

% 输出拟合方程的系数
fprintf('Linear fit equation: V_h = %.2f * I_s + %.2f\n', p(1), p(2));