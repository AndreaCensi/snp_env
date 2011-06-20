#!/bin/bash
set -x 
set -e

db=../import_db

# Import new data from ros
sac_import_matlab_ros --db $db --saccade_data forAndrea_20101130/data/checkered_100fps/

# Import old processed data 
sac_import_matlab_andrea --verbose --db $db --saccade_data matlab_processed

# Import mamarama data (this could be made much better)
sac_import_matlab_andrea --verbose --db $db --saccade_data mamarama

# Import Peter's raw data
pickle=weir.pkl
sac_import_peter --db $db --peters_pickle $pickle


sac_choose_version --db $db

flydra_db_stats --db $db