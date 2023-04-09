#!/usr/bin/env bash

#/usr/local/bin/python3 /Users/alexanderportland/Desktop/coding/nn-py/housing2.py | grep Single
RED='\033[0;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
NC='\033[0m'

#STR="$(/usr/local/bin/python3 housing2.py)"
#echo ${STR}
echo "----FINDING Triples----"
/usr/local/bin/python3 housing2.py | grep Triple | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female
echo "----FINDING Suites of 3----"
/usr/local/bin/python3 housing2.py | grep "3\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female

#TRIPS=/usr/local/bin/python3 housing2.py | grep Triple | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v -c Female
#TRIPS=TRIPS/3
#SUITES=/usr/local/bin/python3 housing2.py | grep "3\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v -c Female
echo "total #"
TRIPS="$(($(/usr/local/bin/python3 housing2.py | grep Triple | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v -c Female)+1))"
TWOS="$(/usr/local/bin/python3 housing2.py | grep "3\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c Double)"
echo "twos"
echo /usr/local/bin/python3 housing2.py | grep "3\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep Double
ONES="$(/usr/local/bin/python3 housing2.py | grep "3\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c Single)"
echo "ones"
echo /usr/local/bin/python3 housing2.py | grep "3\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep Single
SUITES="$(((${TWOS} * 2 + ${ONES}) / 3))"

echo -e "${BLUE}${TRIPS}${NC} Triples found"
echo -e "${BLUE}${SUITES}${NC} Suites of 3 found"