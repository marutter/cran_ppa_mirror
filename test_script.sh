#!/bin/bash
cd /home/mrutter/CRAN

. ~/CRAN/packages.txt

ArchiveDir=/home/cran/ubuntu

packages=${CRANPackages}
releases=${CRANReleases}
relnum=(${CRANRelNum})
releases35=${CRAN35Releases}
relnum35=(${CRAN35RelNum})
relnum35np=(${CRAN35RelNum2})
releases40=${CRAN40Releases}
relnum40=(${CRAN40RelNum})
relnum40np=(${CRAN40RelNum2})
rcomp=${RComponents}

echo ${releases}
echo ${releases35}
echo ${releases40}
echo ${relnum40}
echo ${relnum40np}

#sudo apt-mirror

INDEX=0
for r in ${releases40}; do
 for p in ${packages}; do
#   rm /home/mrutter/CRAN/ubuntu/${r}/*${p}*
   # paths=`find /home/mrutter/CRAN/mirror/ppa.launchpad.net/marutter/rrutter4.0 -name *${p}* | grep -i ${r}`
   # rsync -av --exclude-from '/home/mrutter/CRAN/exclude.txt' ${paths} ${ArchiveDir}/${r}-cran40
   # if [[ ${p} -ne "ess" ]]
   # then
   #   paths=`find /home/mrutter/CRAN/mirror/ppa.launchpad.net/marutter/rrutter4.0 -name *${p}* | grep ${relnum40[$INDEX]}`
   #   rsync -av --exclude-from '/home/mrutter/CRAN/exclude.txt' ${paths} ${ArchiveDir}/${r}-cran40
     paths=`find /home/mrutter/CRAN/mirror/ppa.launchpad.net/marutter/rrutter4.0 -name *${p}* | grep ${relnum40np[$INDEX]}`
     echo ${p}
     echo ${paths}
#      rsync -av --exclude-from '/home/mrutter/CRAN/exclude.txt' ${paths} ${ArchiveDir}/${r}-cran40
#    fi
# #  cp ${paths} /home/mrutter/CRAN/ubuntu/${r}
#    paths=`find /home/mrutter/CRAN/mirror/ppa.launchpad.net/marutter/rrutter4.0 -name *${p}* | grep orig`
# #  cp ${paths} /home/mrutter/CRAN/ubuntu/${r}
#    rsync -av --exclude-from '/home/mrutter/CRAN/exclude.txt' ${paths} ${ArchiveDir}/${r}-cran40
 done
#  for p in ${rcomp}; do
#    paths=`find /home/mrutter/CRAN/mirror/ppa.launchpad.net/marutter/rrutter4.0 -name *${p}* | grep -i ${r}`
#    rsync -av --exclude-from '/home/mrutter/CRAN/exclude.txt' ${paths} ${ArchiveDir}/${r}-cran40
#  done
 ((INDEX++))
done

INDEX=0
for r in ${releases}; do
 for p in ${packages}; do
#   rm /home/mrutter/CRAN/ubuntu/${r}/*${p}*
#   paths=`find /home/mrutter/CRAN/mirror/ppa.launchpad.net/marutter/rrutter -name *${p}* | grep ${r}`
#   rsync -av --exclude-from '/home/mrutter/CRAN/exclude.txt' ${paths} ${ArchiveDir}/${r}
   paths=`find /home/mrutter/CRAN/mirror/ppa.launchpad.net/marutter/rrutter -name *${p}* | grep ${relnum[$INDEX]}`
   echo ${p}
   echo ${paths}
#   rsync -av --exclude-from '/home/mrutter/CRAN/exclude.txt' ${paths} ${ArchiveDir}/${r}
#  cp ${paths} /home/mrutter/CRAN/ubuntu/${r}
#   paths=`find /home/mrutter/CRAN/mirror/ppa.launchpad.net/marutter/rrutter -name *${p}* | grep orig`
#  cp ${paths} /home/mrutter/CRAN/ubuntu/${r}
#   rsync -av --exclude-from '/home/mrutter/CRAN/exclude.txt' ${paths} ${ArchiveDir}/${r}
 done
# for p in ${rcomp}; do
#   paths=`find /home/mrutter/CRAN/mirror/ppa.launchpad.net/marutter/rrutter -name *${p}* | grep ${r}`
#   rsync -av --exclude-from '/home/mrutter/CRAN/exclude.txt' ${paths} ${ArchiveDir}/${r}
# done
 ((INDEX++))
done
