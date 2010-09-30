#!/bin/bash
set -e
echo "I am assuming you installed all the required software. (press enter)"
read
config=environment.sh

echo \#\!/bin/bash > ${config}
echo "# load this using   source ${config}" >> ${config}
echo export SNPENV_ROOT=`pwd` >>${config}
echo export SNPENV_PREFIX=\${SNPENV_ROOT}/deploy >>${config}
echo export SNPENV_SRC=\${SNPENV_ROOT}/src >>${config}
echo export SNPENV_DATA=\${SNPENV_ROOT}/data >>${config}
echo export SNPENV_OUT=\${SNPENV_ROOT}/results >>${config}
echo export PATH=\${SNPENV_PREFIX}/bin:\$PATH >>${config}
echo export PKG_CONFIG_PATH=\${SNPENV_PREFIX}/lib/pkgconfig >>${config}

source ${config}
cat ${config}

echo "Now creating virtual environment (press enter)"
read
echo Create a new virtual env for python
virtualenv ${SNPENV_PREFIX}
echo source ${SNPENV_PREFIX}/bin/activate >> ${config}
source ${config}


mkdir -p ${SNPENV_SRC}
mkdir -p ${SNPENV_DATA}

echo Installing nose in this virtual env
${SNPENV_PREFIX}/bin/easy_install nose

echo "Installing a yaml library (for patience)"
${SNPENV_PREFIX}/bin/easy_install pyyaml

echo "Install patience"
pip install -e "git+git@github.com:AndreaCensi/patience.git#egg=Patience"


echo "The next steps can be done with patience. (patience resources.yaml checkout)"
read

 



#tokyo=131.215.42.218
#cd ${SNPENV_DATA} && rsync --progress -a -v andrea@tokyo:BIGDATA/er1-logs .
#cd ${SNPENV_DATA} && rsync --progress -a -v andrea@131.215.42.218:BIGDATA/er1-logs .

