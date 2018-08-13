@ECHO OFF

:: =========================================================
:: set variables
:: =========================================================

:var
ECHO Settings variables...

SET BIN=bin
SET BUILD=build
SET EXT=ext
SET LIB=lib
SET SRC=src

SET JDK_HOME=%EXT%\java\openjdk-11
SET JAR=%JDK_HOME%\bin\jar.exe
SET JAVA=%JDK_HOME%\bin\java.exe
SET JAVAC=%JDK_HOME%\bin\javac.exe
SET JLINK=%JDK_HOME%\bin\jlink.exe

SET SHORTCUT_HOME=%EXT%\shortcut
SET SHORTCUT=%SHORTCUT_HOME%\shortcut.exe

:: =========================================================
:: javac
:: =========================================================

:javac
ECHO Compiling...

IF EXIST %BIN%\org.astro RD \S \Q %BIN%\org.astro
IF EXIST %BIN%\com.greetings RD \S \Q %BIN%\com.greetings
MD %BIN%\org.astro
MD %BIN%\com.greetings

%JAVAC% -d %BIN%\org.astro ^
  %SRC%/org.astro/module-info.java ^
  %SRC%/org.astro/org/astro/World.java

IF ERRORLEVEL 1 GOTO error

%JAVAC% -p %BIN% -d %BIN%\com.greetings ^
  %SRC%\com.greetings\module-info.java ^
  %SRC%\com.greetings\com\greetings\Main.java

IF ERRORLEVEL 1 GOTO error

:: =========================================================
:: jar
:: =========================================================

:jar
ECHO Creating jar files...

IF EXIST %LIB% RD \S \Q %LIB%
MD %LIB%

%JAR% --create ^
  --file=%LIB%\org.astro@1.0.jar ^
  --module-version=1.0 ^
  -C %BIN%\org.astro .

IF ERRORLEVEL 1 GOTO error

%JAR% --create ^
  --file=%LIB%\com.greetings.jar ^
  --main-class=com.greetings.Main -C %BIN%\com.greetings .

IF ERRORLEVEL 1 GOTO error

:: =========================================================
:: jlink
:: =========================================================

:jlink
ECHO Packaging application...

IF EXIST %BUILD%\GreetingsApp RD /S /Q %BUILD%\GreetingsApp

%JLINK% -p %JDK_HOME%/jmods;%LIB% ^
  --add-modules com.greetings ^
  --output %BUILD%\GreetingsApp ^
  --compress=2 ^
  --launcher launch=com.greetings/com.greetings.Main

IF ERRORLEVEL 1 GOTO error

:: =========================================================
:: create shortcut
:: =========================================================

:shortcut
ECHO Creating application shortcut...

%SHORTCUT% ^
  /F:%BUILD%\GreetingsApp\GreetingsApp.lnk ^
  /A:C /T:%windir%\explorer.exe ^
  /P:bin\launch.bat ^
  /I:%windir%\System32\cmd.exe,0 > nul 2>&1

IF ERRORLEVEL 1 GOTO error

:: =========================================================
:: clean
:: =========================================================

:clean
ECHO Cleaning temporary folders...

RD /S /Q %BIN%
RD /S /Q %LIB%

:: =========================================================
:: done
:: =========================================================

:done
ECHO Done!

PAUSE
GOTO :EOF

:: =========================================================
:: error
:: =========================================================

:error
ECHO Error!

PAUSE
GOTO :EOF