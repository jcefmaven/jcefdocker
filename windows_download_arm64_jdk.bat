@echo off

:: Create download dir
mkdir jdkdl
cd jdkdl

:: Download from Microsoft
curl -L -o jdk_arm64.zip https://aka.ms/download-jdk/microsoft-jdk-11-windows-aarch64.zip

:: Unzip using jar
jar xf jdk_arm64.zip
del jdk_arm64.zip

SET a=jdk
for /D %%x in (%a%*) do if not defined f set "f=%%x"
echo Extracted %f%

:: Move to C:\jdk-11
rename %f% jdk-11
move jdk-11 C:\

:: Remove download dir
cd ..
rmdir jdkdl

:: Print install confirmation
echo Successfully installed arm64 JDK to C:\jdk-11
dir C:\jdk-11\
