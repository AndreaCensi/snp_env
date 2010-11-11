set -x 
set -e

conf=peters_conf_base3

for x in indoorhalogen blueFilter circularPolarizer circularPolarizercloudy grayFilter grayFiltercloudy indoorhalogen noFilter noFiltercloudy; do 
    rm saccade_data/$x/processed/use_for_report
    ln -s $conf saccade_data/$x/processed/use_for_report

done

