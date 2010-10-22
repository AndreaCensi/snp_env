#!/bin/bash
set -e
set -x

DB=flydra_db

# render saccades
flydra_render_saccades --white --db $DB
flydra_render_saccades --db $DB

# compute contrast
for suffix in "" "_w"; do
for when in start stop rstop random; do

flydra_render_contrast --db $DB --source saccades_view_${when}_luminance${suffix} --target saccades_view_${when}_contrast_${suffix}

done
done

saccades_view_analysis --db $DB --image luminance
saccades_view_analysis --db $DB --image contrast
saccades_view_analysis --db $DB --image luminance_w
saccades_view_analysis --db $DB --image contrast_w
