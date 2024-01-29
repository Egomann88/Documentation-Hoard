#!/usr/bin/env bash

for i in {1..9}; do
    echo $RANDOM >> random_median_test_data.txt
done
expected=$(sort -n random_median_test_data.txt | awk 'NR == 5 {print $1}')

actual=$(dotnet run --project Average.Demo median random_median_test_data.txt)

rm random_median_test_data.txt

if [[ "$actual" != "$expected" ]]; then
    exit 1
fi
