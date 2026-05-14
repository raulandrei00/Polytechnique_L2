#!/bin/bash
# Compare ./csim output against ./csim-ref on all the standard test cases.

# Each entry: "args"
tests=(
  "-s 1 -E 1 -b 1 -t traces/yi2.trace"
  "-s 4 -E 2 -b 4 -t traces/yi.trace"
  "-s 2 -E 1 -b 4 -t traces/dave.trace"
  "-s 2 -E 1 -b 3 -t traces/trans.trace"
  "-s 2 -E 2 -b 3 -t traces/trans.trace"
  "-s 2 -E 4 -b 3 -t traces/trans.trace"
  "-s 5 -E 1 -b 5 -t traces/trans.trace"
  "-s 5 -E 1 -b 5 -t traces/long.trace"
)

pass=0
fail=0

for args in "${tests[@]}"; do
  mine=$(./csim     $args)
  ref=$(./csim-ref  $args)

  if [ "$mine" = "$ref" ]; then
    printf "PASS  %s\n      → %s\n" "$args" "$mine"
    pass=$((pass + 1))
  else
    printf "FAIL  %s\n      mine: %s\n      ref:  %s\n" "$args" "$mine" "$ref"
    fail=$((fail + 1))
  fi
done

echo
echo "Results: $pass passed, $fail failed"
[ $fail -eq 0 ]