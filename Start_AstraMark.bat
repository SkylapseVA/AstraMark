@echo off
setlocal
cd /d "%~dp0"

powershell -NoProfile -ExecutionPolicy Bypass -Command "$release = Get-ItemPropertyValue -Path 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full' -Name Release -ErrorAction SilentlyContinue; if ($release -lt 378389) { exit 2 } else { exit 0 }"
if errorlevel 2 (
  echo AstraMark needs Microsoft .NET Framework 4.x to run.
  echo Opening the official Microsoft download page...
  start "" "https://dotnet.microsoft.com/en-us/download/dotnet-framework"
  pause
  exit /b 1
)

start "" "%~dp0AstraMark.exe"
