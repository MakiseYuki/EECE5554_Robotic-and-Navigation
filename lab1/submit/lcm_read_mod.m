clear all;
close all;

% add the lcm.jar file to the matlabpath - need to only do this once
% load the file which modified by java to define the structure
javaaddpath lcm.jar
javaaddpath lab1_t.jar



log_file = lcm.logging.Log('/Users/lin.yus/Desktop/Workplace/lab1/log/log5', 'r'); 

% now read the file 

utm_x=[];
utm_y=[];

while true
    try
        for i = 1:10000
            ev = log_file.readNext();
            if strcmp(ev.channel, 'GPS')

                msg = gps.lab1_t(ev.data);

                timestamp = msg.timestamp;
                alt(i) = msg.altitude;
                lat(i) = msg.latitude;
                long(i) = msg.longitude;
                utm_easting(i) = msg.utmeasting;
                utm_northing(i) = msg.utmnorthing;
                utm_x = [utm_x msg.utmeasting];
                utm_y = [utm_y msg.utmnorthing];
                
            end
        end
    catch err
        break;
    end
end

plot(utm_x,utm_y,'.');




