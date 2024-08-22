@echo off
setlocal

rem Überprüfe, ob genau ein Argument übergeben wurde
if "%~1"=="" (
    echo Usage: make-distribution-wifi.bat ^<tag^>
    exit /b 1
)

rem Setze Verzeichnis-Variablen
set "opensimdir=..\diva-distribution"
set "toolsdir=Tools"
set "libdir=Library"
set "wd=%cd%"

rem Hole den Tag aus dem Argument
cd /d "%opensimdir%" || exit /b 1
set "tag=%~1"
set "distdir=wifi-%tag%"

rem Erstelle Sprachdateien für die Lokalisierung
echo Generating language files
cd /d "%opensimdir%\addon-modules\21Wifi\Localization" || exit /b 1
call make_languages.bat

rem Erstelle das Distributionsverzeichnis und beginne es zu befüllen
cd /d "%wd%" || exit /b 1
echo Making Diva Wifi Distribution %distdir%
mkdir "%distdir%"
mkdir "%distdir%\bin"
copy "%opensimdir%\bin\Diva.Data.dll" "%distdir%\bin"
copy "%opensimdir%\bin\Diva.Data.MySQL.dll" "%distdir%\bin"
copy "%opensimdir%\bin\Diva.Interfaces.dll" "%distdir%\bin"
copy "%opensimdir%\bin\Diva.OpenSimServices.dll" "%distdir%\bin"
copy "%opensimdir%\bin\Diva.Utils.dll" "%distdir%\bin"
copy "%opensimdir%\bin\Diva.Wifi.dll" "%distdir%\bin"
copy "%opensimdir%\bin\Diva.Wifi.ScriptEngine.dll" "%distdir%\bin"
copy "%opensimdir%\addon-modules\Wifi\Wifi.ini.example" "%distdir%\bin"
xcopy "%opensimdir%\WifiPages" "%distdir%\WifiPages" /E /I
del "%distdir%\WifiPages\*~"
del "%distdir%\WifiPages\*\*~"

rem Kopiere Sprachressourcendateien
echo Copying language resource files
cd /d "%opensimdir%" || exit /b 1
for /r bin %%f in (Diva.Wifi.resources.dll) do (
    xcopy "%%f" "%wd%\%distdir%\%%~p" /I
)

rem Kopiere Konfigurations-, Lizenz- und Dokumentationsdateien
echo Copying config and doc files
cd /d "%wd%" || exit /b 1
mkdir "%distdir%\doc"
copy "Configs\READMEWIFI.txt" "%distdir%"
copy "Configs\RELEASENOTESWIFI.txt" "%distdir%"
copy "Configs\LICENSEWIFI.txt" "%distdir%"
copy "Configs\LICENSEIMAGES.txt" "%distdir%"
copy "Configs\doc\WIFI.txt" "%distdir%\doc"

rem Zippe die Distribution
echo Zipping...
powershell Compress-Archive -Path "%distdir%" -DestinationPath "%distdir%.zip"
