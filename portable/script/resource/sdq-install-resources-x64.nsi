Name "SDQ-3.0"
Caption "SDQ:extract Resources"
OutFile "sdq-resources-x64.exe"

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

Section "Copy Resources"
SetOutPath "$0"
File /r "SDQ-x64\*.*"
SectionEnd