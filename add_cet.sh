#! /bin/bash

awk -i inplace '
BEGIN {FS="|"}
($1 ~ /EDT/) && ! ($2 ~ /CET/) {timetable = 1; sub($1, $1 "| CET ")}
/^ *$/ {timetable = 0}
/^[-|]+$/ && timetable == 1 {sub("-", "----|--")}
$1 ~ /[0-9][0-9]:[0-9][0-9]/ && timetable == 1 {
    "TZ=CET date -d \"2020-05-19 "$1" EDT\" +\""$1"| %R \"" | getline d ;
    sub($1, d);
}
{print}
' index.md
