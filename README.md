AI Techniques Toolkit
==================

##Introduction

A Matlab and Python toolkit for WXGC6307 Artificial Intelligence Techniques.

This repo is primarily serving as evaluation kit for _Higgs Boson Machine Learning Challenge_.

This repo is not an official evaluation kit for this challenge, for more information, please visit:

https://www.kaggle.com/c/higgs-boson

You are highly recommended to read all the details in above website.

This repo is developed under Matlab 2012b and Python 2.7.3. Please make sure you are using the similar or newer version (Please do not use Python 3.x for this kit).

__BEFORE YOU START, PLEASE READ FOLLOWING SECTIONS CLEARLY__

__PLEASE CONTACT ME IF YOU RUN INTO ANY PROBLEMS WHEN YOU CANNOT SOLVE__

##How to use

1. Clone or download this project to your folder
   ```
   $ git clone https://github.com/duguyue100/aitechnics-toolkit
   ```
   IGNORE THIS IF YOU'RE NOT USING GIT. CHOOSE "Download ZIP" AT RIGHT OF THIS PAGE.

2. For Matlab:
   + Open your Matlab
   + Direct working directory to mother of `aitechnics-toolkit` folder.
   + Include everything of `aitechnics-toolkit` in path (folder and sub-folders)
   + Open `matlab` folder in `aitechnics-toolkit`.
   + You can run `example.m` as a example, there are some useful comments available. 

3. For Python:
   + Import `pyhiggstool.py` in your project (you can simply put this file in your working directory).
      ```
      import pyhiggstool as pht;
      ```

##Updates

+ Matlab evaluation toolkit is available [2014-09-16]
+ Python evaluation toolkit [2014-09-19]

##Notes

+ A quick fact of this dataset: there is no correct label on the test data set because this challenge uses this set to rank people's methods. Therefore, you can use training set to form training, cross-validation and testing set for your method.

+ Currently, there are only Matlab evaluation kit is available, if you want to use Python, please wait for update or design by yourself using codes showed here by _Higgs Boson Machine Learning Challenge_

   https://github.com/log0/higgs_boson/blob/master/cleaned_model.py

+ CSV is pain to read and write in Matlab or Python. For Matlab version, I saved another two `.mat` version for the dataset also.

+ I provide a example by using Neural Network Toolbox in Matlab version, please make sure your Matlab has this toolbox for running code.

+ I develop this code on Linux, therefore, some path conventions are different from Windows system. if you run into any file system problems, please check on that. But generally, it should work.

+ In python version, there is no real example for classification, you can refer to Eric Chio (log0)'s answer.
   ```
   https://github.com/log0/higgs_boson/blob/master/cleaned_model.py
   ```

+ You can use `numpy` and `scipy` to write your own learning algorithm, and there are some libraries you can use:
   + PyBrain: http://pybrain.org/ [implemented many neural networks]
   + scikit-learn: http://scikit-learn.org/ [implemented many widely using ML algorithms]
   + Theano: http://deeplearning.net/software/theano/ [serve as numerical computation library in principle, support GPU implementation]

##Contact

Hu Yuhuang

Advanced Robotic Lab

Department of Artificial Intelligence

Faculty of Computer Science & IT

University of Malaya

Email: duguyue100@gmail.com
