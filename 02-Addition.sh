#!/bin/bash

NUMBER1=$1
NUMBER2=$2

TIMESTAMP=$(date)
    echo "(Script executed at : $TIMESTAMP)"
SUM=$(($NUMBER1+$NUMBER2))
    echo "(Sum of Number1 and Number2 : $SUM)"