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


#Installing NodeJS

dnf list installed nodejs:20
if [ $? -ne 0 ]
then
    echo "nodejs is not installed......going to install now"
    dnf module disable nodejs -y
    dnf module enable nodejs:20 -y
    dnf install nginx -y
   VALIDATE $? "nodejs"
else
    echo "nodejs is already INSTALLED....... Nothing to do"
fi