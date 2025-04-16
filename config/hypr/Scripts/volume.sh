#!/usr/bin/env bash

function get_volume {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{ print int($2 * 100) }'
}

function is_mute {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED
}

function send_notification {
    DIR=$(dirname "$0")
    volume=$(get_volume)

    if [ -z "$volume" ]; then
        volume=0
    fi

    if [ "$volume" -eq 0 ]; then
        icon_name="/usr/share/icons/Faba/48x48/notifications/notification-audio-volume-muted.svg"
    elif [ "$volume" -lt 10 ]; then
        icon_name="/usr/share/icons/Faba/48x48/notifications/notification-audio-volume-low.svg"
    elif [ "$volume" -lt 30 ]; then
        icon_name="/usr/share/icons/Faba/48x48/notifications/notification-audio-volume-low.svg"
    elif [ "$volume" -lt 70 ]; then
        icon_name="/usr/share/icons/Faba/48x48/notifications/notification-audio-volume-medium.svg"
    else
        icon_name="/usr/share/icons/Faba/48x48/notifications/notification-audio-volume-high.svg"
    fi

    bar=$(seq -s "─" $(($volume / 5)) | sed 's/[0-9]//g')

    $DIR/notify-send.sh "Volume $volume%" -i "$icon_name" -t 2000 -h int:value:"$volume" -h string:synchronous:"$bar" --replace=555
}

case $1 in
    up)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+
        send_notification
        ;;

    down)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-
        send_notification
        ;;

    mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        if is_mute ; then
            DIR=$(dirname "$0")
            $DIR/notify-send.sh -i "/usr/share/icons/Faba/48x48/notifications/notification-audio-volume-muted.svg" --replace=555 -u normal "Mute" -t 2000
        else
            send_notification
        fi
        ;;
esac

