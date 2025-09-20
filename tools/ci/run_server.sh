#!/bin/bash
set -euo pipefail

tools/deploy.sh ci_test
# mkdir ci_test/config

# test config
cp tools/ci/ci_config.txt ci_test/config/config.txt

# Configurable timeout (seconds). Default: 15 minutes
TIMEOUT_SECONDS=${CI_RUN_TIMEOUT:-900}
INTERVAL=2

cd ci_test

echo "Starting DreamDaemon (background). Will watch logs for 'Initializations complete' and exit when seen. Timeout: ${TIMEOUT_SECONDS}s"

# Start DreamDaemon in background
DreamDaemon sojourn-iskhod.dmb -close -trusted -verbose -params "log-directory=ci" &
DD_PID=$!

# Ensure background DD is killed if this script is terminated
trap 'kill "${DD_PID}" 2>/dev/null || true' EXIT

CLEAN_LOG_DIR="data/logs/ci"
SECONDS_WAITED=0

echo "Waiting for initialization marker in ${CLEAN_LOG_DIR}..."
while kill -0 "$DD_PID" 2>/dev/null; do
	# look for either phrasing; case-insensitive
	if [ -d "$CLEAN_LOG_DIR" ]; then
		if grep -i -R -m1 -E "Initializations complete|Initializations completed" "$CLEAN_LOG_DIR" >/dev/null 2>&1; then
			echo "Initialization marker detected in logs. Shutting down DreamDaemon (pid: $DD_PID) and exiting 0."
			kill "$DD_PID" || true
			sleep 1
			kill -9 "$DD_PID" 2>/dev/null || true
			wait "$DD_PID" 2>/dev/null || true
			cd ..
			echo "===== Initialization log (tail) ====="
			tail -n 200 "$CLEAN_LOG_DIR"/* || true
			exit 0
		fi
	fi

	if [ $SECONDS_WAITED -ge $TIMEOUT_SECONDS ]; then
		echo "Timeout (${TIMEOUT_SECONDS}s) reached without seeing initialization marker. Killing DreamDaemon (pid: $DD_PID) and dumping logs."
		kill "$DD_PID" || true
		sleep 1
		kill -9 "$DD_PID" 2>/dev/null || true
		wait "$DD_PID" 2>/dev/null || true
		cd ..
		echo "==== Last 200 lines of CI logs ===="
		tail -n 200 "$CLEAN_LOG_DIR"/* || true
		exit 124
	fi

	sleep $INTERVAL
	SECONDS_WAITED=$((SECONDS_WAITED+INTERVAL))
done

echo "DreamDaemon exited before initialization marker was observed. Dumping logs (if any) and exiting."
cd ..
cat ci_test/data/logs/ci/clean_run.lk || true
