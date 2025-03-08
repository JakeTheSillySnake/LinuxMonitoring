#!/bin/bash

GB=1000000000
RAM_TOTAL=$(free -b | grep "Mem" | awk '{ print $2 }')
RAM_TOTAL_CALC=$(bc <<< "scale=3; $RAM_TOTAL / $GB")
RAM_USED=$(free -b | grep "Mem" | awk '{ print $3 }')
RAM_USED_CALC=$(bc <<< "scale=3; $RAM_USED / $GB")
RAM_FREE=$(free -b | grep "Mem" | awk '{ print $4 }')
RAM_FREE_CALC=$(bc <<< "scale=3; $RAM_FREE / $GB")

MB=1000000
ROOT_TOTAL=$(df -B1 / | grep "/" | awk '{ print $2 }')
ROOT_TOTAL_CALC=$(bc <<< "scale=2; $ROOT_TOTAL / $MB")
ROOT_USED=$(df -B1 / | grep "/" | awk '{ print $3 }')
ROOT_USED_CALC=$(bc <<< "scale=2; $ROOT_USED / $MB")
ROOT_FREE=$(df -B1 / | grep "/" | awk '{ print $4 }')
ROOT_FREE_CALC=$(bc <<< "scale=2; $ROOT_FREE / $MB")