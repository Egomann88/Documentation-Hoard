#!/usr/bin/env bash

set -euo pipefail
cat << EOF > median_test_data.txt
1
2
4
5
EOF
expected=3

actual=$(dotnet run --project Average.Demo median median_test_data.txt)

rm median_test_data.txt

if [[ "$actual" != "$expected" ]]; then
	exit 1
fi
