function f=AMS(s,b)
% This function calculates Approximate Median Significance (AMS)
% evaluation metric.
% INPUT
% s, b: unnormalized true positive and false positive rates, respectively.
%
% OUTPUT
% f: AMS rate
%
% CONSTANT
% b_r=10: the constant regularization term.

b_r=10;

f=sqrt(2*((s+b+b_r)*log(1+s/(b+b_r))-s));

end