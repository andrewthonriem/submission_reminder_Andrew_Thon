#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

source "$DIR/config/config.env"
source "$DIR/modules/functions.sh"

echo "Assignment: $ASSIGNMENT"

days_remaining=$(( ( $(date -d "next Friday" +%s) - $(date +%s) ) / 86400 ))
echo "Days remaining to submit: $days_remaining"
echo "--------------------------------------------"

check_submissions "$ASSIGNMENT"
