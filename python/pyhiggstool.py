# Author: Hu Yuhuang
# Date  : 2014-09-19

"""
This code is directly derived from Eric Chio's (log0) solution
you can find the original code here:
https://github.com/log0/higgs_boson/blob/master/cleaned_model.py
"""

import csv;
import math;
import os;
import random;

import numpy as np;

### Metrics

def ams(s, b, br=10):
    """
    Calculates approximate median significance (AMS)
    
    :type s: double
    :param s: unnormalized positive rate.
    
    :type b: double
    :param b: unnormalized false positive rate.
    
    :type br: double
    :param br: br=10 is the constant regularization term.
    
    log is natural log.
    """
    return math.sqrt(2*((s+b+br)*math.log(1.0+s/(b+br))-s));

def get_ams_score(W, Y, Y_pred):
    """
    Calculates AMS score for given prediction.
    
    :type W: N*1 array
    :param W: vector of weights.
    
    :type Y: N*1 array
    :param W: vector of true labels.
    
    :type Y_pred: N*1 array
    :param Y_pred: vector of predicted labels.
    """
    s=W*(Y==1)*(Y_pred==1);
    b=W*(Y==0)*(Y_pred==1);
    
    s=np.sum(s);
    b=np.sum(b);
    
    return ams(s,b);

### read file

def load_training_data(path):
    """
    Load training file
    
    :type path: string
    :param path: file path of training data
    
    It returns 4 variables
    ids_train: training sample ids (N*1 array)
    X: training sample features (N*30 array)
    Y: training sample true label (N*1 array) (s==1, b==0)
    W: training sample weights (N*1 array)
    """
    print "Loading training data.";
    
    data=np.loadtxt(path,
                    delimiter=',',
                    skiprows=1,
                    converters={32: lambda x: int(x=='s'.encode('utf-8'))});
    
    ids_train=data[:,0];
    X=data[:,1:31];
    Y=data[:,32];
    W=data[:,31];
    
    return ids_train, X, Y, W;

def load_testing_data(path):
    """
    Load testing file
    
    :type path: string
    :param path: file path of testing file
    
    It returns two variables:
    ids_test: testing labels (N*1 array)
    X_test: testing features (N*30 array)
    """
    print "Loading testing data.";
    
    data=np.loadtxt(path,
                    delimiter=',',
                    skiprows=1);
                    
    ids_test=data[:,0];
    X_test=data[:,1:31];
    
    return ids_test, X_test;

### write file

def write_submission_file(ids_test,
                          Y_test_pred,
                          thresholded_Y_test_pred,
                          ):
    """
    Write answer to CSV file
    
    :type ids_test: M*1 array
    :param ids_test: labels of test samples.
    
    :type Y_test_pred: M*1 array (in double)
    :param Y_test_pred: predicted values of testing samples
    
    :type thresholded_Y_test_pred: M*1 array (0 or 1)
    :param thresholded_Y_test_pred: predicted class of testing samples
    """
    ids_probs = np.transpose(np.vstack((ids_test, Y_test_pred)));
    ids_probs = np.array(sorted(ids_probs, key=lambda x:-x[1]));
    ids_probs_ranks = np.hstack((ids_probs,
                                 np.arange(1,
                                           ids_probs.shape[0] + 1).reshape((ids_probs.shape[0],
                                                                            1))));
    
    test_id_map={};
    
    for test_id, prob, rank in ids_probs_ranks:
        test_id=int(test_id);
        rank=int(rank);
        test_id_map[test_id]=rank;
        
    f=open('output.csv', 'wb');
    writer=csv.writer(f);
    writer.writerow(['EventId', 'RankOrder', 'Class']);
    for i, pred in enumerate(thresholded_Y_test_pred):
        event_id=int(ids_test[i]);
        rank=test_id_map[ids_test[i]];
        klass=pred and 's' or 'b';
        writer.writerow([event_id, rank, klass]);
        
    f.close();
