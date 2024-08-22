@echo off
setlocal

rem Überprüfe, ob genau ein Argument übergeben wurde
if "%~1"=="" (
    echo Usage: make-distribution.bat ^<tag^>
    exit /b 1
)

rem Setze Verzeichnis-Variablen
set "opensimdir=..\diva-distribution"
set "midir=..\MIAddons"
set "toolsdir=Tools"
set "libdir=Library"
set "wd=%cd%"

rem Hole den Tag aus dem Argument
set "tag=%~1"
set "distdir=diva-r%tag%"

rem Erstelle Sprachdateien für die Lokalisierung
echo Generating language files
cd /d "%opensimdir%\addon-modules\21Wifi\Localization" || exit /b 1
call make_languages.bat

rem Erstelle das Distributionsverzeichnis und beginne es zu befüllen
cd /d "%wd%" || exit /b 1
echo Making Diva Distribution %distdir% from %opensimdir%
mkdir "%distdir%"
mkdir "%distdir%\doc"
xcopy "%opensimdir%\bin" "%distdir%\bin" /E /I /Q
copy "%opensimdir%\bin\Wifi.ini" "%distdir%\bin"
copy "%opensimdir%\README.txt" "%distdir%\OSREADME.txt"
copy "%opensimdir%\CONTRIBUTORS.txt" "%distdir%\OSCONTRIBUTORS.txt"
copy "%opensimdir%\LICENSE.txt" "%distdir%\OSLICENSE.txt"
xcopy "%opensimdir%\ThirdPartyLicenses" "%distdir%\ThirdPartyLicenses" /E /I /Q

rem Kopiere proprietäre Addons von MI
echo Adding Metaverse Ink addons from %midir%
copy "%midir%\bin\Diva.TOS.dll" "%distdir%\bin"
copy "%midir%\bin\DivaTOS.ini" "%distdir%\bin"
copy "%midir%\bin\Diva.MISearchModules.dll" "%distdir%\bin"
copy "%midir%\bin\MISearch.ini" "%distdir%\bin"

rem Bereinige unnötige Dateien
echo Cleaning up
cd /d "%distdir%\bin" || exit /b 1
del Robust* SimpleApp*
del OpenSim.TestSuite* Prebuild.exe* OpenSim.Tests.Clients*
del SubversionSharp.* svn_client-1.dll 
del OpenSim.Grid.*

rem Entferne nicht benötigte Datenbanken
del libdb_dotNET43.dll libdb44d.dll System.Data.SQLite.dll OpenSim.Data.SQLiteLegacy.dll OpenSim.Data.MSSQL.dll* *.Data.SQLite.dll* Castle* mssql_connection.ini

rem Entferne ungenutzte Physik-Engines
del Physics\OpenSim.Region.Physics.Basic* Physics\OpenSim.Region.Physics.PhysX* Physics\OpenSim.Region.Physics.POS* Physics\OpenSim.Region.Physics.ODE*

rem Entferne ungenutzte Plugins
del OpenSim.ApplicationPlugins.Rest.dll* OpenSim.ApplicationPlugins.Rest.Inventory* OpenSim.ApplicationPlugins.Rest.Regions.dll*

rem Entferne Beispiel-Addins
del *AddinExample.*

rem Entferne ungenutzte Skript-Engines
rem del OpenSim.Region.ScriptEngine.Shared.YieldProlog.dll*

rem Entferne ungenutzte Clients
del *MXP* *VWoHTTP*

rem Entferne ungenutzte Diva-Komponenten
del Diva.LoginService.* Diva.Wifi.ProcessorTest.* Diva.Data.SQLite*

rem Entferne sonstige unnötige Dateien
del OpenSim.Tools.lslc.*
del *.pdb *.log *.jpg *.JPG *.tiff *.TIFF *.png *.PNG *.bmp *.BMP *.oar *.iar *~ *.db
rd /s /q addin-db-* 
del *.Tests.dll *.Tests.*.dll TestResult.* *.Tests.dll.*
rd /s /q config-include\storage
del config-include\* j2kDecodeCache\* Regions\* DataSnapshot\*
rd /s /q assetcache
del maptiles\*
rd /s /q ScriptEngines

rem Kopiere Konfigurations-, Lizenz- und Dokumentationsdateien
echo Copying config and doc files
cd /d "%wd%" || exit /b 1
copy Configs\README.txt "%distdir%"
copy Configs\RELEASENOTES.txt "%distdir%"
copy Configs\RELEASENOTESWIFI.txt "%distdir%"
copy Configs\LICENSE.txt "%distdir%"
copy Configs\LICENSEWIFI.txt "%distdir%"
copy Configs\LICENSEIMAGES.txt "%distdir%"
copy Configs\LICENSEDIVA.txt "%distdir%"
copy Configs\PRIVACYNOTICE.txt "%distdir%"
copy Configs\DotNetZip.txt "%distdir%\ThirdPartyLicenses"
copy Configs\IMPORTANT.txt "%distdir%"

copy Configs\OpenSim.ini "%distdir%\bin"
copy Configs\OpenSim.exe.config "%distdir%\bin"
copy Configs\DivaPreferences.ini "%distdir%\bin\config-include"
copy Configs\MyWorld.ini.example "%distdir%\bin\config-include"
copy Configs\RegionConfig.ini.example "%distdir%\bin\Regions"

copy Configs\INSTALL.txt "%distdir%"
copy Configs\doc\ADVANCED.txt "%distdir%\doc"
copy Configs\doc\DNS.txt "%distdir%\doc"
copy Configs\doc\MYSQL.txt "%distdir%\doc"
copy Configs\doc\MONO.txt "%distdir%\doc"
copy Configs\doc\OSQUESTIONS.txt "%distdir%\doc"
copy Configs\doc\TROUBLESHOOTING.txt "%distdir%\doc"
copy Configs\doc\WIFI.txt "%distdir%\doc"

rem Kopiere Werkzeuge
echo Copying tools
copy "%toolsdir%\bin\Configure.exe" "%distdir%\bin"
copy "%toolsdir%\bin\Update.exe" "%distdir%\bin"

rem Kopiere Bibliothek
echo Copying library
xcopy "%libdir%\Clothing Library (small).iar" "%distdir%\bin\Library" /I /Q
xcopy "%libdir%\Objects Library (small).iar" "%distdir%\bin\Library" /I /Q

rem Zippe die Distribution
echo Zipping...
powershell Compress-Archive -Path "%distdir%" -DestinationPath "%distdir%.zip"
