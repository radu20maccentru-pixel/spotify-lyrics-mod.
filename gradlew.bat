@echo off
rem Minimal Gradle wrapper launcher. Downloads gradle-wrapper.jar once if missing.
set DIR=%~dp0
set JAR=%DIR%gradle\wrapper\gradle-wrapper.jar
if not exist "%JAR%" (
  echo gradle-wrapper.jar not found, downloading it once...
  powershell -NoProfile -Command "[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -UseBasicParsing -Uri 'https://raw.githubusercontent.com/gradle/gradle/v9.2.1/gradle/wrapper/gradle-wrapper.jar' -OutFile '%JAR%'"
  if errorlevel 1 (
    echo Download failed. Install Gradle and run: gradle wrapper --gradle-version 9.2.1
    exit /b 1
  )
)
if defined JAVA_HOME ( set JAVACMD=%JAVA_HOME%\bin\java.exe ) else ( set JAVACMD=java.exe )
"%JAVACMD%" -Dorg.gradle.appname=gradlew -classpath "%JAR%" org.gradle.wrapper.GradleWrapperMain %*
