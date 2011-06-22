#!/bin/bash
set -e
set -x

dir=landing/detection/kf-oct17

sac_tammero_analysis --saccades $dir/saccades-noposts.h5   --output tammero_analysis/noposts/
sac_tammero_analysis --saccades $dir/saccades-posts.h5     --output tammero_analysis/posts/
