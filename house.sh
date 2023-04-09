#!/usr/bin/env bash

#/usr/local/bin/python3 /Users/alexanderportland/Desktop/coding/nn-py/housing2.py | grep Single
RED='\033[0;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
NC='\033[0m'

#STR="$(/usr/local/bin/python3 housing2.py)"
#echo ${STR}
function write_triples(){
    echo "----FINDING Triples----"
    /usr/local/bin/python3 housing2.py | grep Triple | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female
    echo "----FINDING Suites of 3----"
    /usr/local/bin/python3 housing2.py | grep "3\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female

    echo "total #"
    TRIPS="$(($(/usr/local/bin/python3 housing2.py | grep Triple | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v -c Female)+1))"
    SUITES="$(((${TRIPS}) / 3))"
    TWOS="$(/usr/local/bin/python3 housing2.py | grep "3\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c Double)"
    ONES="$(/usr/local/bin/python3 housing2.py | grep "3\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c Single)"
    
    SUITES="$(((${TWOS} + ${ONES}) / 3))"

    echo -e "${BLUE}${TRIPS}${NC} Triples found"
    echo -e "${BLUE}${SUITES}${NC} Suites of 3 found"
}

function write_doubles(){
    echo "writing doubles"
    echo "----FINDING Doubles----"
    /usr/local/bin/python3 housing2.py | grep Double | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -v Suite
    echo "----FINDING Suites of 2----"
    /usr/local/bin/python3 housing2.py | grep "2\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female

    echo "total #"
    TRIPS="$(($(/usr/local/bin/python3 housing2.py | grep Double | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c -v Suite)+1))"
    SUITES="$(((${TRIPS}) / 3))"
    TWOS="$(/usr/local/bin/python3 housing2.py | grep "2\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -c -v Female)"
    
    SUITES="$(((${TWOS}) / 3))"

    echo -e "${BLUE}${TRIPS}${NC} Doubles found"
    echo -e "${BLUE}${SUITES}${NC} Suites of 2 found"
}

function write_singles(){
    echo "writing singles"
    echo "----FINDING Singles----"
    /usr/local/bin/python3 housing2.py | grep Single | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -v Suite #| grep -v "2\.0" | grep -v "3\.0" | grep -v "4\.0" | grep -v "5\.0"
    echo "----LOOKING in Grad----"
    /usr/local/bin/python3 housing2.py | grep Single | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep GRAD
    
    echo "total #"
    COUNT1="$(($(/usr/local/bin/python3 housing2.py | grep Single | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -v -c Suite )))"
    COUNT2="$(($(/usr/local/bin/python3 housing2.py | grep Single | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c GRAD )))"
    COUNT="$((${COUNT1} + ${COUNT2}))"

    echo -e "${BLUE}${COUNT}${NC} Singles found, ${BLUE}${COUNT2}${NC} in grad"
}

function get_valid(){
    /usr/local/bin/python3 housing2.py | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female
}

while getopts 'tdsva' OPTION; do
  case "$OPTION" in
    t)
    #for valid triples
      write_triples
      exit 0
      ;;
    d)
    #for valid triples
      write_doubles
      exit 0
      ;;
    s)
    #for valid singles
      write_singles
      exit 0
      ;;
    v)
    #for all valid rooms
      get_valid
      exit 0
      ;;
    a)
      /usr/local/bin/python3 housing2.py
      exit 0
      ;;
    ?)
      echo "script usage not right" >&2
      exit 1
      ;;
  esac
done