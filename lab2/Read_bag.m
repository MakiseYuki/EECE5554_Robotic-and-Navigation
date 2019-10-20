clear
clc


bag = rosbag('Garage_move_new.bag');
% frames = bag.AvailableFrames;
bSel = select(bag,'Topic','/utm_fix');
msgStructs = readMessages(bSel);

msg_x=[];
msg_y=[];
msg_z=[];
for i=1:length(msgStructs)
    msg_x=[msg_x msgStructs{i}.Pose.Pose.Position.X];
    msg_y=[msg_y msgStructs{i}.Pose.Pose.Position.Y];
    msg_z=[msg_z msgStructs{i}.Pose.Pose.Position.Z];
end

plot(msg_x, msg_y, '.')
% plot3(start_x, start_y, start_z, '&')
% plot3(msg_x, msg_y, msg_z, '.')
xlabel('utm easting(meter)')
ylabel('utm northing(meter)')
zlabel('atitude(meter)')
% C = cov(msg_x, msg_y, msg_z)