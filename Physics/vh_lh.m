% 假设 V_h_data 和 I_m_data 分别是电压和电流数据
V_h_data = [0.34,0.67,1.00,1.34,1.67,2.00,2.34,2.69,3.01,3.35];  % 电压数据 (mV)
I_m_data = [50,100,150,200,250,300,350,400,450,500];  % 电流数据 (mA)

% 线性拟合：拟合电压与电流的关系 V_h = a * I_s + b
p = polyfit(I_m_data, V_h_data, 1);  % 1表示线性拟合，p是拟合的系数 [a, b]

% 计算拟合曲线的电压值
V_h_fit = polyval(p, I_m_data);  % 使用拟合的系数计算拟合曲线的值

% 绘制原始数据和拟合直线
figure;
plot(I_m_data, V_h_data, 'bo', 'MarkerFaceColor', 'b');  % 绘制原始数据点
hold on;
plot(I_m_data, V_h_fit, 'r-', 'LineWidth', 1.5);  % 绘制拟合直线
xlabel('Current I_m (mA)');
ylabel('Voltage V_h (mV)');
title('Vh - Im,');
legend('Original Data', 'Linear Fit', 'Location', 'best');
grid on;
hold off;

% 输出拟合方程的系数
fprintf('Linear fit equation: V_h = %f * I_s + %f\n', p(1), p(2));