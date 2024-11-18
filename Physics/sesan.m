% 波长和折射率数据（单位转换为微米）
wavelengths = [578.1, 578.8, 546.1, 436.5, 404.9] * 1e-3;  % 从纳米转换为微米
refractive_index = [1.648, 1.650, 1.659, 1.670, 1.681];

% 计算波长倒数的平方
inverse_lambda_squared = 1 ./ wavelengths.^2;

% 使用 polyfit 进行线性拟合
p = polyfit(inverse_lambda_squared, refractive_index, 1);

% 计算拟合值
fitted_refractive_index = polyval(p, inverse_lambda_squared);

% 绘制结果
plot(inverse_lambda_squared, refractive_index, 'o');   % 原始数据
hold on;
plot(inverse_lambda_squared, fitted_refractive_index, '-');  % 拟合直线
xlabel('1 / Wavelength^2 (μm^{-2})');
ylabel('Refractive Index');
legend('Data', 'Linear Fit');
grid on;
hold off;

% 显示拟合参数
A = p(2);  % 截距
B = p(1);  % 斜率
fprintf('拟合参数 A = %.4f, B = %.4f\n', A, B);
