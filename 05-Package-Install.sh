#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR : Please run the script with ROOT access"
    exit 1
else 
    echo "You are running the script with ROOT access"
fi

    VALIDATE(){
        if [ $1 -eq 0 ]
        then
            echo "INSTALLING $2 is ...... SUCCESS"
        else 
            echo "INSTALLING $2 is ...... FAILURE"
            exit 1
        fi
    }


#Installing MySQL

dnf list installed mysql
    if [ $? -ne 0 ]
    then
        echo "MYSQL is not installed......going to install now"
        dnf install mysql-server -y
        VALIDATE $? "MySQL"
    else
        echo "MYSQL is already INSTALLED....... Nothing to do"
fi


#Installing Nginx

dnf list installed nginx
    if [ $? -ne 0 ]
    then
        echo "Nginx is not installed......going to install now"
        dnf install nginx -y
        VALIDATE $? "Nginx"
    else
        echo "Nginx is already INSTALLED....... Nothing to do"
fi


#Installing Python3

dnf list installed python3
    if [ $? -ne 0 ]
    then
        echo "python3 is not installed......going to install now"
        dnf install python3 -y
        VALIDATE $? "python3"
    else
        echo "python3 is already INSTALLED....... Nothing to do"
fi

