Name "SDQ-Postgresql"
Caption "SDQ:setup Initial Database"
OutFile "sdq-postgresql-setup.exe"

InstallDir "$LOCALAPPDATA\SDQ"
SetOverWrite on
AutoCloseWindow true
RequestExecutionLevel admin

!include "FileFunc.nsh"
!include "LogicLib.nsh"

function .onInit
${GetParameters} $0
ClearErrors
${GetOptions} $0 "-n" $1
${IfNot} ${Errors}
    MessageBox mb_ok $1
${EndIf}
functionend

Section "Initial Database"
SetOutPath "$INSTDIR"
File "postgres-script.bat"
File "drop.sql"
File "initial.sql"
ExecWait 'postgres-script.bat "$0\PostgreSQL\9.6\bin" "$INSTDIR\drop.sql"'
ExecWait 'postgres-script.bat "$0\PostgreSQL\9.6\bin" "$INSTDIR\initial.sql"'
SectionEnd