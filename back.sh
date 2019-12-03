#!/bin/bash

folderName="Incorta_logs_$(date +%d%m%Y)"
mkdir -p /home/incorta/copylogs/$folderName/{cmc,analytics,loader}
mkdir -p /home/incorta/copylogs/$folderName/analytics/incorta/vlreports/
mkdir -p /home/incorta/copylogs/$folderName/loader/incorta/vlreports/

cp -r /incapp/VL_IncortaAnalytics/IncortaNode/services/ae1f2bc1-0467-47a2-a74d-116226b78d40/logs/localhost_access_log.2019-12* /home/incorta/copylogs/$folderName/analytics/
cp -r /incapp/VL_IncortaAnalytics/IncortaNode/services/ae1f2bc1-0467-47a2-a74d-116226b78d40/logs/catalina.out /home/incorta/copylogs/$folderName/analytics/
cp -r /incapp/VL_IncortaAnalytics/IncortaNode/services/ae1f2bc1-0467-47a2-a74d-116226b78d40/logs/manager.2019-12-* /home/incorta/copylogs/$folderName/analytics/

cp -r /incapp/VL_IncortaAnalytics/IncortaNode/services/ae1f2bc1-0467-47a2-a74d-116226b78d40/logs/incorta/incorta.2019-12-* /home/incorta/copylogs/$folderName/analytics/incorta/
cp -r /incapp/VL_IncortaAnalytics/IncortaNode/services/ae1f2bc1-0467-47a2-a74d-116226b78d40/logs/incorta/vlreports/incorta.2019-12-* /home/incorta/copylogs/$folderName/analytics/incorta/vlreports/

cp -r /incapp/VL_IncortaAnalytics/IncortaNode/services/1d4bf743-75e2-4485-ac56-34f1f5041e90/logs/catalina.2019-12-* /home/incorta/copylogs/$folderName/loader/
cp -r /incapp/VL_IncortaAnalytics/IncortaNode/services/1d4bf743-75e2-4485-ac56-34f1f5041e90/logs/catalina.out  /home/incorta/copylogs/$folderName/loader/
cp -r /incapp/VL_IncortaAnalytics/IncortaNode/services/1d4bf743-75e2-4485-ac56-34f1f5041e90/logs/incorta/vlreports/incorta.2019-12-* /home/incorta/copylogs/$folderName/loader/incorta/vlreports/

cp -r /incapp/VL_IncortaAnalytics/cmc/logs/cmc.log /home/incorta/copylogs/$folderName/cmc/
cp -r /incapp/VL_IncortaAnalytics/cmc/logs/catalina.out /home/incorta/copylogs/$folderName/cmc/
cp -r /incapp/VL_IncortaAnalytics/cmc/logs/catalina.2019-12-* /home/incorta/copylogs/$folderName/cmc/
cp -r /incapp/VL_IncortaAnalytics/cmc/logs/localhost_access_log.2019-12-* /home/incorta/copylogs/$folderName/cmc/
cp -r /incapp/VL_IncortaAnalytics/cmc/logs/host-manager.2019-12-* /home/incorta/copylogs/$folderName/cmc/

if test -f "$folderName.7z"; then
    rm -f "$folderName.7z"
fi

7z a -t7z $folderName.7z -m0=lzma2 -mx=9 -aoa $folderName/
rm -rf $folderName
