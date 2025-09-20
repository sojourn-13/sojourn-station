#!/bin/bash
set -euo pipefail

tools/deploy.sh ci_test
# mkdir ci_test/config

#test config
cp tools/ci/ci_config.txt ci_test/config/config.txt

cd ci_test
 # Allow CI to override timeout (in seconds). Default to 15 minutes.
 TIMEOUT_SECONDS=${CI_RUN_TIMEOUT:-900}

 echo "Starting DreamDaemon with timeout ${TIMEOUT_SECONDS}s"

 # Start DreamDaemon in background and capture PID
 DreamDaemon sojourn-iskhod.dmb -close -trusted -verbose -params "log-directory=ci" &
 DD_PID=$!

 # Wait for test completion marker file or process exit, with timeout fallback
 SECONDS_WAITED=0
 INTERVAL=2
 CLEAN_RUN_FILE="data/logs/ci/clean_run.lk"
 echo "Waiting for tests to finish (looking for 'Success!' in ${CLEAN_RUN_FILE}) or for DreamDaemon to exit..."
 while kill -0 "$DD_PID" 2>/dev/null; do
 	# Check for success marker
 	if [ -f "$CLEAN_RUN_FILE" ]; then
 		if grep -q "Success!" "$CLEAN_RUN_FILE"; then
 			echo "Tests signalled success. Shutting down DreamDaemon (pid: $DD_PID) and exiting 0"
 			kill "$DD_PID" || true
 			sleep 1
 			kill -9 "$DD_PID" 2>/dev/null || true
 			cd ..
 			cat ci_test/data/logs/ci/clean_run.lk || true
 			exit 0
 		fi
 	fi

 	if [ $SECONDS_WAITED -ge $TIMEOUT_SECONDS ]; then
 		echo "DreamDaemon did not exit nor did tests finish within ${TIMEOUT_SECONDS}s; killing (pid: $DD_PID) and dumping last logs"
 		kill "$DD_PID" || true
 		sleep 1
 		kill -9 "$DD_PID" 2>/dev/null || true
 		echo "==== Last 200 lines of DreamDaemon log ===="
 		tail -n 200 "$CLEAN_RUN_FILE" || true
 		exit 124
 	fi
 	sleep $INTERVAL
 	SECONDS_WAITED=$((SECONDS_WAITED+INTERVAL))
done

echo "DreamDaemon process exited. Dumping test log (if any)"

cd ..
cat ci_test/data/logs/ci/clean_run.lk || true
