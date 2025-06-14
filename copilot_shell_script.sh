#!/bin/bash

DIR=$(find . -type d -name "submission_reminder_*" | head -n 1)

if [ -z "$DIR" ]; then
  echo "Submission reminder directory not found."
  exit 1
fi

echo "Please enter your new assignment name:"
read new_assignment

CONFIG_FILE="$DIR/config/config.env"

sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=$new_assignment/" "$CONFIG_FILE"

echo "Assignment name updated to $new_assignment."

bash "$DIR/startup.sh"


