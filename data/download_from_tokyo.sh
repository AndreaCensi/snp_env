#!/bin/bash
set -e
set -x

#rsync -av  --include '*.tmp.pickle' --exclude '*.*'  andrea@tokyo2:landing .
rsync -av --include '*.kh5' --include '*.xml' --exclude '*.*'  andrea@tokyo2:landing .
