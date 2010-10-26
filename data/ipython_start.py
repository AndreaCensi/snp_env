
import numpy
from numpy import *

from matplotlib import pylab

from pylab import *


import pickle

def pl(x):
    return pickle.load(open(x))


from procgraph_flydra.values2retina import values2retina

def plot_ret(x):
    pylab.imshow( values2retina(x))


from flydra_render.db import *

import tables