Name "SDQ-Postgresql"
Caption "SDQ:extract Postgresql"
OutFile "sdq-postgresql-install-x86.exe"

InstallDir "$LOCALAPPDATA\SDQ"
SetOverWrite on
AutoCloseWindow true
RequestExecutionLevel admin

Section "Install Postgresql"
SetOutPath "$INSTDIR"
File "postgresql-9.6.9-1-windows.exe"
ExecWait "postgresql-9.6.9-1-windows.exe --unattendedmodeui minimal --mode unattended --servicename postgres --superpassword postgres --serverport 5432"
SectionEnd