# Greetings-11
First experiment with OpenJDK 11, no IDE required, uses Windows script files.

Source files are based on the following tutorial: http://openjdk.java.net/projects/jigsaw/quick-start. The project defines and uses two Java modules, builds and packs them, and generates a runtime image with a launcher.

## How-to

<pre>
1. Copy an OpenJDK 11 in the "ext\java\" folder.
2. Update the "JDK_HOME" variable in "0-env.bat" if necessary.
3. Launch "1-build.bat"                         to generate .class files.
4. Launch "2-runAfterBuild.bat"                 to run the application from the .class files.
5. Launch "3-jar.bat"                           to pack the .class files in .jar files.
6. Launch "4-runAfterJar.bat"                   to run the application from the jar files.
7. Launch "5-jlink.bat"                         to create a runtime image of the application and its launcher.
8. Launch "build\GreetingsApp\bin\launch.bat"   to start the application from the runtime image.
</pre>

## Files structure
<pre>
  Greetings-11
  ├─ bin                // generated folder, contains the .class files
  ├─ build              // generated folder, contains the runtime image
  │  └─ GreetingsApp
  ├─ ext                // contains external tools
  │  └─ java
  │     └─ openjdk-11
  ├─ lib                // generated folder, contains the .jar files
  └─ src                // contains the source files
</pre>
