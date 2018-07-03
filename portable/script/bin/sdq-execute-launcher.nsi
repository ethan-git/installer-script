Name "SDQ-3.0"
Caption "SDQ"
Icon "sdq.ico"
OutFile "SDQ.exe"

SilentInstall silent
AutoCloseWindow true
ShowInstDetails nevershow

Section ""
  Call GetJRE
  Pop $R0

  StrCpy $0 '"$R0" -jar sdq.jar'

  SetOutPath $EXEDIR
  ExecWait $0
SectionEnd

Function GetJRE
  Push $R0
  Push $R1

  ClearErrors
  StrCpy $R0 "$EXEDIR\app\runtime\bin\javaw.exe"
  IfFileExists $R0 JreFound
  StrCpy $R0 ""

  ClearErrors
  ReadEnvStr $R0 "JAVA_HOME"
  StrCpy $R0 "$R0\bin\javaw.exe"
  IfErrors 0 JreFound

  ClearErrors
  ReadRegStr $R1 HKLM "SOFTWARE\JavaSoft\Java Runtime Environment" "CurrentVersion"
  ReadRegStr $R0 HKLM "SOFTWARE\JavaSoft\Java Runtime Environment\$R1" "JavaHome"
  StrCpy $R0 "$R0\bin\javaw.exe"

  IfErrors 0 JreFound
  StrCpy $R0 "javaw.exe"

 JreFound:
  Pop $R1
  Exch $R0
FunctionEnd