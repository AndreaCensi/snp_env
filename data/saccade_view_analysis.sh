#!/bin/bash
set -e
set -x

DB=flydra_render_output

# render saccades
flydra_render_saccades --white --db flydra_render_output
flydra_render_saccades --db $DB

# compute contrast

flydra_render_contrast --db $DB --source saccades_view_start_luminance_w --target saccades_view_start_contrast_w
flydra_render_contrast --db $DB --source saccades_view_stop_luminance_w --target saccades_view_stop_contrast_w
flydra_render_contrast --db $DB --source saccades_view_rstop_luminance_w --target saccades_view_rstop_contrast_w

flydra_render_contrast --db $DB --source saccades_view_stop_luminance --target saccades_view_stop_contrast
flydra_render_contrast --db $DB --source saccades_view_start_luminance --target saccades_view_start_contrast
flydra_render_contrast --db $DB --source saccades_view_rstop_luminance --target saccades_view_rstop_contrast

saccades_view_analysis --image luminance
saccades_view_analysis --image contrast
saccades_view_analysis --image luminance_w
saccades_view_analysis --image contrast_w
