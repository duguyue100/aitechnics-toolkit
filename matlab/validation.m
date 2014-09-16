function ams=validation(filename, test_ID, test_W, test_L)
% this function computes AMS score for a submission.
%
% INPUT
% filename : a string for given submission.
%
% OUTPUT
% ams      : AMS score for submission.

fid=fopen(filename);
data_read=textscan(fid, '%s%s%s', 'delimiter', ',');

noCol=length(data_read);

for i=1:noCol
    data_read{i}=data_read{i}(2:end);
end

% ID
disp('Loading ID');
ID=cellfun(@str2num, data_read{1}(1:end));

% Rank
%disp('Loading Rank');
%Rank=cellfun(@str2num, data_read{2}(1:end));

% Label
disp('Loading Label');
Label=vertcat(data_read{3}{1:end});
Label=double((Label=='s'));

testData=[test_ID, test_W, test_L];
testData=sortrows(testData);
predData=[ID, Label];
predData=sortrows(predData);

% calculate ams score
ams=get_ams_score(testData(:,2), testData(:,3), predData(:,2));

end