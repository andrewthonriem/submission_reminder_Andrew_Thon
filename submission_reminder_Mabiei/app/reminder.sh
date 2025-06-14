#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

source "$DIR/config/config.env"
source "$DIR/modules/functions.sh"

echo "Assignment: $ASSIGNMENT"
echo -n "Days remaining to submit: "
echo $(( ( $(date -d "next Friday" +%s) - $(date +%s) ) / 86400 ))
echo "--------------------------------------------"

check_submissions
