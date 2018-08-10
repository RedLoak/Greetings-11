@ECHO OFF

CALL 0-env.bat

RD /S /Q %BUILD%\GreetingsApp

%JLINK% -p %JDK_HOME%/jmods;%LIB% ^
--add-modules com.greetings ^
--output %BUILD%\GreetingsApp ^
--compress=2 ^
--launcher launch=com.greetings/com.greetings.Main

PAUSE
