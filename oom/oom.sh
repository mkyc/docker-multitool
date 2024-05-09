#!/usr/bin/env sh
TIMESTAMP=$(date +%Y%m%d%H%M%S)


JVM_OPTS="-XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/app/dumps/java_pid${TIMESTAMP}.hprof"
java $JVM_OPTS -cp /app OOMCrash
