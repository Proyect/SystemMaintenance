echo "Limpiar Datos de usuarios"

echo "limpiando datos No necesarios"

del /f /s /q %temp%\* 
cleanmgr /verylowdisk

echo "ordenar PC"
defrag C: /U /V
sfc /scannow
@echo off
mrt -scan -sequential -full
wuauclt.exe /updatenow
chkdsk /f /r  /x

echo Apagando el ordenador
shutdown /s /t 30
