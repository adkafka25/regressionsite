#!/bin/sh
VAR=$1
LCVAR=`echo ${VAR} | awk '{print tolower($0)}'`


echo "@Column(name=\"${VAR}_ID\")
@OneToOne
@JoinColumn(name=\"${VAR}_ID\")
public ${VAR} ${LCVAR};"
