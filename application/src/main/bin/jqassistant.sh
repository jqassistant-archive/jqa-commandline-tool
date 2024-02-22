#!/bin/sh
BIN_DIR=`dirname "$0"`

if [ "$JAVA_HOME" == "" ]; then
  JAVA_CMD="java"
else
  JAVA_CMD="$JAVA_HOME/bin/java"
fi

export JQASSISTANT_HOME=`cd "$BIN_DIR/.." && pwd -P`
# Required for Neo4j Plugin class loading in Neo4jServerFactory
export JQASSISTANT_JVM_ARGS="--add-opens java.base/jdk.internal.loader=ALL-UNNAMED"

exec "$JAVA_CMD" $JQASSISTANT_JVM_ARGS $JQASSISTANT_OPTS -jar "$JQASSISTANT_HOME/lib/${project.groupId}-${project.artifactId}-${project.version}.${project.packaging}" "$@"
