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
  ./gradlew --no-daemon -i -I muse-compdb.gradle -x buildLocalAntoraSite clean assemble -x test >> gradle_dump.txt 2>&1
  exit_code="$(echo $?)"
  logs="$(cat ./gradle_dump.txt)"
  logs_trunc="$(echo $logs | tail -n300)"
  logs_escaped="$(echo $logs_trunc | jq -aRs .)"
  
  echo "{ \"refactor-first\": { \"errors\": [\"$exit_code\",$logs_escaped] } }"
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

