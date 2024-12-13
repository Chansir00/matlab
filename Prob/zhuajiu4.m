num_experiments = 10000; % 实验次数
results_3 = zeros(3, 1); % 每人抓到“有”字的次数
probabilities_3 = zeros(num_experiments, 3); % 每次实验后每人的概率

for n = 1:num_experiments
    % 初始化4个阄，其中1个阄为“有”字
    balls = [1, 0, 0, 0]; 
    balls = balls(randperm(4)); % 随机打乱顺序
    
    % 第1人抓2个阄
    first_person = balls(1:2);
    if any(first_person == 1)
        results_3(1) = results_3(1) + 1;
    else
        % 第2人抓1个阄
        if balls(3) == 1
            results_3(2) = results_3(2) + 1;
        else
            % 第3人抓1个阄
            if balls(4) == 1
                results_3(3) = results_3(3) + 1;
            end
        end
    end
    
    % 计算当前实验次数下每个人的抓到“有”字概率
    probabilities_3(n, :) = results_3 / n;
end

% 绘制概率变化曲线
figure;
hold on;
for i = 1:3
    plot(1:num_experiments, probabilities_3(:, i), 'DisplayName', ['Person ' num2str(i)]);
end
xlabel('Number of Experiments');
ylabel('Probability of Getting "有"');
title('Probability Convergence for 3 People Grabbing 4 Balls');
yline(1/2, '--r', 'Theoretical: 1st Person 1/2');
yline(1/4, '--g', 'Theoretical: 2nd Person 1/4');
yline(1/4, '--b', 'Theoretical: 3rd Person 1/4');
legend;
grid on;
hold off;
