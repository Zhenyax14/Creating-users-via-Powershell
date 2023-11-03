# Creating-users-via-Powershell
Making scripts with powershell to manage users and groups in Windows, with .csv given. And there are 3 options

First, to execute the file - you´ll have to change the execution policy of your powershell. 
You can set it right with cmdlet: "set-ExecutionPolicy -ExecutionPolicy Unrestricted

Now just enter the powershell, run the script and check if the user is created. If you need to create a list of custom users - just change the .csv file´s content with your own.

If you want to delete all users and groups created - run "borrarUsuarios.ps1" script, giving it same .csv
