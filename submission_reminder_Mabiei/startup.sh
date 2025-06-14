#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$DIR/config/config.env"
source "$DIR/modules/functions.sh"
bash "$DIR/app/reminder.sh"
