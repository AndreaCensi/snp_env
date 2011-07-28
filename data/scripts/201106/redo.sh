#!/bin/bash
set -e
set -x

INPUT_DIR=${SNPENV_DATA}/source/landing
OUT_DIR=${SNPENV_DATA}/reports/201106/
DB_DIR=${SNPENV_DATA}/processed/201106/flydra_db
DATA_DIR=${SNPENV_DATA}/processed/201106/compmake

args="--db ${DB_DIR} --datadir ${DATA_DIR}/sac_density_report --outdir ${OUT_DIR}/sac_density_report"

sac_density_report $args --version kf --group nopost  --compmake "remake *joint* *write* report_models_choice"


