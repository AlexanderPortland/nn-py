#!/usr/bin/env bash

#/usr/local/bin/python3 /Users/alexanderportland/Desktop/coding/nn-py/housing2.py | grep Single

#filter out all impossible rooms
function filter_out() {
    $1 | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female
}

/usr/local/bin/python3 housing2.py | grep -v Wellness | grep -v "Sub Free" | grep -v Quiet | grep -v Female



echo "hello world"