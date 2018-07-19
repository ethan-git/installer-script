Name "SDQ-3.0 Installer"
Caption "SDQ Installer"
Icon "sdq.ico"
OutFile "sdq-3.0-windows-x86.exe"

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
File "bin\sdq-resources-x86.exe"
File "bin\sdq-resources-app.exe"
File "bin\sdq-resources-bin.exe"
File "bin\sdq-postgresql-install-x86.exe"
File "bin\sdq-postgresql-setup.exe"
ExecWait "sdq-resources-x86.exe $PROGRAMFILES\SDQ"
ExecWait "sdq-resources-app.exe $PROGRAMFILES\SDQ"
ExecWait "sdq-resources-bin.exe $PROGRAMFILES\SDQ"
ExecWait "sdq-postgresql-install-x86.exe"
ExecWait "sdq-postgresql-setup.exe $PROGRAMFILES"

CreateShortCut "$DESKTOP\SDQ Server.lnk" "$PROGRAMFILES\SDQ\SDQ.exe" "" "$INSTDIR\sdq.ico"
CreateShortCut "$DESKTOP\SDQ.lnk" "http://localhost:18080/sdq" "" "$INSTDIR\sdq.ico"

MessageBox MB_OK "Completed."

false:
SectionEnd