% Author: Hu Yuhuang
% Date  : 2014-09-16

% This script gives an example of how to use this toolkit on Higgs Boson
% Machine Learning Challenge Dataset

%% init

clc;
clear;
close all;

%% read data

% read from raw data (takes long time, recommended for making submission,
% not recommended for testing)

%[train_ID, train_F, train_W, train_L]=read_training_data('training.csv');
%[test_ID, test_F]=read_testing_data('testing.csv');

% read from formatted mat file (contains numbers only, recommended for
% testing)
load('training.mat'); % consists of train_ID, train_F, train_W, train_L
%load('test.mat'); % consists of test_ID, test_F

%% Build model

% this test is building based on neural network toolbox

trainLabel=zeros(2, size(train_L, 1));

for i=1:size(trainLabel,2)
    trainLabel(train_L(i)+1, i)=1;
end

input=train_F';
target=trainLabel;

hiddenLayerSize=100;
net=patternnet(hiddenLayerSize);

net.divideParam.trainRatio = 60/100;
net.divideParam.valRatio = 20/100;
net.divideParam.testRatio = 20/100;

[net, tr]=train(net, input, target);

output=net(input);
error=gsubtract(target, output);
performance = perform(net,target,output);


%% Calculate Score

Y_pred=(output(1,:)<output(2,:))';

ams=get_ams_score(train_W, train_L, Y_pred);

ams_message=sprintf('Your method scored: %f', ams);
disp(ams_message);

%% Make submission file

form_submission('../data/output.csv', train_ID, output, Y_pred);

%% Validation

% this is built for submission only.
validate_ams=validation('../data/output.csv', train_ID, train_W, train_L);

ams_message=sprintf('Your validated method scored: %f', validate_ams);
disp(ams_message);