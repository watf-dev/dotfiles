#!/bin/sh
#echo ".zlogin"
#touch ~/zlogin
dir="/tmp/${USER}/.cache/"
mkdir -p ${dir}
chmod 700  ${dir}
chrome="${HOME}/.cache"
#echo ${chrome}
if [ -h  ${chrome} ]
then
#echo "file is symbolic link"
elif [ -d ${chrome} ]
then
#echo "mv ${chrome} dot.cache.old"
mv ${chrome} ${HOME}/dot.cache.old
ln -sf ${dir} ${HOME}
else
ln -sf ${dir} ${HOME}
fi
#echo "ln ${dir} ${HOME} -sf"
