# Greetings-11
First experiment with OpenJDK 11.

Source files are based on the following tutorial: http://openjdk.java.net/projects/jigsaw/quick-start. The project defines and uses two Java modules, builds and packs them, and generates a runtime image with a launcher.

OpenJDK 11 EA 25 download link: https://download.java.net/java/early_access/jdk11/25/GPL/openjdk-11-ea+25_windows-x64_bin.zip.

No IDE required, uses Windows script files.

## How-to

<pre>
1. Copy an OpenJDK 11 in the "ext\java\" folder.
2. Update the "JDK_HOME" variable in "build.bat" if necessary.
3. Launch "build.bat".
</pre>

The application will be created in the "build\GreetingsApp" folder.

## Files structure
<pre>
  Greetings-11
  ├─ bin                // generated folder, contains the .class files
  ├─ build              // generated folder, contains the runtime image
  │  └─ GreetingsApp
  ├─ ext                // contains external tools
  │  └─ java
  │     └─ openjdk-11
  │  └─ shortcut
  ├─ lib                // generated folder, contains the .jar files
  └─ src                // contains the source files
</pre>
