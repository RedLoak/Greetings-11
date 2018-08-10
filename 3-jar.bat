@ECHO OFF

CALL 0-env.bat

RD /S /Q %LIB%
MD %LIB%

%JAR% --create ^
--file=%LIB%\org.astro@1.0.jar ^
--module-version=1.0 -C %BIN%\org.astro .

%JAR% --create ^
--file=%LIB%\com.greetings.jar ^
--main-class=com.greetings.Main -C %BIN%\com.greetings .

PAUSE
