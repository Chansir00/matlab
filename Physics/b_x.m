% 霍尔电压 V_h (mV) 和位移 x (mm) 的实验数据
V_h_data_mV = [0.19,0.33,0.53,0.77,1.10,1.50,1.90,2.25,2.51,2.70,2.83,3.00,3.09,3.14,3.17,3.18,3.19,3.19,3.19,3.17,3.15,3.11,3.05,2.92,2.81,2.67,2.47,2.19,1.84,1.44,1.05,0.75,0.51,0.34];  % 霍尔电压 (mV)
x_data_mm = [0,5,10,15,20,25,30,35,40,45,50,60,70,80,90,100,110,120,130,140,150,160,170,180,185,190,195,200,205,210,215,220,225,230];  % 位移 x (mm)

l1=length(V_h_data_mV);
l2=length(x_data_mm);

% 霍尔传感器的灵敏度常数 k 和工作电流 I
k = 163;  % 灵敏度常数 (mV/mA·T)
I = 500;  % 工作电流 (A)

% 计算磁感应强度 B (T)
B_data = V_h_data_mV ./ (k * I);  % 根据公式 B = V_h / (k * I)

% 绘制 B-x 曲线 (x 仍然以 mm 为单位)
figure;
plot(x_data_mm, B_data, 'b-o', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
xlabel('Position x (mm)');  % x 轴单位为 mm
ylabel('Magnetic Flux Density B (T)');
title('B-x Curve of Electromagnet');
grid on;
