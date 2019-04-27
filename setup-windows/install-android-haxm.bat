echo "y" | %ANDROID_HOME%\tools\bin\sdkmanager "extras;intel;Hardware_Accelerated_Execution_Manager"
set current_dir=%CD%
cd %ANDROID_HOME%\extras\intel\Hardware_Accelerated_Execution_Manager
silent_install.bat || ver>nul
cd %current_dir%