@REM Maven Wrapper startup script for Windows
@REM
@REM Required ENV vars:
@REM JAVA_HOME - location of a JDK home dir
@REM

@echo off

set ERROR_CODE=0

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM ==== START VALIDATION ====
if not "%JAVA_HOME%" == "" goto OkJHome

for %%i in (java.exe) do set "JAVACMD=%%~$PATH:i"
goto continue

:OkJHome
set "JAVACMD=%JAVA_HOME%\bin\java.exe"

:continue
if not exist "%JAVACMD%" (
  echo.
  echo ERROR: JAVA_HOME is set to an invalid directory.
  echo JAVA_HOME = "%JAVA_HOME%"
  echo Please set the JAVA_HOME variable to match the location of your Java installation.
  goto error
)

@REM Find the project base dir
set "MAVEN_PROJECTBASEDIR=%~dp0"

@REM Extension to allow automatically downloading the maven-wrapper.jar from Maven-central
@REM This allows using the maven wrapper in projects that prohibit checking in binary data.
if exist %MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.jar goto runMaven

echo Downloading Maven Wrapper...
powershell -Command "& {(New-Object Net.WebClient).DownloadFile('https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.2.0/maven-wrapper-3.2.0.jar', '%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.jar')}"

:runMaven
"%JAVACMD%" -classpath "%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.jar" "-Dmaven.multiModuleProjectDirectory=%MAVEN_PROJECTBASEDIR:~0,-1%" org.apache.maven.wrapper.MavenWrapperMain %*

:error
set ERROR_CODE=1

:end
@endlocal & set ERROR_CODE=%ERROR_CODE%

exit /B %ERROR_CODE%
