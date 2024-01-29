#!/usr/bin/env bash

for i in {1..10}; do
    echo $RANDOM >> random_mean_test_data.txt
done
expected=$(awk -f mean.awk random_mean_test_data.txt)

actual=$(dotnet run --project Average.Demo mean random_mean_test_data.txt)

rm random_mean_test_data.txt

if [[ "$actual" != "$expected" ]]; then
    exit 1
fi
