% 假设 N 和 q 的数据
N = [3,4,5,4,3,4]; % 粒子数密度，单位 m^-3
q = [1.698e-19,1.635e-19,1.609e-19,1.618e-19,1.627e-19,1.620e-19]; % 电荷密度，单位 C/m^3

% 创建图形
figure;
plot(N, q, '-o', 'LineWidth', 2, 'MarkerSize', 6);
xlabel('粒子数密度 (m^{-3})');
ylabel('电荷密度 (C/m^{3})');
title('N-q图');
grid on;

% 计算并显示斜率
p = polyfit(N, q, 1); % 线性拟合
slope = p(1); % 斜率
hold on;
x_fit = linspace(min(N), max(N), 100);
y_fit = polyval(p, x_fit);
plot(x_fit, y_fit, '--r'); % 拟合线
legend('实验数据', '线性拟合');
text(0.1 * max(N), 0.9 * max(q), ['斜率 = ' num2str(slope)], 'FontSize', 12);
hold off;
