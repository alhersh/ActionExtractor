
function imuData = getIMUData(IMUFile, startTime, endTime)
% IMU was acquired using 125Hz sampling rate
% Count : is the sample number. From the raw data file

%disp(['Reading IMU file: ' IMUFile]);
fid = fopen(IMUFile);
strDataIMU = textscan(fid, '%f %f %f %f %f %f %f %f %f %s %s', 'HeaderLines', 2);
fclose(fid);
dataIMU = zeros (size(strDataIMU{1},1),size(strDataIMU,2)-2);
%       for i = 1 : size(strDataIMU,2)-1
%           dataIMU(:,i) = str2double(strDataIMU{i});
%       end
for i=1:9
    dataIMU(:,i) = strDataIMU{i};
end

startPoint = round((startTime/1000)*125);
endPoint = round((endTime/1000)*125);

idxStart = find(strcmp(strDataIMU{10}, num2str(startPoint)));
idxEnd = find(strcmp(strDataIMU{10}, num2str(endPoint)));

imuData =  dataIMU(idxStart:idxEnd,:);


%fprintf('Start time: %s, Stop time: %s.\n',startTime, stopTime);




    
end

