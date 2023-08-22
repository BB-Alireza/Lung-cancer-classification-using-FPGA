clc;
clear;

filename = 'C:\Users\Javad Hasanpour\Desktop\FPGA\MATLAB\data prepare for matlab\cancer_dataset.csv';
delimiter = ',';
startRow = 2;

% Format string for each line of text:
formatSpec = '%f%f%f%[^\n\r]';
% Open the text file.
fileID = fopen(filename,'r');
% Read columns of data according to format string.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'HeaderLines' ,startRow-1, 'ReturnOnError', false);
% Close the text file.
fclose(fileID);
% Allocate imported array to column variable names
AGE = dataArray{:, 1};
SMOKING = dataArray{:, 2};
LUNG_CANCER = dataArray{:, 3};
% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans;
%

%%
%age into 0-1

n=90;                                    %darsade train
[numberOfData,~]=size(AGE);
lenTrain = floor( (n/100)*numberOfData); 
lenTest = numberOfData - lenTrain ;

x_train = [AGE(1:lenTrain) SMOKING(1:lenTrain)];
y_train = [LUNG_CANCER(1:lenTrain)];

x_test = [AGE((lenTrain+1):numberOfData) SMOKING((lenTrain+1):numberOfData)];
y_test = [LUNG_CANCER((lenTrain+1):numberOfData)];

save('data.mat','x_train','y_train','x_test','y_test');