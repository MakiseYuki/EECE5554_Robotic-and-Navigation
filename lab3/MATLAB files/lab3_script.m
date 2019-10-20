clear all

load('stationary_imu_data.mat')
stationary_imu = data();

load('stationary_outside_imu.mat')
stationary_outside_imu = data();

load('testdrive_imu.mat')
testdrive_imu = data();

load('testdrive_gps.mat')
testdrive_gps = data();

for i = 1:1270 % testdrive_gps
    utm_x(i) = 1.0e+06-testdrive_gps(i,5);
    utm_y(i) = testdrive_gps(i,6);
    lat(i) = testdrive_gps(i,2);
    lon(i) = testdrive_gps(i,3);
end

for i = 1:18042
    so_yaw(i) = stationary_outside_imu(i,2);
    so_pitch(i) = stationary_outside_imu(i,3);
    so_roll(i) = stationary_outside_imu(i,4);
    so_mag_x(i) = stationary_outside_imu(i,5);
    so_mag_y(i) = stationary_outside_imu(i,6);
    so_mag_z(i) = stationary_outside_imu(i,7);
    so_acc_x(i) = stationary_outside_imu(i,8);
    so_acc_y(i)= stationary_outside_imu(i,9);
    so_acc_z(i) = stationary_outside_imu(i,10);
    so_gyro_x(i) = stationary_outside_imu(i,11);
    so_gyro_y(i) = stationary_outside_imu(i,12);
    so_gyro_z(i) = stationary_outside_imu(i,13);
end

for i = 1:45780
    s_yaw(i) = stationary_imu(i,2);
    s_pitch(i) = stationary_imu(i,3);
    s_roll(i) = stationary_imu(i,4);
    s_mag_x(i) = stationary_imu(i,5);
    s_mag_y(i) = stationary_imu(i,6);
    s_mag_z(i) = stationary_imu(i,7);
    s_acc_x(i) = stationary_imu(i,8);
    s_acc_y(i)= stationary_imu(i,9);
    s_acc_z(i) = stationary_imu(i,10);
    s_gyro_x(i) = stationary_imu(i,11);
    s_gyro_y(i) = stationary_imu(i,12);
    s_gyro_z(i) = stationary_imu(i,13);
end

for i = 1:50797 % testdrive_imu
    yaw(i) = testdrive_imu(i,2);
    pitch(i) = testdrive_imu(i,3);
    roll(i) = testdrive_imu(i,4);
    mag_x(i) = testdrive_imu(i,5);
    mag_y(i) = testdrive_imu(i,6);
    mag_z(i) = testdrive_imu(i,7);
    acc_x(i) = testdrive_imu(i,8);
    acc_y(i)= testdrive_imu(i,9);
    acc_z(i) = testdrive_imu(i,10);
    gyro_x(i) = testdrive_imu(i,11);
    gyro_y(i) = testdrive_imu(i,12);
    gyro_z(i) = testdrive_imu(i,13);
end

acc_x(50798:50800) = 0;
acc_y(50798:50800) = 0;
acc_z(50798:50800) = 0;
gyro_x(50798:50800) = 0;
gyro_y(50798:50800) = 0;
gyro_z(50798:50800) = 0;
yaw(50798:50800) = 0;
yaw(50798:50800) = 0;
yaw(50798:50800) = 0;

clear data;

% caculate the hard-iron and soft-iron
% alpha and beta used for correct hard-iron distortion

alpha = (max(mag_x(320:1240)) + min(mag_x(320:1240)))/2;
beta = (max(mag_y(320:1240)) + min(mag_y(320:1240)))/2;
center_x = mean(mag_x(320:1240));
center_y = mean(mag_y(320:1240));

for i = 320:1240
    hard_correct_mag_x(i) = mag_x(i) - alpha;
    hard_correct_mag_y(i) = mag_y(i) - beta;
    r(i) = sqrt(hard_correct_mag_x(i)^2 + hard_correct_mag_y(i)^2);
end

center_x = mean(mag_x(320:1240));
center_y = mean(mag_y(320:1240));
szigma = 1.1;

for i = 320:1240
    shard_correct_mag_x(i) = hard_correct_mag_x(i)/szigma;
    shard_correct_mag_y(i) = hard_correct_mag_y(i);
end

