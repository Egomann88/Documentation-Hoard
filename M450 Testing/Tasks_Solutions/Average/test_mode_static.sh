#!/usr/bin/env bash

set -euo pipefail
cat << EOF > mode_test_data.txt
23
25
23
1354
1
-142
-142
EOF
expected=$'23\n-142'

actual=$(dotnet run --project Average.Demo mode mode_test_data.txt)
actual_clean="${actual//$'\r'/}"

rm mode_test_data.txt

if [[ "$actual_clean" != "$expected" ]]; then
	exit 1
fi
