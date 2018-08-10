@ECHO OFF

CALL 0-env.bat

%JAVA% -p %BIN% ^
-m com.greetings/com.greetings.Main

PAUSE
