#!/bin/bash
set -e
set -x

INPUT_DIR=${SNPENV_DATA}/source/landing
OUT_DIR=${SNPENV_DATA}/reports/201106/
DB_DIR=${SNPENV_DATA}/processed/201106/flydra_db
DATA_DIR=${SNPENV_DATA}/processed/201106/compmake

# # Filter data, put in DB
flydra_render_filter --db ${DB_DIR} ${INPUT_DIR} --smooth 
flydra_render_filter --db ${DB_DIR} ${INPUT_DIR}

# # Extract saccades
geo_sac_detect_flydra --db ${DB_DIR} --version kf     #--nocache
geo_sac_detect_flydra --db ${DB_DIR} --version smooth #--nocache

# Analyze saccade
args="--db ${DB_DIR} --datadir ${DATA_DIR}/sac_density_report --outdir ${OUT_DIR}/sac_density_report"
sac_density_report $args --version smooth --group nopost  --compmake "make"
sac_density_report $args --version smooth --group posts   --compmake "make"
# sac_density_report $args --version kf  --group nopost  --compmake "make"
# sac_density_report $args --version kf  --group posts   --compmake "make"
 
# sac_density_report $args --version kf  --group nopost --compmake  "remake *joint* *report*" 
#--compmake "remake *joint* report_models_choice write*"
# sac_density_report $args --version kf  --group posts  --compmake make # $cm 

#sac_density_report --db ${DB_DIR} --outdir ${OUT_DIR}/density --group nopost
# sac_density_report --compmake  "remake *joint* *report*" --db ${DB_DIR} --outdir ${OUT_DIR}/density --group nopost
# sac_density_report --compmake  "remake *report_models_choice* *write*" --db ${DB_DIR} --outdir ${OUT_DIR}/density --group nopost
# 
# # Analyze saccades
# echo sac_spontaneous_analysis --db ${DB_DIR} --outdir ${OUT_DIR}/spontaneous_analysis 
