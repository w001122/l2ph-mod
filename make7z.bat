@echo off

if not exist build\l2ph.exe (
  echo build\l2ph.exe not found
  pause
  exit /b 2
)

::del /q *.7z

rd /s /q l2ph-mod
md l2ph-mod
cd l2ph-mod
copy /y "..\build\*.exe" .
copy /y "..\build\*.dll" .
md Logs
md Plugins
md Scripts
md Settings
cd Settings
md ru
md en

copy /y "..\..\build\settings\ru\*.ini" "ru"
copy /y "..\..\build\settings\en\*.ini" "en"
copy /y "..\..\build\settings\*.ini" "."

del /q windows.ini
del /q options.ini

cd ..\..
"C:\Program Files\7-Zip\7z" a -r l2ph-mod.7z l2ph-mod
