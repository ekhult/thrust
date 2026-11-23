#!/bin/bash
# Runs the port's probe on the original's results and lists mismatches: level x y angle orig camX camRow port
cd "$(dirname "$0")"
cat orig_[0-9].txt pod_[0-9].txt 2>/dev/null | sed 's/ #.*//' > all_orig.txt
../../ThrustMac/.build/debug/Thrust --probe all_orig.txt cmp_all.txt
awk '{ n++; if ($(NF-3) != $NF) { bad++; print } } END { printf "%d probes, %d mismatches\n", n, bad > "/dev/stderr" }' cmp_all.txt > mismatches.txt
awk '{ if ($(NF-3) == 1) h++ } END { printf "original crashes: %d\n", h > "/dev/stderr" }' cmp_all.txt
