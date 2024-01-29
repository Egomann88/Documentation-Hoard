#!/usr/bin/env bash

./test_mean_dynamic.sh && \
./test_median_dynamic.sh && \
./test_mode_dynamic.sh && \

(echo "tests passed") || (echo "tests failed"; exit 1)
