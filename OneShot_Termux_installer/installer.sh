#!/data/data/com.termux/files/usr/bin/bash
architecture=""
case $(uname -m) in
    armv7*)   architecture="arm" ;;
    aarch64)  architecture="aarch64" ;;
    *)   printf "The architecture of your CPU is not supported. Please build required binaries from the sources: https://github.com/shubham-indalkar/OneShot#termux"; exit
esac

pkg install -y root-repo 
pkg install -y wget tsu python wpa-supplicant iw

# Create OneShot folder and move into it
mkdir -p OneShot
cd OneShot

# keep upstream
wget https://raw.githubusercontent.com/shubham-indalkar/OneShot/master/OneShot_Termux_installer/binaries/$architecture/pixiewps -O $PREFIX/bin/pixiewps
chmod +x $PREFIX/bin/pixiewps

wget https://raw.githubusercontent.com/shubham-indalkar/OneShot/master/oneshot.py
# keep upstream
wget https://raw.githubusercontent.com/shubham-indalkar/OneShot/master/vulnwsc.txt

chmod +x ./oneshot.py

printf "########################################\n# All done! Now you can run OneShot with\n#        sudo python OneShot/oneshot.py -i wlan0 --iface-down -K\n########################################\n"
