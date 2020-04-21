#! /bin/bash

sed -i '
/ *EDT *| *CET/,/^ *$/ {
    s/CET *//
    s/\([^|]*|\)[^|]*|/\1/
}' index.md
