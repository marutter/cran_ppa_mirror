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
echo ${relnum40[@]}
echo ${relnum40np[@]}

#sudo apt-mirror

# INDEX=0
# for r in ${releases}; do
#  for p in ${packages}; do
# #   rm /home/mrutter/CRAN/ubuntu/${r}/*${p}*
#    paths=`find /home/mrutter/CRAN/mirror/ppa.launchpad.net/marutter/rrutter -name *${p}* | grep -i ${r}`
#    rsync -av --exclude-from '/home/mrutter/CRAN/exclude.txt' ${paths} ${ArchiveDir}/${r}
#    paths=`find /home/mrutter/CRAN/mirror/ppa.launchpad.net/marutter/rrutter -name *${p}* | grep ${relnum[$INDEX]}`
#    rsync -av --exclude-from '/home/mrutter/CRAN/exclude.txt' ${paths} ${ArchiveDir}/${r}
# #  cp ${paths} /home/mrutter/CRAN/ubuntu/${r}
#    paths=`find /home/mrutter/CRAN/mirror/ppa.launchpad.net/marutter/rrutter -name *${p}* | grep orig`
# #  cp ${paths} /home/mrutter/CRAN/ubuntu/${r}
#    rsync -av --exclude-from '/home/mrutter/CRAN/exclude.txt' ${paths} ${ArchiveDir}/${r}
#  done
#  for p in ${rcomp}; do
#    paths=`find /home/mrutter/CRAN/mirror/ppa.launchpad.net/marutter/rrutter -name *${p}* | grep -i ${r}`
#    rsync -av --exclude-from '/home/mrutter/CRAN/exclude.txt' ${paths} ${ArchiveDir}/${r}
#  done
#  ((INDEX++))
# done
#
# INDEX=0
# for r in ${releases35}; do
#  for p in ${packages}; do
# #   rm /home/mrutter/CRAN/ubuntu/${r}/*${p}*
#    paths=`find /home/mrutter/CRAN/mirror/ppa.launchpad.net/marutter/rrutter3.5 -name *${p}* | grep -i ${r}`
#    rsync -av --exclude-from '/home/mrutter/CRAN/exclude.txt' ${paths} ${ArchiveDir}/${r}-cran35
#    if [[ ${p} -ne "ess" ]]
#    then
#      paths=`find /home/mrutter/CRAN/mirror/ppa.launchpad.net/marutter/rrutter3.5 -name *${p}* | grep ${relnum35[$INDEX]}`
#      rsync -av --exclude-from '/home/mrutter/CRAN/exclude.txt' ${paths} ${ArchiveDir}/${r}-cran35
#    fi
# #  cp ${paths} /home/mrutter/CRAN/ubuntu/${r}
#    paths=`find /home/mrutter/CRAN/mirror/ppa.launchpad.net/marutter/rrutter3.5 -name *${p}* | grep orig`
# #  cp ${paths} /home/mrutter/CRAN/ubuntu/${r}
#    rsync -av --exclude-from '/home/mrutter/CRAN/exclude.txt' ${paths} ${ArchiveDir}/${r}-cran35
#  done
#  for p in ${rcomp}; do
#    paths=`find /home/mrutter/CRAN/mirror/ppa.launchpad.net/marutter/rrutter3.5 -name *${p}* | grep -i ${r}`
#    rsync -av --exclude-from '/home/mrutter/CRAN/exclude.txt' ${paths} ${ArchiveDir}/${r}-cran35
#  done
#  ((INDEX++))
# done

INDEX=0
for r in ${releases40}; do
 for p in ${packages}; do
   echo {$r}
   echo {$p}
#   rm /home/mrutter/CRAN/ubuntu/${r}/*${p}*
   paths=`find /home/mrutter/CRAN/mirror/ppa.launchpad.net/marutter/rrutter4.0 -name *${p}* | grep -i ${r}`
   echo {$paths}
   rsync -av --exclude-from '/home/mrutter/CRAN/exclude.txt' ${paths} ${ArchiveDir}/${r}-cran40
   if [[ ${p} -ne "ess" ]]
   then
     paths=`find /home/mrutter/CRAN/mirror/ppa.launchpad.net/marutter/rrutter4.0 -name *${p}* | grep ${relnum40[$INDEX]}`
     echo {$paths}
     rsync -av --exclude-from '/home/mrutter/CRAN/exclude.txt' ${paths} ${ArchiveDir}/${r}-cran40
     paths=`find /home/mrutter/CRAN/mirror/ppa.launchpad.net/marutter/rrutter4.0 -name *${p}* | grep ${relnum40np[$INDEX]}`
     echo {$paths}
     rsync -av --exclude-from '/home/mrutter/CRAN/exclude.txt' ${paths} ${ArchiveDir}/${r}-cran40
   fi
#  cp ${paths} /home/mrutter/CRAN/ubuntu/${r}
   paths=`find /home/mrutter/CRAN/mirror/ppa.launchpad.net/marutter/rrutter4.0 -name *${p}* | grep orig`
   echo {$paths}
