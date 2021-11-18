@echo off

:: Create download dir
mkdir jdkdl
cd jdkdl

:: Download from Microsoft
curl -L -o jdk_arm64.zip https://aka.ms/download-jdk/microsoft-jdk-11-windows-aarch64.zip

:: Unzip using jar
jar xf jdk_arm64.zip
rm /f jdk_arm64.zip

FOR %%F IN (*) DO (
 set JDK_NAME=%%F
 goto cont
)
:cont

:: Move to C:\jdk-11
move "%JDK_NAME%" "C:\jdk-11"

:: Remove download dir
cd ..
rmdir jdkdl

:: Print install confirmation
echo Successfully installed arm64 JDK to C:\jdk-11
dir C:\jdk-11
