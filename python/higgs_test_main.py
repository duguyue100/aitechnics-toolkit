import numpy as np;
import pyhiggstool as pht;

## Load data

ids_train, X, Y, W=pht.load_training_data("./data/training.csv");
ids_test, X_test=pht.load_testing_data("./data/test.csv");

print 'IDS_TRAIN: ', ids_train.shape; 
print 'X:', X.shape;
print 'Y: ', Y.shape;
print 'W: ', W.shape;

print "IDS_TEST: ", ids_test.shape;
print "X_test: ", X_test.shape;


## Test output

# Noted that this is just dummy data for testing only

ids_test=ids_train[1:100];
Y_test_pred=X[1:100, 4];
thresholded_Y_test_pred=Y[1:100];

pht.write_submission_file(ids_test, Y_test_pred, thresholded_Y_test_pred);