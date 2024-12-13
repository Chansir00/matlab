% 仿真参数
N = 1e6; % 实验次数

% 初始化统计变量
A1_count = 0; % 第1人抓到“有”字的次数
A2_count = 0; % 第2人抓到“有”字的次数
A3_count = 0; % 第3人抓到“有”字的次数

% 实验循环
for i = 1:N
    % 初始化阄
    draws = [1, 0, 0, 0]; % 1表示“有”，0表示“无”
    draws = draws(randperm(4)); % 随机洗牌

    % 抓阄
    A1 = draws(1:2); % 第1人抓2个
    A2 = draws(3);   % 第2人抓1个
    A3 = draws(4);   % 第3人抓1个

    % 统计结果
    if any(A1 == 1) % 第1人抓到“有”字
        A1_count = A1_count + 1;
    elseif A2 == 1 % 第2人抓到“有”字
        A2_count = A2_count + 1;
    elseif A3 == 1 % 第3人抓到“有”字
        A3_count = A3_count + 1;
    end
end

% 计算概率
P_A1 = A1_count / N;
P_A2 = A2_count / N;
P_A3 = A3_count / N;

% 显示结果
fprintf('第1人抓到“有”字的概率：%.4f\n', P_A1);
fprintf('第2人抓到“有”字的概率：%.4f\n', P_A2);
fprintf('第3人抓到“有”字的概率：%.4f\n', P_A3);
