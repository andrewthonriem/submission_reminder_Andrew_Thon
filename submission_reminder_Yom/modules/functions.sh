check_submissions() {
    while IFS=',' read -r name assignment status
    do
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "pending" ]]; then
            echo "$name has not submitted $assignment"
        fi
    done < "$(dirname "$0")/../assets/submissions.txt"
}
