#!/bin/bash
set -x
set -e

input=weir2.pkl

sac_peter2ros --peters_pickle ${input} --data saccade_data
