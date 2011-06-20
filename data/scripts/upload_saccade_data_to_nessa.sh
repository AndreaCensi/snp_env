set -e
set -x

rsync --progress -zav \
    --include 'threshold1' \
    --include 'threshold7' \
    --include 'threshold9' \
    --include 'threshold10' \
    --include 'threshold116' \
    --exclude 'threshold*' --exclude 'shelve' saccade_data/ andrea@cds:svn/snp_env_epd/data/saccade_data
