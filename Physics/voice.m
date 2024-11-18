% 距离和时间数据
distance = [3.000,5.000,7.000,9.000,11.000,13.000]; % 单位：厘米
time = [180,237,322,380,436,494]; % 单位：微秒

% 线性拟合
% 线性拟合
coefficients = polyfit(time, distance, 1);

% 获取拟合的斜率（即声速）和截距
slope = coefficients(1); % 斜率即为声速，单位为 cm/µs
intercept = coefficients(2);

% 打印声速
fprintf('拟合得到的声速为: %.4f cm/µs\n', slope);

% 绘制原始数据和拟合直线
time_fit = linspace(min(time), max(time), 100);
distance_fit = polyval(coefficients, time_fit);

plot(time, distance, 'o', 'MarkerSize', 8, 'DisplayName', '实验数据');
hold on;
plot(time_fit, distance_fit, '-r', 'LineWidth', 1.5, 'DisplayName', '线性拟合');
xlabel('时间 (µs)');
ylabel('距离 (cm)');
title('L-t');
legend;
grid on;
hold off;