#!/bin/bash
set -e

INPUT_DIR=landing/
TMP_DIR=$INPUT_DIR/detection/kf/

geo_sac_detect --output $TMP_DIR $INPUT_DIR 
geo_sac_compact $TMP_DIR



scp $TMP_DIR/saccades.mat andrea@cds:svn/snp_env/src/saccade_analysis/data/mamarama/processed/use_for_report/

scp $TMP_DIR/saccades-posts.mat andrea@cds:svn/snp_env/src/saccade_analysis/data/mamaramaposts/processed/use_for_report/saccades.mat

scp $TMP_DIR/saccades-noposts.mat andrea@cds:svn/snp_env/src/saccade_analysis/data/mamaramanoposts/processed/use_for_report/saccades.mat

