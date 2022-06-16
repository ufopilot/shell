#!/bin/bash
func1(){ echo "${FUNCNAME[0]} executed with arg1: $1"; }
func2(){ echo "${FUNCNAME[0]} executed with args: $@"; }
func3(){ echo "${FUNCNAME[0]} executed with arg2: $2"; }
[[ $(type -t "$1") == "function" ]] && 
"$@" \
||
{ echo "error: '$1' undefined function"; exit 1; }
