#!/bin/bash
set -e # exit on error
set -x # verbose

ids=$*

flydra_render --db flydra_render_output $ids
flydra_render --db flydra_render_output --white $ids
flydra_render_contrast --db flydra_render_output --source luminance --target contrast  $ids
flydra_render_contrast --db flydra_render_output --source luminance_w  --target contrast_w $ids

# render small videos (fast)
flydra_video_image --image luminance   --filter plot_luminance  $ids
flydra_video_image --image contrast    --filter plot_contrast $ids
flydra_video_image --image luminance_w --filter plot_luminance $ids
flydra_video_image --image contrast_w  --filter plot_contrast $ids
