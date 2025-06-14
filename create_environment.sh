#!/bin/bash

echo "Please enter your name:"
read username


Dir="submission_reminder_${username}"
mkdir -p "$Dir"/{app,modules,assets,config}

cat <<'EOL' > "$Dir/app/reminder.sh"
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file

EOL

cat <<'EOL' > "$Dir/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}

EOL

cat <<EOL > "$Dir/assets/submissions.txt"

        student, assignment, submission status
        Chinemerem, Shell Navigation, not submitted
        Chiagoziem, Git, submitted
        Divine, Shell Navigation, not submitted
        Anissa, Shell Basics, submitted
        Methode, Linux, not submitted
        Andrew, Shell Navigation, Not submitted
        Bior, English assignment, submitted
        Annie, Git, not submitted
        Adit, Shell Basics, submitted

EOL

cat <<EOL > "$Dir/config/config.env"

# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2

EOL

cat <<'EOL' > "$Dir/startup.sh"
#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
bash "$DIR/app/reminder.sh"

EOL

chmod +x "$Dir/app/reminder.sh" "$Dir/modules/functions.sh" "$Dir/startup.sh"
chmod +x "$Dir/app/reminder.sh"

echo "Environment created successfully in $Dir"
