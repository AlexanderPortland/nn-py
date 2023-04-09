#!/usr/bin/env bash

#/usr/local/bin/python3 /Users/alexanderportland/Desktop/coding/nn-py/housing2.py | grep Single
RED='\033[0;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
PURP='\033[1;35m'
NC='\033[0m'

#STR="$(/usr/local/bin/python3 housing2.py)"
#echo ${STR}
function write_stats(){
  #fours
    echo "running calculations"
    STR=$(/usr/local/bin/python3 housing2.py)
    echo "----ALL ROOMS----"
    TRIPS=$(echo "$STR" | grep Quad | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v -c Female)
    TRIPS="$(((${TRIPS} + 1) / 4))"
    TWOS=$(echo "$STR" | grep "4\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c Double)
    ONES=$(echo "$STR" | grep "4\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c Single)
    
    SUITES="$(((${TWOS} * 2 + ${ONES}) / 4))"

    echo -e "${BLUE}${TRIPS}${NC}/11 \t Quads found (${PURP}$((${TRIPS} * 4))${NC}/44 beds)"
    echo -e "${BLUE}${SUITES}${NC}/75 \t Suites of 4 found (${PURP}$((${SUITES} * 4))${NC}/300 beds)"

  #threes
  TRIPS=$(echo "$STR" | grep Triple | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v -c Female)
  TRIPS="$(((${TRIPS} + 1) / 3))"
  TWOS=$(echo "$STR" | grep "3\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c Double)
  ONES=$(echo "$STR" | grep "3\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c Single)
    
  SUITES="$(((${TWOS} * 2 + ${ONES}) / 3))"

  echo -e "${BLUE}${TRIPS}${NC}/29 \t Triples found (${PURP}$((${TRIPS} * 3))${NC}/87 beds)"
  echo -e "${BLUE}${SUITES}${NC}/43 \t Suites of 3 found (${PURP}$((${SUITES} * 3))${NC}/129 beds)"

  #twos
  TRIPS=$(echo "$STR" | grep Double | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c -v Suite)
  TRIPS="$(((${TRIPS}) / 2))"
  TWOS=$(echo "$STR" | grep "2\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -c -v Female)
    
  SUITES="$(((${TWOS}) / 2))"

    echo -e "${BLUE}${TRIPS}${NC}/420  Doubles found (${PURP}$((${TRIPS} * 2))${NC}/840 beds)"
    echo -e "${BLUE}${SUITES}${NC}/2 \t Suites of 2 found (${PURP}$((${SUITES} * 2))${NC}/4 beds)"
  
  #singles
  COUNT1=$(echo "$STR" | grep Single | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -v -c Suite )
    COUNT2=$(echo "$STR" | grep Single | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c GRAD )
    COUNT="$((${COUNT1} + ${COUNT2}))"

    echo -e "${PURP}${COUNT}${NC}/457  Singles found, ${PURP}${COUNT2}${NC}/264 in grad"
}

function write_stats_p(){
  #fours
    echo "running calculations"
    STR=$(/usr/local/bin/python3 housing2.py)
    echo "----ALL ROOMS----"
    TRIPS=$(echo "$STR" | grep Quad | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v -c Female)
    TRIPS="$(((${TRIPS} + 1) / 4))"
    TWOS=$(echo "$STR" | grep "4\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c Double)
    ONES=$(echo "$STR" | grep "4\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c Single)
    
    SUITES="$(((${TWOS} * 2 + ${ONES}) / 4))"

    echo -e "${BLUE}${TRIPS}${NC} Quads found (${PURP}$((${TRIPS} * 4))${NC} beds)"
    echo -e "${BLUE}${SUITES}${NC} Suites of 4 found (${PURP}$((${SUITES} * 4))${NC} beds)"

  #threes
  TRIPS=$(echo "$STR" | grep Triple | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v -c Female)
  TRIPS="$(((${TRIPS} + 1) / 3))"
  TWOS=$(echo "$STR" | grep "3\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c Double)
  ONES=$(echo "$STR" | grep "3\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c Single)
    
  SUITES="$(((${TWOS} * 2 + ${ONES}) / 3))"

  echo -e "${BLUE}${TRIPS}${NC} Triples found (${PURP}$((${TRIPS} * 3))${NC} beds)"
  echo -e "${BLUE}${SUITES}${NC} Suites of 3 found (${PURP}$((${SUITES} * 3))${NC} beds)"

  #twos
  TRIPS=$(echo "$STR" | grep Double | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c -v Suite)
  TRIPS="$(((${TRIPS}) / 2))"
  TWOS=$(echo "$STR" | grep "2\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -c -v Female)
    
  SUITES="$(((${TWOS}) / 2))"

    echo -e "${BLUE}${TRIPS}${NC} Doubles found (${PURP}$((${TRIPS} * 2))${NC} beds)"
    echo -e "${BLUE}${SUITES}${NC} Suites of 2 found (${PURP}$((${SUITES} * 2))${NC} beds)"
  
  #singles
  COUNT1=$(echo "$STR" | grep Single | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -v -c Suite )
    COUNT2=$(echo "$STR" | grep Single | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c GRAD )
    COUNT="$((${COUNT1} + ${COUNT2}))"

    echo -e "${PURP}${COUNT}${NC} Singles found, ${PURP}${COUNT2}${NC} in grad"
}

function write_quads(){
    echo "----FINDING Quads----"
    STR=$(/usr/local/bin/python3 housing2.py)
    echo "$STR" | grep Quad | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | nl
    echo "----FINDING Suites of 4----"
    echo "$STR" | grep "4\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | nl

    echo "total #"
    TRIPS=$(echo "$STR" | grep Quad | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v -c Female)
    TRIPS="$(((${TRIPS} + 1) / 4))"
    TWOS=$(echo "$STR" | grep "4\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c Double)
    ONES=$(echo "$STR" | grep "4\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c Single)
    
    SUITES="$(((${TWOS} * 2 + ${ONES}) / 4))"

    echo -e "${BLUE}${TRIPS}${NC} Quads found (${PURP}$((${TRIPS} * 4))${NC} beds)"
    echo -e "${BLUE}${SUITES}${NC} Suites of 4 found (${PURP}$((${SUITES} * 4))${NC} beds)"
}

function write_triples(){
    echo "----FINDING Triples----"
    STR=$(/usr/local/bin/python3 housing2.py)
    echo "$STR" | grep Triple | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | nl
    echo "----FINDING Suites of 3----"
    echo "$STR" | grep "3\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | nl

    echo "total #"
    TRIPS=$(echo "$STR" | grep Triple | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v -c Female)
    TRIPS="$(((${TRIPS} + 1) / 3))"
    TWOS=$(echo "$STR" | grep "3\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c Double)
    ONES=$(echo "$STR" | grep "3\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c Single)
    
    SUITES="$(((${TWOS} * 2 + ${ONES}) / 3))"

    echo -e "${BLUE}${TRIPS}${NC} Triples found (${PURP}$((${TRIPS} * 3))${NC} beds)"
    echo -e "${BLUE}${SUITES}${NC} Suites of 3 found (${PURP}$((${SUITES} * 3))${NC} beds)"
}

function write_doubles(){
    echo "writing doubles"
    echo "----FINDING Doubles----"
    STR=$(/usr/local/bin/python3 housing2.py)
    echo "$STR" | grep Double | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -v Suite | nl
    echo "----FINDING Suites of 2----"
    echo "$STR" | grep "2\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | nl

    echo "total #"
    TRIPS=$(echo "$STR" | grep Double | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c -v Suite)
    TRIPS="$(((${TRIPS} + 1) / 2))"
    TWOS=$(echo "$STR" | grep "2\.0" | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -c -v Female)
    
    SUITES="$(((${TWOS}) / 2))"

    echo -e "${BLUE}${TRIPS}${NC} Doubles found (${PURP}$((${TRIPS} * 2))${NC} beds)"
    echo -e "${BLUE}${SUITES}${NC} Suites of 2 found (${PURP}$((${SUITES} * 2))${NC} beds)"
}

function write_singles(){
    echo "writing singles"
    echo "----FINDING Singles----"
    STR=$(/usr/local/bin/python3 housing2.py)
    echo "$STR" | grep Single | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -v Suite  | nl #| grep -v "2\.0" | grep -v "3\.0" | grep -v "4\.0" | grep -v "5\.0"
    echo "----LOOKING in Grad----"
    echo "$STR" | grep Single | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep GRAD | nl
    
    echo "total #"
    COUNT1=$(echo "$STR" | grep Single | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -v -c Suite)
    COUNT2=$(echo "$STR" | grep Single | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c GRAD)
    #COUNT2=$("$STR" | grep Single | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c GRAD)
    #echo "$COUNT2"
    #HI=$(echo "$STR" | grep Single | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | grep -c GRAD)
    #echo "$HI"
    COUNT="$((${COUNT1} + ${COUNT2}))"

    echo -e "${PURP}${COUNT}${NC} Singles found, ${PURP}${COUNT2}${NC} in grad"
}

function get_valid(){
    /usr/local/bin/python3 housing2.py | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female | nl
}

while getopts 'riqtdsval' OPTION; do
  case "$OPTION" in
    i)
      #for valid info
        write_stats_p
        exit 0
        ;;
    r)
      #for valid info
        write_stats
        exit 0
        ;;
    q)
      #for valid quads
        write_quads
        exit 0
        ;;
    t)
    #for valid triples
      write_triples
      exit 0
      ;;
    d)
    #for valid doubles
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
      /usr/local/bin/python3 housing2.py | nl
      exit 0
      ;;
    l)
    #remove coloring for less
        RED=''
        GREEN=''
        BLUE=''
        NC=''
        echo "changing flags ${GREEN}${RED}${BLUE}${GREEN}"
      ;;
    ?)
      echo "script usage not right" >&2
      exit 1
      ;;
  esac
done