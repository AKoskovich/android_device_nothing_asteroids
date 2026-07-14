#!/vendor/bin/sh

pbid=$(getprop ro.boot.pbid)
sku=$(getprop ro.boot.hardware.sku)

# NFC chip driver may probe after vendor.all.modules.ready fires; wait for sysfs node
i=0
while [ ! -f /sys/bus/i2c/devices/1-0008/hw_version ] && [ $i -lt 20 ]; do
    sleep 0.5
    i=$((i + 1))
done

if [ -f /sys/bus/i2c/devices/1-0008/hw_version ]; then
    hwid=$(cat /sys/bus/i2c/devices/1-0008/hw_version)

    case "$hwid" in
        "ST21")
            case "$pbid" in
                "Base")
                    setprop persist.vendor.nfc.config_file_name "libnfc-hal-st21-BASE.conf"
                    ;;
                "Pro")
                    setprop persist.vendor.nfc.config_file_name "libnfc-hal-st21-PRO.conf"
                    ;;
            esac

            setprop persist.vendor.nfc_model "ST21"
            ;;
        "ST54")
            if [ "$sku" = "JPN" ]; then
                setprop persist.vendor.nfc.config_file_name "libnfc-hal-st54j-JPN.conf"
            else
                setprop persist.vendor.nfc.config_file_name "libnfc-hal-st54j-PRO.conf"
            fi

            setprop persist.vendor.nfc_model "ST54"
            ;;
    esac
fi
