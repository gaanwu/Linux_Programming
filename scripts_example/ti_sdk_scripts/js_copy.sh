DIR=$PWD
WIFI_PATH=wifi/
BT_PATH=bt/
BT_LIB_PATH=bt/lib
BT_BIN_PATH=bt/bin
WPA_PATH=wifi/wpa_supplicant
ATMEL_FW_PATH=wifi/Atmel_wifi_fw
TARGET_PATH=/media/js
EXAMPLE_APP_PATH=example-applications/
LINUX_SRC_PATH=board-support/linux-3.14.26-g2489c02

mkdir -p ${DIR}/deploy/
mkdir -p ${DIR}/deploy/${BT_PATH}
mkdir -p ${DIR}/deploy/${BT_LIB_PATH}
mkdir -p ${DIR}/deploy/${BT_BIN_PATH}
mkdir -p ${DIR}/deploy/${WIFI_PATH}
mkdir -p ${DIR}/deploy/${WPA_PATH}
mkdir -p ${DIR}/deploy/${ATMEL_FW_PATH}

#copy kernel image
cp ./${LINUX_SRC_PATH}/arch/arm/boot/zImage ${DIR}/deploy/
rm ${TARGET_PATH}/rootfs/boot/vmlinuz-3.8.13-bone63
cp ./${LINUX_SRC_PATH}/arch/arm/boot/zImage ${TARGET_PATH}/rootfs/boot/vmlinuz-3.8.13-bone63

#copy beaglebone dts
cp  ./${LINUX_SRC_PATH}/arch/arm/boot/dts/am335x-boneblack.dtb ${DIR}/deploy/
cp  ./${LINUX_SRC_PATH}/arch/arm/boot/dts/am335x-boneblack.dtb ${TARGET_PATH}/rootfs/boot/dtbs/3.8.13-bone63/am335x-boneblack.dtb

#copy wifi driver ko file
cp ./${LINUX_SRC_PATH}/drivers/net/wireless/atmel/wilc1000/wilc1000.ko ${DIR}/deploy/${WIFI_PATH}
rm ${TARGET_PATH}/rootfs/wilc1000.ko
cp ./${LINUX_SRC_PATH}/drivers/net/wireless/atmel/wilc1000/wilc1000.ko ${TARGET_PATH}/rootfs/

#copy wifi firmware
mkdir -p ${TARGET_PATH}/rootfs/lib/firmware/atmel/
cp ${DIR}/deploy/${ATMEL_FW_PATH}/*.bin ${TARGET_PATH}/rootfs/lib/firmware/atmel/

#copy wpa_supplicant conf file
mkdir ${TARGET_PATH}/rootfs/etc/wpa_supplicant/
cp ${DIR}/deploy/${WPA_PATH}/*.conf ${TARGET_PATH}/rootfs/etc/wpa_supplicant/

#copy wpa_supplicant binary file
rm ${TARGET_PATH}/rootfs/sbin/wpa_*
cp ${EXAMPLE_APP_PATH}/wpa_supplicant/wpa_supplicant/wpa_supplicant ${DIR}/deploy/${WPA_PATH}/bin/
cp ${EXAMPLE_APP_PATH}/wpa_supplicant/wpa_supplicant/wpa_passphrase ${DIR}/deploy/${WPA_PATH}/bin/
cp ${EXAMPLE_APP_PATH}/wpa_supplicant/wpa_supplicant/wpa_cli ${DIR}/deploy/${WPA_PATH}/bin/
cp ${DIR}/deploy/${WPA_PATH}/bin/wpa_* ${TARGET_PATH}/rootfs/sbin/

#copy wifi connect scripts
cp ${DIR}/deploy/${WIFI_PATH}/*.sh ${TARGET_PATH}/rootfs/

#copy bt shared libraries
cp ${DIR}/deploy/${BT_LIB_PATH}/*.so ${TARGET_PATH}/rootfs/usr/lib/

#copy bt example binary files
cp ${DIR}/deploy/${BT_BIN_PATH}/* ${TARGET_PATH}/rootfs/usr/bin/
