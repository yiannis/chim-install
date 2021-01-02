mkdir -p /CHIMERE
mkdir -p ~/incoming/chimere

cd ~/incoming/chimere
for tgz in {chimere_v2020r1.tar.gz,emiSURF2020.tar.gz,BIGFILES2020.tar.gz,Emisurf_domains.tar.gz,MEGAN_30s.tar.gz,TestCase2020.tar.gz,TestCase3Nests2020.tar.gz,TestCaseEMISURF2020.tar.gz,emiFIRES_CAMS_v2020r1.tar.gz}; do
  if [ -f ${tgz} ]; then
    echo File ${tgz} exists. Skipping...
  else
    wget --user 'ichristo@phys.uoa.gr' --password='ichristo.2018' ${tgz}
  fi
done

cd /CHIMERE
for tgz in {chimere_v2020r1.tar.gz,emiSURF2020.tar.gz,BIGFILES2020.tar.gz,Emisurf_domains.tar.gz,MEGAN_30s.tar.gz,TestCase2020.tar.gz,TestCase3Nests2020.tar.gz,TestCaseEMISURF2020.tar.gz,emiFIRES_CAMS_v2020r1.tar.gz}; do
  echo Extracting: ${tgz}
  tar xf ~/incoming/chimere/${tgz}
done

apt-get install mlocate gawk

updatedb # config.sh uses locate to find paths

cd /CHIMERE/chimere_v2020r1/mychimere/makefiles.hdr
ln -s Makefile.hdr.gfortran-64-ompi Makefile.hdr.gfortran-4.8-64-ompi

cp /root/mychimere-ubuntu-18.04 /CHIMERE/chimere_v2020r1/mychimere/


