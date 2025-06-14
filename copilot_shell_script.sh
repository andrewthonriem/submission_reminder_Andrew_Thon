feature/setup
#!/bin/bash
=======
#!/bin/bash 
main

DIR=$(find . -type d -name "submission_reminder_*" | head -n 1)

if [ -z "$DIR" ]; then
  echo "Submission reminder directory not found."
  exit 1
fi

echo "Enter the new assignment name:"
read new_assignment

CONFIG_FILE="$DIR/config/config.env"
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/" "$CONFIG_FILE"

echo "Assignment name updated to \"$new_assignment\"."

cd "$DIR"
bash "./startup.sh"
feature/setup
=======

main
