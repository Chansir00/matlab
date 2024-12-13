% 参数设定
T = 20; % 总时间
t_values = [5]; % 等待时间的不同取值
N_trials = 1e5; % 总实验次数
step = 100; % 每次递增的实验次数

% 初始化
N_steps = floor(N_trials / step);
P_simulated = zeros(N_steps, length(t_values));
N_values = step * (1:N_steps);

% 多次实验
for k = 1:length(t_values)
    t = t_values(k);
    count = 0; % 累计满足条件的次数
    for i = 1:N_steps
        % 每次生成 step 对随机点
        X1 = rand(step, 1) * T;
        X2 = rand(step, 1) * T;
        % 判断条件 |X1 - X2| <= t
        count = count + sum(abs(X1 - X2) <= t);
        % 记录模拟概率
        P_simulated(i, k) = count / (i * step);
    end
end

% 理论概率
P_theoretical = 1-(1 - t_values / T)^2;

% 绘图
figure;
hold on;
for k = 1:length(t_values)
    plot(N_values, P_simulated(:, k), 'LineWidth', 1.5, 'DisplayName', ...
        sprintf('t = %d (Simulated)', t_values(k)));
    yline(P_theoretical(k), '--', 'LineWidth', 1.5, 'DisplayName', ...
        sprintf('t = %d (Theoretical)', t_values(k)));
end
hold off;
xlabel('Number of Trials');
ylabel('Probability');
legend;
title('Meeting Probability Convergence');
grid on;
