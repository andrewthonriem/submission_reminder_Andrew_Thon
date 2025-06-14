#!/bin/bash

echo "Please enter your name:"
read username


Dir="submission_reminder_${username}"
mkdir -p "$Dir"/{app,modules,assets,config}

cat <<EOL > "$Dir/config/config.env"
USERNAME=${username}
ASSIGNMENT=Assignment1
EOL


cat <<'EOL' > "$Dir/modules/functions.sh"

check_submissions() {
    local assignment="$1"
    local submissions_file="$(dirname "$0")/../assets/submissions.txt"

    while IFS=',' read -r name assign status
    do

        if [[ "$assign" == "$assignment" && "$status" == "not submitted" ]]; then
            echo "$name has not submitted $assign"
        fi
    done < "$submissions_file"
}
EOL

cat <<'EOL' > "$Dir/app/reminder.sh"
#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

source "$DIR/config/config.env"
source "$DIR/modules/functions.sh"

echo "Assignment: $ASSIGNMENT"

days_remaining=$(( ( $(date -d "next Friday" +%s) - $(date +%s) ) / 86400 ))
echo "Days remaining to submit: $days_remaining"
echo "--------------------------------------------"

check_submissions "$ASSIGNMENT"
EOL

chmod +x "$Dir/app/reminder.sh"


cat <<EOL > "$Dir/assets/submissions.txt"

	student,assignment,submission status
	Chinemerem,Shell Navigation,not submitted
	Chiagoziem,Git,submitted
	Divine,Shell Navigation,not submitted
	Anissa,Shell Basics,submitted
	Methode,Linux,not submitted
	Andrew,Shell Navigation,not submitted
EOL

echo "Environment created successfully in $Dir"

