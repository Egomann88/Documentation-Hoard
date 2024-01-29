#!/usr/bin/env bash

./test_mean_static.sh && \
./test_median_static.sh && \
./test_mode_static.sh && \

(echo "tests passed") || (echo "tests failed"; exit 1)
