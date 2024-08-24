@echo OFF

dotnet bin\Prebuild.dll /target vs2022

setlocal ENABLEEXTENSIONS

rem Standardpfad für MSBuild in Visual Studio 2022 Community Edition
set MSBUILD_PATH="C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\MSBuild.exe"

rem Überprüfen, ob MSBuild.exe am Standardpfad existiert
if not exist %MSBUILD_PATH% (
    rem Versuche alternative Editionen von VS2022 zu finden
    for %%e in (Enterprise Professional Community) do (
        if exist "C:\Program Files\Microsoft Visual Studio\2022\%%e\MSBuild\Current\Bin\MSBuild.exe" (
            set MSBUILD_PATH="C:\Program Files\Microsoft Visual Studio\2022\%%e\MSBuild\Current\Bin\MSBuild.exe"
            goto :found
        )
    )
)

:found
if exist %MSBUILD_PATH% (
    @echo Found MSBuild at %MSBUILD_PATH%
    @echo Creating compile.bat
    rem To compile in debug mode
    @echo %MSBUILD_PATH% opensim.sln > compile.bat
    rem To compile in release mode, comment the line above and uncomment the next line
    rem @echo %MSBUILD_PATH% /P:Config=Release opensim.sln > compile.bat
) else (
    @echo MSBuild for Visual Studio 2022 not found. Please check the installation path.
    @echo Not creating compile.bat
    if exist "compile.bat" (
        del compile.bat
    )
)

:end
pause