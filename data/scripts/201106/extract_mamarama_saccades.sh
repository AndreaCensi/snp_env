#!/bin/bash
set -e
set -x

INPUT_DIR=${SNPENV_DATA}/source/landing
OUT_DIR=${SNPENV_DATA}/reports/201106/
TMP_DIR=${SNPENV_DATA}/processed/201106/geo_sac_detect
DB_DIR=${SNPENV_DATA}/processed/201106/flydra_db

# geo_sac_detect --output ${TMP_DIR} ${INPUT_DIR}
# geo_sac_to_flydradb --db ${DB_DIR} ${TMP_DIR}
sac_spontaneous_analysis --db ${DB_DIR} --outdir ${OUT_DIR}/spontaneous_analysis


# geo_sac_compact $TMP_DIR