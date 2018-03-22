make clean
cp ./js_defconfig board-support/linux-3.14.26-g2489c02/.config
make
sudo make install
