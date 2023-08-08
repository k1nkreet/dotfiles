#!/bin/sh

fatal() {
    >&2 echo "$1" && exit 1
}

bluetoothctl_exec() {
    bluetoothctl -- $1
}

device="${1:-WH-1000XM4}"
sudo systemctl restart bluetooth.service && {
    bluetoothctl_exec "power on" || fatal "bluetoothctl error"
    mac=$(bluetoothctl_exec "devices" | grep $device | cut -d' ' -f2 || fatal "$device is unknown")
    bluetoothctl_exec "connect $mac" || fatal "could not connect $mac"
}
