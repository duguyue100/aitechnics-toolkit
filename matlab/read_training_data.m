function [ID, F, W, L]=read_training_data(filename)
% This function reads and splits training data
%
% INPUT
% filename : a string of data file name
%
% OUTPUT
% ID       : ID column (N*1)
% F        : Feature matrix (N*30)
% W        : Weight vector (N*1)
% L        : Label vector (N*1)

fid=fopen(filename);
data_read=textscan(fid, '%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s', 'delimiter', ',');

noCol=length(data_read);

for i=1:noCol
    data_read{i}=data_read{i}(2:end);
end

% ID
disp('Loading Training ID');
ID=cellfun(@str2num, data_read{1}(1:end));

% Feature
disp('Loading Training Feature');
F=zeros(size(data_read{1},1), noCol-3);
for i=2:noCol-2
    F(:, i-1)=cellfun(@str2num, data_read{i}(1:end));
end

% Weight
disp('Loading Training Weights');
W=cellfun(@str2num, data_read{noCol-1}(1:end));

% Label
disp('Loading Training Label');
L=vertcat(data_read{noCol}{1:end});
L=double((L=='s'));

end