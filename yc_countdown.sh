#!/bin/bash

TARGET_DATE="2024-05-29 12:30:00"
TARGET_DATE_EPOCH=$(date -j -f "%Y-%m-%d %H:%M:%S" "$TARGET_DATE" +"%s")

print_header() {
    clear
    WIDTH=$(tput cols)
    echo "$(figlet -w $WIDTH -f standard 'YC')"
    echo "$(figlet -w $WIDTH -f standard 'Decision Deadline S24')"
    echo "###################################################################################################"
}

countdown() {
    while [ $SECONDS_LEFT -gt 0 ]; do
        CURRENT_DATE_EPOCH=$(date +%s)
        SECONDS_LEFT=$((TARGET_DATE_EPOCH - CURRENT_DATE_EPOCH))
        
        DAYS=$((SECONDS_LEFT / 86400))
        HOURS=$(( (SECONDS_LEFT % 86400) / 3600 ))
        MINUTES=$(( (SECONDS_LEFT % 3600) / 60 ))
        SECONDS=$(( SECONDS_LEFT % 60 ))

        COUNTDOWN_TEXT=$(printf "%02d days %02d hours %02d minutes %02d seconds left" $DAYS $HOURS $MINUTES $SECONDS)
        
        clear
        print_header
        WIDTH=$(tput cols)
        echo "$(figlet -w $WIDTH -f standard "$COUNTDOWN_TEXT")"
        sleep 1
    done

    echo "$(figlet -w $WIDTH -f standard 'See you in SF!')"
}

SECONDS_LEFT=$((TARGET_DATE_EPOCH - $(date +%s)))

countdown
