#!/bin/bash
set -e # exit on error
set -x # verbose

ids=$*

DB=flydra_db

# filter data
flydra_render_filter --db $DB --smooth landing

flydra_render --db $DB $ids
flydra_render --db $DB --white $ids
flydra_render_contrast --db $DB --source luminance --target contrast  $ids
flydra_render_contrast --db $DB --source luminance_w  --target contrast_w $ids

# render small videos (fast)
flydra_video_image --db $DB --image luminance   --filter plot_luminance  $ids
flydra_video_image --db $DB --image contrast    --filter plot_contrast $ids
flydra_video_image --db $DB --image luminance_w --filter plot_luminance $ids
flydra_video_image --db $DB --image contrast_w  --filter plot_contrast $ids

# render big videos
flydra_run_pg_model --db $DB --model flydra_display_luminance --needs rows,luminance $ids
flydra_run_pg_model --db $DB --model flydra_display_contrast --needs rows,luminance,contrast,contrast_w $ids


# analysis

mamarama_first_order --db $DB
