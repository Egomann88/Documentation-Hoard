#!/usr/bin/env bash

cleanup() {
    rm -f random_mode_test_data.txt
    rm -f actual.txt
    rm -f expected.txt
}
trap cleanup EXIT

for i in {1..20}; do
    echo $(($RANDOM % 10)) >> random_mode_test_data.txt
done
awk -f mode.awk random_mode_test_data.txt > expected.txt

dotnet run --project Average.Demo mode random_mode_test_data.txt > actual.txt
sed -i 's/\r\n/\n/' actual.txt

cmp -s actual.txt expected.txt || exit 1
