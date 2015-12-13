# -*- coding: utf-8 -*-
"""
Created on Sat Dec 05 17:30:47 2015

@author: AO
"""

from __future__ import print_function
import gzip
import pickle
import array
with gzip.open('C:\Users\AO\Desktop\Programming\Pascal-AI-Testing\mnist.pkl.gz', 'rb') as f:
    train_set, valid_set, test_set = pickle.load(f)
    
train_x, train_y = train_set
a = array

fo = open("C:/Users/AO/Desktop/output(50000).txt", "w")
for y in xrange(49999):
    a = train_x[y]
    for x in xrange(784):
        print(a[x],end=' ',file=fo)
    print(file=fo)    
    print(train_y[y],file=fo)
print(file=fo)
fo.close