#  cp ${paths} /home/mrutter/CRAN/ubuntu/${r}
   rsync -av --exclude-from '/home/mrutter/CRAN/exclude.txt' ${paths} ${ArchiveDir}/${r}-cran40
 done
 for p in ${rcomp}; do
   paths=`find /home/mrutter/CRAN/mirror/ppa.launchpad.net/marutter/rrutter4.0 -name *${p}* | grep -i ${r}`
   echo {$paths}
   rsync -av --exclude-from '/home/mrutter/CRAN/exclude.txt' ${paths} ${ArchiveDir}/${r}-cran40
 done
 ((INDEX++))
done

# ./remove_old.sh
# ./remove_old35.sh
# ./remove_old40.sh

# for r in ${releases}; do
#   rm -f ${ArchiveDir}/${r}/Release
#   rm -f ${ArchiveDir}/${r}/Release.gpg
#   rm -f ${ArchiveDir}/${r}/InRelease
# #  rm -f ${ArchiveDir}/${r}/*20110218*.*
#   sudo apt-ftparchive generate apt-ftparchive_${r}.conf
#   sudo apt-ftparchive -c apt-ftparchive_${r}.conf --sha1=no release ${ArchiveDir}/${r}> ${ArchiveDir}/${r}/Release
#   gpg --pinentry-mode loopback --passphrase-file=/home/mrutter/.pgp/.zeke -abs -o ${ArchiveDir}/${r}/Release.gpg ${ArchiveDir}/${r}/Release
#   if [[ ${r} > "wily" ]]
#   then
#     gpg --pinentry-mode loopback --passphrase-file=/home/mrutter/.pgp/.zeke --clearsign -o ${ArchiveDir}/${r}/InRelease ${ArchiveDir}/${r}/Release
#   fi
#   sudo chmod 644 ${ArchiveDir}/${r}/Packages
#   sudo chmod 644 ${ArchiveDir}/${r}/Packages.gz
#   sudo chmod 644 ${ArchiveDir}/${r}/Sources
#   sudo chmod 644 ${ArchiveDir}/${r}/Sources.gz
# done
#
# for r in ${releases35}; do
#   rm -f ${ArchiveDir}/${r}-cran35/Release
#   rm -f ${ArchiveDir}/${r}-cran35/Release.gpg
#   rm -f ${ArchiveDir}/${r}-cran35/InRelease
# #  rm -f ${ArchiveDir}/${r}/*20110218*.*
#   sudo apt-ftparchive generate apt-ftparchive_${r}-cran35.conf
#   sudo apt-ftparchive -c apt-ftparchive_${r}-cran35.conf --sha1=no release ${ArchiveDir}/${r}-cran35> ${ArchiveDir}/${r}-cran35/Release
#   gpg --pinentry-mode loopback --passphrase-file=/home/mrutter/.pgp/.zeke -abs -o ${ArchiveDir}/${r}-cran35/Release.gpg ${ArchiveDir}/${r}-cran35/Release
#   gpg --pinentry-mode loopback --passphrase-file=/home/mrutter/.pgp/.zeke --clearsign -o ${ArchiveDir}/${r}-cran35/InRelease ${ArchiveDir}/${r}-cran35/Release
#   sudo chmod 644 ${ArchiveDir}/${r}-cran35/Packages
#   sudo chmod 644 ${ArchiveDir}/${r}-cran35/Packages.gz
#   sudo chmod 644 ${ArchiveDir}/${r}-cran35/Sources
#   sudo chmod 644 ${ArchiveDir}/${r}-cran35/Sources.gz
# done

for r in ${releases40}; do
  rm -f ${ArchiveDir}/${r}-cran40/Release
  rm -f ${ArchiveDir}/${r}-cran40/Release.gpg
  rm -f ${ArchiveDir}/${r}-cran40/InRelease
#  rm -f ${ArchiveDir}/${r}/*20110218*.*
  sudo apt-ftparchive generate apt-ftparchive_${r}-cran40.conf
  sudo apt-ftparchive -c apt-ftparchive_${r}-cran40.conf --sha1=no release ${ArchiveDir}/${r}-cran40> ${ArchiveDir}/${r}-cran40/Release
  gpg --pinentry-mode loopback --passphrase-file=/home/mrutter/.pgp/.zeke -abs -o ${ArchiveDir}/${r}-cran40/Release.gpg ${ArchiveDir}/${r}-cran40/Release
  gpg --pinentry-mode loopback --passphrase-file=/home/mrutter/.pgp/.zeke --clearsign -o ${ArchiveDir}/${r}-cran40/InRelease ${ArchiveDir}/${r}-cran40/Release
  sudo chmod 644 ${ArchiveDir}/${r}-cran40/Packages
  sudo chmod 644 ${ArchiveDir}/${r}-cran40/Packages.gz
  sudo chmod 644 ${ArchiveDir}/${r}-cran40/Sources
  sudo chmod 644 ${ArchiveDir}/${r}-cran40/Sources.gz
done

rsync -av /home/mrutter/Dropbox/R/README.rmd ${ArchiveDir}/
mv ${ArchiveDir}/README.rmd ${ArchiveDir}/README
rsync -av /home/mrutter/Dropbox/R/README.html ${ArchiveDir}/

#rsync -avz --progress --delete -e 'ssh -p 1022' /home/mrutter/CRAN/ubuntu mar36@boson.aset.psu.edu:~
