
#!/bin/bash
set -e
set -x
# Summary:
#   group           Dananassae  samples:  15  configurations:  17 raw data? True
#   group            Darizonae  samples:  10  configurations:  17 raw data? True
#   group               Dhydei  samples:  14  configurations:  17 raw data? True
#   group        Dmelanogaster  samples:  15  configurations: 129 raw data? True
#   group          Dmojavensis  samples:  10  configurations:  17 raw data? True
#   group       Dpseudoobscura  samples:  10  configurations:  17 raw data? True
#   group           blueFilter  samples:  28  configurations:   2 raw data? True
#   group    circularPolarizer  samples:  14  configurations:   2 raw data? True
#   group circularPolarizercloudy  samples:   5  configurations:   2 raw data? True
#   group           grayFilter  samples:  13  configurations:   2 raw data? True
#   group     grayFiltercloudy  samples:   6  configurations:   2 raw data? True
#   group        indoorhalogen  samples:   9  configurations:   2 raw data? True
#   group      mamaramanoposts  samples:  30  configurations:   1 raw data? False
#   group        mamaramaposts  samples:  57  configurations:   1 raw data? False
#   group             noFilter  samples:  10  configurations:   2 raw data? True
#   group       noFiltercloudy  samples:  11  configurations:   2 raw data? True
#   group                peter  samples:  96  configurations:   2 raw data? True
#   group                  ros  samples:  74  configurations: 129 raw data? True

ros="Dananassae,Darizonae,Dhydei,Dmelanogaster,Dmojavensis,Dpseudoobscura"
peter="blueFilter,circularPolarizer,circularPolarizercloudy,grayFilter,grayFiltercloudy,indoorhalogen,noFilter,noFiltercloudy"
mama="mamaramaposts,mamaramanoposts"

reportdir="saccade_report"

groups="${ros},${peter},${mama}"
combid=detector_comparison-all
configurations=andrea_detector,ros_detector

sac_master_plot --flydra_db import_db \
                --groups "${groups}"  \
                --configurations "${configurations}" \
                --report $reportdir \
                --combid $combid \
                --interactive
                
groups="Dmelanogaster"
combid=detector_comparison-melanogaster
configurations=andrea_detector,ros_detector

sac_master_plot --flydra_db import_db \
                --groups "${groups}"  \
                --configurations "${configurations}" \
                --report $reportdir \
                --combid $combid \
                --interactive

# All configurations for Melanogaster
groups="Dmelanogaster"
combid=Dmelanogaster_tethered_all
configurations=all
# 
# sac_master_plot --flydra_db import_db \
#                 --groups "${groups}"  \
#                 --configurations "${configurations}" \
#                 --report $reportdir \
#                 --combid $combid --interactive
# 
