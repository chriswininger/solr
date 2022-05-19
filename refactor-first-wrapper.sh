#!/bin/bash

JAVA=/usr/lib/jvm/java-11-openjdk-amd64/bin/java

dir=$1
commit=$2
cmd=$3

function tellName() {
  return "Refactor First"
  return 0
}

function tellApplicable() {
  echo "true"
  return 0
}

function tellVersion() {
  echo "4"
  return 0
}

function run() {
  ./gradlew -I muse-compdb.gradle clean assemble -x test  
  echo "{}"
}

if [[ "$cmd" = "name" ]] ; then
  tellName
fi

if [[ "$cmd" = "run" ]] ; then
        run
fi
if [[ "$cmd" = "applicable" ]] ; then
        tellApplicable
fi
if [[ "$cmd" = "version" ]] ; then
        tellVersion
fi

