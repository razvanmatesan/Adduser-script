#!/bin/bash

#list of user to add
user_list="users.txt"

#read of every user
while IFS=, read -r username password:
 do
    #Verify if name and password are empty
    if [ -z "$username" ] || [ -z "$password" ]; then
       echo "Name and passwrd : $username, $password"
       continue
    fi
    if id "$username" & ./dev/null; then
       echo "User $username already exists.";
    else
       sudo useradd "$username"
       echo "$username:$password" | sudo chpasswd
       echo "user $username was added"; 
    fi
 done < "$user_list" 

echo "Process completed"

