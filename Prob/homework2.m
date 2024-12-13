num_experiments = 10000; % 总实验次数
results = zeros(5, 1);    % 每人抓到“有”字的次数
probabilities = zeros(num_experiments, 5); % 存储每次实验后各人的概率

for n = 1:num_experiments
    % 每次实验随机分配阄
    balls = [1, 0, 0, 0, 0]; % 1 代表“有”字，0 代表空阄
    balls = balls(randperm(5)); % 随机打乱顺序
    
    % 找到“有”字对应的人
    index = find(balls == 1); % 找到“有”字的阄分配给谁
    results(index) = results(index) + 1; % 记录抓到“有”字的次数
    
    % 计算当前实验下每个人的抓到“有”字概率
    probabilities(n, :) = results / n;
end

% 绘图：5个人的实验概率随实验次数增加的变化
figure;
hold on;
for i = 1:5
    plot(1:num_experiments, probabilities(:, i), 'DisplayName', ['Person ' num2str(i)]);
end
yline(1/5, '--k', 'Theoretical Probability 1/5'); % 理论概率线
xlabel('Number of Experiments');
ylabel('Probability of Getting "有"');
title('Probability Convergence of 5 People Grabbing 5 Balls');
legend;
grid on;
hold off;
