@echo off  ::Prevents batch commands from being displayed when the script runs.

::Please a shortcut to this file in your shell:startup folder. All AHKs in the repo will be run on system startup.

:: %~dp0 represents the batch file's directory path.
cd /d %~dp0

for %%f in (*.ahk) do (
    Start "" "%%f"
)