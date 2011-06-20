set -e 
set -x

cmd="remake *report"

# remake everythink
for image in luminance contrast luminance_w contrast_w  \
             hluminance hcontrast hluminance_w hcontrast_w; do

      compmake --slave "saccade_view_analysis_$image" remake \*report
#     compmake --slave "saccade_view_analysis_$image" clean all
    
done
