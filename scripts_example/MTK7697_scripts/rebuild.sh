#sh build.sh mt7697_hdk httpd
PROJECT=$1
#sh build.sh mt7697_hdk -o=MTK_DEBUG_LEVEL=error ${PROJECT}
sh build.sh clean
sh build.sh mt7697_hdk ${PROJECT}
sh js_copy.sh ${PROJECT}
