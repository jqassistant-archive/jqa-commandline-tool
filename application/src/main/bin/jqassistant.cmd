@echo off

if "%JAVA_HOME%" == "" (
  set JAVA_CMD="java"
) else (
  set JAVA_CMD="%JAVA_HOME%\bin\java"
)

set JQASSISTANT_HOME=%~dp0%\..
rem Required for Neo4j Plugin class loading in Neo4jServerFactory
set JQASSISTANT_JVM_ARGS=--add-opens java.base/jdk.internal.loader=ALL-UNNAMED

%JAVA_CMD% %JQASSISTANT_JVM_ARGS% %JQASSISTANT_OPTS% -jar "%JQASSISTANT_HOME%\lib\${project.groupId}-${project.artifactId}-${project.version}.${project.packaging}" %*
