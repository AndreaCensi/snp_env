dbdir = 'processed/flydra_db'

import numpy
from numpy import *

from matplotlib import pylab

from pylab import *


import pickle

def pl(x):
    return pickle.load(open(x))

from flydra_db  import *

import tables

try:
    db = FlydraDB(dbdir, False)
    print('Loaded db from %r' % dbdir)
except:
    pass