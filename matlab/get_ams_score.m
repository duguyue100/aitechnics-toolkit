function ams=get_ams_score(W, Y, Y_pred)
% This function calculates AMS scores given classification result.
%
% INPUT
% W     : vector of weights (N*1 positive real numbers)
% Y     : vector of true labels (N*1 elements)
% Y_pred: vector of predicted labels (N*1 elements)
%
% OUTPUT
% ams   : AMS scores of classification result.

s=sum(W.*(Y==1).*(Y_pred==1));
b=sum(W.*(Y==0).*(Y_pred==1));

ams=AMS(s,b);

end