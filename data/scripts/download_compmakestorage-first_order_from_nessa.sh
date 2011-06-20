set -e
set -x

#rsync -av andrea@nessa:svn/snp_env_epd/data/compmake_storage/\*first_order\* compmake_storage/

rsync --progress -av andrea@nessa:svn/snp_env_epd/data/compmake_storage/\*first_order\*contrast_w-avel-id-\*between\* compmake_storage/