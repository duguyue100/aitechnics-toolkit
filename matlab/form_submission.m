function form_submission(filename, test_ID, Y, Y_pred)
% This function forms submission file for the testing result in CSV.
%
% INPUT
% filename : a single string (with .csv as extension)
% test_ID  : event id where can be found in test set
% Y        : real valued prediction.
% Y_pred   : binary valued prediction. (s==1, b==0)
%
% Noted that usually we use highest value (or a hard limit) of output to 
%identify class label, however, here I make no assumption of that.
%Therefore you need to proved a real valued prediction to generate Rank
%Order and a binary valued prediction to generate label

% Generate RankOrder

[~, Rank]=sort(Y);

% Generate Predicted Label

Y_pred=num2str(Y_pred);
Y_pred(Y_pred=='1')='s';
Y_pred(Y_pred=='0')='b';

% Generate Output Matrix

test_ID=int64(test_ID);

% Generate CSV file

fileID=fopen(filename, 'wt');
fprintf(fileID, 'EventId,RankOrder,Class\n');

for i=1:size(test_ID,1)
    str=sprintf('%ld,%ld,%s\n', test_ID(i), Rank(i), Y_pred(i));
    fprintf(fileID, str);
end
fclose(fileID);

end