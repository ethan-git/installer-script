Name "SDQ-3.0 Installer"
Caption "SDQ Installer"
Icon "sdq.ico"
OutFile "sdq-3.0-windows-x64.exe"

InstallDir "$LOCALAPPDATA\SDQ"
SetOverWrite on
SilentInstall silent
AutoCloseWindow true
RequestExecutionLevel admin

Section "Base"
SetOutPath "$INSTDIR"
MessageBox MB_YESNO "SDQ will be installed. Confirm it is okay?" IDYES true IDNO false
true:
File "sdq.ico"
File "bin\sdq-resources-x64.exe"
File "bin\sdq-resources-app.exe"
File "bin\sdq-resources-bin.exe"
File "bin\sdq-postgresql-install-x64.exe"
File "bin\sdq-postgresql-setup.exe"
ExecWait "sdq-resources-x64.exe $PROGRAMFILES64\SDQ"
ExecWait "sdq-resources-app.exe $PROGRAMFILES64\SDQ"
ExecWait "sdq-resources-bin.exe $PROGRAMFILES64\SDQ"
ExecWait "sdq-postgresql-install-x64.exe"
ExecWait "sdq-postgresql-setup.exe $PROGRAMFILES64"

CreateShortCut "$DESKTOP\SDQ Server.lnk" "$PROGRAMFILES64\SDQ\SDQ.exe" "" "$INSTDIR\sdq.ico"
CreateShortCut "$DESKTOP\SDQ.lnk" "http://localhost:18080/sdq" "" "$INSTDIR\sdq.ico"

MessageBox MB_OK "Completed."

false:
SectionEnd