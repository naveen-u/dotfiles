if systemctl --user is-active dbus.socket &>/dev/null; then
    export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"
fi

if [[ $(tty) = /dev/tty1 ]]; then
    exec ~/.local/bin/start-sway --unsupported-gpu
elif [[ $(tty) = /dev/tty2 ]]; then
    exec ~/.local/bin/start-plasma
fi