for i = 320:1240
    if mag_y(i) > 0 && mag_x(i) > 0
        inc_angle(i) = - atan(mag_y(i)/mag_x(i))*(180/pi);
    end
    if mag_y(i) > 0 && mag_x(i) < 0
        inc_angle(i) = -180 - atan(mag_y(i)/mag_x(i))*(180/pi);
    end
    if mag_y(i) < 0 && mag_x(i) < 0
        inc_angle(i) = 180 - atan(mag_y(i)/mag_x(i))*(180/pi);
    end
    if mag_y(i) < 0 && mag_x(i) > 0
        inc_angle(i) = - atan(mag_y(i)/mag_x(i))*(180/pi);
    end
    
   
    
    if hard_correct_mag_y(i) > 0 && hard_correct_mag_x(i) > 0
        shc_angle(i) = - atan(hard_correct_mag_y(i)/hard_correct_mag_x(i))*(180/pi);
    end
    if hard_correct_mag_y(i) > 0 && hard_correct_mag_x(i) < 0
        shc_angle(i) = -180 - atan(hard_correct_mag_y(i)/hard_correct_mag_x(i))*(180/pi);
    end
    if hard_correct_mag_y(i) < 0 && hard_correct_mag_x(i) < 0
        shc_angle(i) = 180 - atan(hard_correct_mag_y(i)/hard_correct_mag_x(i))*(180/pi);
    end
    if hard_correct_mag_y(i) < 0 && hard_correct_mag_x(i) > 0
        shc_angle(i) = - atan(hard_correct_mag_y(i)/hard_correct_mag_x(i))*(180/pi);
    end
end

for i = 321:1210
    yaw_turn(i) = yaw(i)-yaw(i-1);
end
for i = 2:1270
    v_gps(i-1) = sqrt((utm_x(i)-utm_x(i-1))^2+(utm_y(i)-utm_y(i-1))^2);
end

v_gps(1270) = 0;

for i = 1:1270
    d_acc_x(i) = mean(acc_x(40*i-39:40*i));
end

v_imu = cumtrapz(d_acc_x);

for i = 1:1270
   dv_imu(i) = v_imu(i) + 2*i*abs(min(v_imu)/1270); 
end

v_gps = v_gps*3600/1000;
dv_imu = dv_imu*3600/1000; % KPH

for i = 1:1270;
    fix_imu(i) = dv_imu(i) - i*(max(dv_imu)-min(dv_imu))/1270;
end

X1 = cumtrapz(-acc_x);
w1 = gyro_z;
Y1 = cumtrapz(-acc_y);

for i = 1:50800
wX(i) = X1(i)*w1(i);
end

gyro_z_int = cumtrapz(-gyro_z(1:2310));

d1 = designfilt('lowpassiir','FilterOrder',13, ...
    'HalfPowerFrequency',0.1,'DesignMethod','butter');
acc_filt = filtfilt(d1,-acc_x)-0.3;
max = max(cumtrapz(acc_filt));
unfix_v = cumtrapz(acc_filt);
for i = 1:50800
    v_filt(i) = -(unfix_v(i) - i*max/50800)*0.1;
end

for i = 1:1270
    if i < 1270
        dlt = (v_gps(i)-v_gps(i+1))/40;
    end
    for j = 1:40
        ex_gps_v(40*(i-1)+ j) = v_gps(i) + j*dlt;
    end
end

for i = 1:50800
    x_move_east(i) = ex_gps_v(i) * w1(i)*cos(yaw(i))*40;
    x_move_north(i) = ex_gps_v(i) * w1(i)*sin(yaw(i))*40;
end

% x_move_east = filtfilt(d1, x_move_east);
% x_move_north = filtfilt(d1, x_move_north);

for i = 1:1270
    s_x_move_east(i) = mean(x_move_east(40*i-39:40*i));
    s_x_move_north(i) = mean(x_move_north(40*i-39:40*i));
end
for i = 1:1269
    x_move_east_g(i) = utm_x(i+1)-utm_x(i);
    x_move_north_g(i) = utm_y(i+1)-utm_y(i);
end
%plot((1:50800),v_filt,(1:50800),ex_gps_v)
% plot(-acc_x)
% hold on
% plot(acc_filt-0.1)
%plot(utm_x,utm_y, '.')
%plot((1:1270),fix_imu,(1:1270),v_gps)


% for i = 1:1270
%    v_imu(i) = cumtrapz(-acc_x); 
% end
%plot((320:1240),inc_angle(320:1240),(320:1240),shc_angle(320:1240),(320:1240),yaw(320:1240))
%plot(hard_correct_mag_x(320:1240)*100,hard_correct_mag_y(320:1240)*100, '.')

% plot(center_x*100,center_y*100,mag_x(320:1240)*100, mag_y(320:1240)*100)
% axis([-25 25 -25 25])
% hold on
%plot(hard_correct_mag_x(320:1240),hard_correct_mag_y(320:1240), '*')

%plot(utm_x(1:55), utm_y(1:55), '.') % first 55 points in 3 circles
%plot(lat, lon, '.')
%clear all