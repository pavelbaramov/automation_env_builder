echo. 2>%USERPROFILE%\.android\repositories.cfg
call %ANDROID_HOME%\tools\bin\sdkmanager --licenses < yes.txt
call %ANDROID_HOME%\tools\bin\sdkmanager "platform-tools"

REM Hack for https://stackoverflow.com/questions/43796568/cant-update-tools-android-sdk-command-line-tools-for-windows
REM Please uncomment and run if you know what you do!
REM  
REM set current_dir=%CD%
REM cd %ANDROID_HOME%
REM ren tools tools.old || ver>nul
REM tools.old\bin\sdkmanager.bat "tools" --sdk_root=%ANDROID_HOME% || ver>nul
REM del tools.old /q /s || ver>nul
REM cd %current_dir%

call %ANDROID_HOME%\tools\bin\sdkmanager "tools" < yes.txt
call %ANDROID_HOME%\tools\bin\sdkmanager "build-tools;27.0.3" < yes.txt
call %ANDROID_HOME%\tools\bin\sdkmanager "build-tools;26.0.3" < yes.txt
call %ANDROID_HOME%\tools\bin\sdkmanager "build-tools;25.0.3" < yes.txt
call %ANDROID_HOME%\tools\bin\sdkmanager "build-tools;23.0.1" < yes.txt
call %ANDROID_HOME%\tools\bin\sdkmanager "platforms;android-27" < yes.txt
call %ANDROID_HOME%\tools\bin\sdkmanager "platforms;android-26" < yes.txt
call %ANDROID_HOME%\tools\bin\sdkmanager "platforms;android-25" < yes.txt
call %ANDROID_HOME%\tools\bin\sdkmanager "platforms;android-24" < yes.txt
call %ANDROID_HOME%\tools\bin\sdkmanager "platforms;android-23" < yes.txt
call %ANDROID_HOME%\tools\bin\sdkmanager "platforms;android-22" < yes.txt
call %ANDROID_HOME%\tools\bin\sdkmanager "platforms;android-21" < yes.txt
call %ANDROID_HOME%\tools\bin\sdkmanager "platforms;android-19" < yes.txt
call %ANDROID_HOME%\tools\bin\sdkmanager "platforms;android-18" < yes.txt
call %ANDROID_HOME%\tools\bin\sdkmanager "platforms;android-17" < yes.txt
call %ANDROID_HOME%\tools\bin\sdkmanager "emulator" < yes.txt
call %ANDROID_HOME%\tools\bin\sdkmanager "extras;android;m2repository" < yes.txt
call %ANDROID_HOME%\tools\bin\sdkmanager "extras;google;m2repository" < yes.txt