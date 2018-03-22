#sh build.sh mt7697_hdk -o=MTK_DEBUG_LEVEL=error httpd
OUTPUT=out/mt7697_hdk/
PROJECT=$1
PWD=${PWD}
echo "${PWD}"
echo "copy ${PROJECT} to Server 172.16.164.254"
echo "========================================"
scp ${PWD}/${OUTPUT}/${PROJECT}/*.bin ${PWD}/${OUTPUT}/${PROJECT}/*.hex ${PWD}/${OUTPUT}/${PROJECT}/*.ini js@172.16.164.254:/ShareSamba/js/Projects/MTK/MT7697/Builded_imgs/
echo "==================================DONE=="

