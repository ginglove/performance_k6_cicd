source ./config.sh

whoami
groups
pwd
ls -la
k6 version

echo "$TIME"

############ RUNNING TEST ##################
echo "=== Run K6 performance test==="
TESTCASE_DEMO="$PWD/Test_Cases/Demo_test.js"
k6 run $TESTCASE_DEMO -s "$STAGE_1:$USER_1" -s "$STAGE_2:$USER_2" -s "$STAGE3_USER_3"