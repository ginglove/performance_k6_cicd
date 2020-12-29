#!/bin/bash

#source ./Scripts/config.sh

whoami
groups
pwd
ls -la
k6 version

echo "$TIME"
echo "$K6_STAGES"
############ RUNNING TEST ##################
echo "=== Run K6 performance test==="
TESTCASE_DEMO="$PWD/Test_Cases/Demo_test.js"
#TESTCASE_DEMO="../Test_Cases/Demo_test.js"
k6 run --summary-trend-stats "min,avg,max,med,p(75),p(90),p(95),p(99),p(99.99)" -s "$1:$2" -s "$3:$4" -s "$5:$6" --summary-export ./result.csv $TESTCASE_DEMO
