#!/bin/bash 

credname=x509up_u`id -u`
credfile=/tmp/${credname}

echo "Edit the getplots.sh script to get the right dates..."

month=09
day=30
year=2012

begin=2012-07-01
end=2012-09-30

curl -s -x "" -O http://cms-project-relval.web.cern.ch/cms-project-relval/CustodialSummary/${year}/${month}/${day}/custodial_tape_storage_pie.png
curl -s -x "" -O http://cmsdcam3.fnal.gov:8081/DOEmetrics/FNALViewHistoryParser2.jpg
curl -s -x "" -o month-ranking-plot.png http://cmsdcam3.fnal.gov:8081/DOEmetrics/TestJobsBars90.png
curl -s -x "" -O http://cmsdcam3.fnal.gov:8081/DOEmetrics/cms_farm_usgae1.jpg

curl -s -x "" -o site-avail.png http://cmsdcam3.fnal.gov:8081/DOEmetrics/ReadinessBars90.png

curl -s -x "" -o utilization_pledged.png "http://dashb-cms-jobsmry.cern.ch/dashboard/request.py/resourceutilization_individual?sites=All%20T10&activities=all&sitesSort=1&start=${begin}&end=${end}&timeRange=daily&granularity=Daily&generic=0&sortBy=0&diag1=0&diag2=0&diag3=0&diag4=0&diag5=0&diag6=0&diag7=0&diagT=0&type=up"

curl -s -x "" -o processing-share.png  "http://dashb-cms-jobsmry.cern.ch/dashboard/request.py/resourceutilization_individual?sites=All%20T10&amp;activities=all&amp;sitesSort=1&amp;start=${begin}&amp;end=${end}&amp;timeRange=daily&amp;granularity=Daily&amp;generic=0&amp;sortBy=0&amp;diag1=0&amp;diag2=0&amp;diag3=0&amp;diag4=0&amp;diag5=0&amp;diag6=0&amp;diag7=0&amp;diagT=0&amp;type=psa"

curl -s -x "" -O http://cmsdcam3.fnal.gov:8081/DOEmetrics/siteActivity_individual.png
curl -s -x "" -O http://cmsdcam3.fnal.gov:8081/DOEmetrics/cms_dcache_transfers.jpg
curl -s -x "" -O http://cmsdcam3.fnal.gov:8081/DOEmetrics/diskActivityUsage-t1.jpg
curl -s -x "" -O http://cmsdcam3.fnal.gov:8081/DOEmetrics/diskActivityUsage-t3.jpg
curl -s -x "" -O http://cmsdcam3.fnal.gov:8081/DOEmetrics/cms_farm_usgae.jpg
curl -s -x "" -O http://cmsdcam3.fnal.gov:8081/DOEmetrics/PhEDEx-cmlVolumeSourceFNAL.png
curl -s -x "" -O http://cmsdcam3.fnal.gov:8081/DOEmetrics/PhEDEx-cmlVolumeDestinFNAL.png

curl -s -x "" -O -k --key ${credfile} --cert ${credfile} https://cmsdcam2.fnal.gov/dcache/CMS_BYTES/cms_bytes2.jpg
curl -s -x "" -O -k --key ${credfile} --cert ${credfile} https://cmsdcam2.fnal.gov/dcache/CMS_BYTES/cms_bytes3.jpg 
curl -s -x "" -O -k --key ${credfile} --cert ${credfile} https://cmsdcam2.fnal.gov/dcache/CMS_BYTES/ALL.jpg 
curl -s -x "" -O -k --key ${credfile} --cert ${credfile} https://cmsjobmon.fnal.gov/RepairHistory-stat-simple.jpg 
curl -s -x "" -O -k --key ${credfile} --cert ${credfile} https://cmsjobmon.fnal.gov/RepairHistory-disk-simple.jpg  

curl -s -x "" -O -k --key ${credfile} --cert ${credfile} http://cmsdcam3.fnal.gov:8081/tape_verified_delay_plot-90.jpg

echo "Do cp ~/opsreport/1.jpg ~/quarterly/whatever/t1-performance-tests.jpg"
