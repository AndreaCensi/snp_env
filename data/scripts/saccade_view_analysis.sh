#!/bin/bash
set -e
set -x

DB=flydra_db

# TODO: add saccade detection with matlab
# TODO: add saccade detection with python

# render saccades
flydra_render_saccades --white --db $DB
flydra_render_saccades --db $DB


# compute contrast
for suffix in "" "_w"; do
for when in start stop rstop sstop random; do

flydra_render_contrast --db $DB --source saccades_view_${when}_luminance${suffix} --target saccades_view_${when}_contrast${suffix}

done
done



# now do the same thing with hallucinations

    # this renders to table "hluminance"
    flydra_render_saccades_hallucinations --white --db $DB
    # this renders to table "hluminance_w"
    flydra_render_saccades_hallucinations --db $DB
    
    # compute contrast
    for suffix in "" "_w"; do
    for when in start stop rstop sstop random; do

    flydra_render_contrast --db $DB --source saccades_view_${when}_hluminance${suffix} --target saccades_view_${when}_hcontrast${suffix}

    done
    done


    saccades_view_joint_analysis --db $DB     
    
    
    
    
    
