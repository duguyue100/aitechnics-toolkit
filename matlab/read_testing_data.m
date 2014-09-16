function [ID, F]=read_testing_data(filename)
% This function reads and splits testing data
%
% INPUT
% filename : a string of data file name
%
% OUTPUT
% ID       : ID column (N*1)
% F        : Feature matrix (N*30)

fid=fopen(filename);
data_read=textscan(fid, '%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s', 'delimiter', ',');

noCol=length(data_read);

for i=1:noCol
    data_read{i}=data_read{i}(2:end);
end

% ID
disp('Loading Testing ID');
ID=cellfun(@str2num, data_read{1}(1:end));

% Feature
disp('Loading Testing Feature');
F=zeros(size(data_read{1},1), noCol-1);
for i=2:noCol
    F(:, i-1)=cellfun(@str2num, data_read{i}(1:end));
end

end