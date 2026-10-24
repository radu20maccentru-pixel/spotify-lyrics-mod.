#!/bin/sh
# Minimal Gradle wrapper launcher. If gradle-wrapper.jar is missing it is downloaded once.
DIR="$(cd "$(dirname "$0")" && pwd)"
JAR="$DIR/gradle/wrapper/gradle-wrapper.jar"
if [ ! -f "$JAR" ]; then
  echo "gradle-wrapper.jar not found, downloading it once..."
  URL="https://raw.githubusercontent.com/gradle/gradle/v9.2.1/gradle/wrapper/gradle-wrapper.jar"
  if command -v curl >/dev/null 2>&1; then curl -fL -o "$JAR" "$URL"
  elif command -v wget >/dev/null 2>&1; then wget -O "$JAR" "$URL"
  else echo "Need curl or wget. Or run: gradle wrapper --gradle-version 9.2.1"; exit 1; fi || {
    rm -f "$JAR"
    echo "Download failed. Install Gradle and run: gradle wrapper --gradle-version 9.2.1"; exit 1; }
fi
if [ -n "$JAVA_HOME" ] && [ -x "$JAVA_HOME/bin/java" ]; then JAVACMD="$JAVA_HOME/bin/java"; else JAVACMD=java; fi
exec "$JAVACMD" -Dorg.gradle.appname=gradlew -classpath "$JAR" org.gradle.wrapper.GradleWrapperMain "$@"
