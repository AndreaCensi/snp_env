#!/bin/bash
set -e
#set -x

INPUT_DIR=${SNPENV_DATA}/source/landing
OUT_DIR=${SNPENV_DATA}/reports/201106/
TMP_DIR=${SNPENV_DATA}/processed/201106/geo_sac_detect
DB_DIR=${SNPENV_DATA}/processed/201106/flydra_db

# Filter data, put in DB
echo flydra_render_filter --db ${DB_DIR} --smooth ${INPUT_DIR}

#sac_density_report --db ${DB_DIR} --outdir ${OUT_DIR}/density --group nopost
sac_density_report --compmake_command "remake *joint* *report*" --db ${DB_DIR} --outdir ${OUT_DIR}/density --group nopost
echo sac_density_report --db ${DB_DIR} --outdir ${OUT_DIR}/density --group posts


# Extract saccades
echo geo_sac_detect --output ${TMP_DIR} ${INPUT_DIR}
echo geo_sac_to_flydradb --db ${DB_DIR} ${TMP_DIR}

# Analyze saccades
echo sac_spontaneous_analysis --db ${DB_DIR} --outdir ${OUT_DIR}/spontaneous_analysis 
