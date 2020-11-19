#!/bin/bash
/declare/Veracode.OSS.Declare configure -f $1 2>&1 | tee declare.log
if grep -q FATAL declare.log; then
  exit 1
fi