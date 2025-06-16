## Table Of Content
- [App Overview](#app-overview)
- [App Structure](#app-structure)
- [How to Use the App](#how-to-use-the-app)
- [Builder](#builder)

  ## App Overview

The **Submission Reminder App** is a shell script-based application built for Linux environments. It helps notify students about pending assignment submissions by reading from a submissions file and displaying students who have not yet submitted.  

The application also allows updates new assignments via a copilot script and rechecking the pending submissions accordingly.

## App Structure

![image](https://github.com/user-attachments/assets/96d67b1f-ca64-44e9-85b4-b6987ffa1696)

## How to use the app
1. ***Clone the Repository***
   ```bash
   git clone https://github.com/andrewthonriem/submission_reminder_app_andrewthonriem.git
   cd submission_reminder_app_andrewthonriem
2. ***Run the Environment Setup Script***
   ```bash
   ./create_environment.sh
3. ***Start the Reminder Application***
  ```bash
cd submission_reminder_andrewthonriem/scripts
./startup.sh
```
4. ***Update Assignment Name via Copilot Script***
   ```bash
   ./copilot_shell_script.sh
  
***Enter the new assignment name.***

***The script updates config.env and reruns the reminder check.***

## Author
[Andrew Thon Riem Alier]










  
