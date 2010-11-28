#!/bin/bash
set -x 
set -e

db=../import_db

# Import new data from ros
sac_import_matlab_ros --flydra_db $db --saccade_data ros_new_data
# Import old processed data 
# sac_import_matlab_andrea --verbose --flydra_db $db --saccade_data matlab_processed
# Import mamarama data (this could be made much better)
# sac_import_matlab_andrea --verbose --flydra_db $db --saccade_data mamarama

#pickle=weir_some.pkl
pickle=weir.pkl
#sac_import_peter --flydra_db $db --peters_pickle $pickle


sac_choose_version --db ../import_db


flydra_db_stats --db ../import_db 