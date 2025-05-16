#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR : Please run the script with ROOT access"
    exit 1
else 
    echo "You are running the script with ROOT access"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "MYSQL is not installed......going to install now"
    dnf install mysql-server -y
    if [ $? -eq 0 ]
    then
        echo "INSTALLING MYSQL is ...... SUCCESS"
    else
        echo "INSTALLING MYSQL is ...... FAILURE"
        exit 1
    fi
else
    echo "MYSQL is already INSTALLED....... Nothing to do"
fi