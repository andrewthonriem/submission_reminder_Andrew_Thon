
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
