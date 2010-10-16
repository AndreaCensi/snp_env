#!/bin/bash
set -e
flydra_render --db flydra_render_output --nocache
flydra_render --db flydra_render_output --nocache --white
flydra_render_contrast --db flydra_render_output --nocache


