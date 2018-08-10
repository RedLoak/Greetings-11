@ECHO OFF

CALL 0-env.bat

RD \S \Q %BIN%\org.astro
RD \S \Q %BIN%\com.greetings
MD %BIN%\org.astro
MD %BIN%\com.greetings

%JAVAC% -d %BIN%\org.astro ^
%SRC%/org.astro/module-info.java ^
%SRC%/org.astro/org/astro/World.java

%JAVAC% -p %BIN% -d %BIN%\com.greetings ^
%SRC%\com.greetings\module-info.java ^
%SRC%\com.greetings\com\greetings\Main.java

PAUSE
