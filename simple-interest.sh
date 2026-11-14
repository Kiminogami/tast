#!/usr/bin/env bash

read -r -p "Enter the principal amount: " principal || exit 1
read -r -p "Enter the annual interest rate (%): " rate || exit 1
read -r -p "Enter the time period (years): " years || exit 1

number='^([0-9]+([.][0-9]+)?|[.][0-9]+)$'
if ! [[ $principal =~ $number && $rate =~ $number && $years =~ $number ]]; then
  printf 'Please enter a nonnegative number for each value.\n' >&2
  exit 1
fi

LC_ALL=C awk -v principal="$principal" -v rate="$rate" -v years="$years" '
  BEGIN {
    interest = principal * rate * years / 100
    printf "Simple interest: %.2f\n", interest
  }
'
