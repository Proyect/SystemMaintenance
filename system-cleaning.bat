echo "Limpiar Datos de usuarios"
cd /d "C:\Users\Zorrilla 5047\Desktop"
del /s /q *.* & rmdir /s /q .

cd /d "C:\Users\Zorrilla 5047\Documents"
del /s /q *.* & rmdir /s /q .

cd /d "C:\Users\Zorrilla 5047\Downloads"
del /s /q *.* & rmdir /s /q .

cd /d "C:\Users\Zorrilla 5047\Pictures\Camera Roll"
del /s /q *.* & rmdir /s /q .

echo "limpiando datos No necesarios"
del /f /s /q %temp%\*

echo "Eliminando Datos de Chrome"
cd "C:\Users\Zorrilla 5047\AppData\Local\Google\Chrome\User Data\"
del /s /q *.*

echo "Eliminando juegos"
cd "C:\Users\Zorrilla 5047\AppData\Roaming\uTorrent Web"
rmdir /s /q *.*
cd "C:\Program Files\Counter-Strike 1.6"
rmdir /s /q *.*
cd "C:\Program Files (x86)\Counter-Strike 1.6"
rmdir /s /q *.*
cd "C:\Games\"
rmdir /s /q *.*
cd "C:\Program Files (x86)\pvzHE"
rmdir /s /q *.*
cd "C:\Archivos de programa (x86)\Steam\"
rmdir /s /q *.*
cd "C:\Program Files (x86)\Cheating-Death"
rmdir /s /q *.*

echo "Eliminando opera"
cd "C:\Users\Zorrilla 5047\AppData\Local\Programs\Opera GX\"
rmdir /s /q *.*
cd "C:\Users\Zorrilla 5047\AppData\Local\Programs\Opera\"
rmdir /s /q *.*
 
cleanmgr /verylowdisk

echo Verificando las redes guardadas
netsh wlan show profiles
echo elimiando redes wiffi guardadas
netsh wlan delete profile name="hotel"
netsh wlan delete profile name="Preceptoria 5047"
netsh wlan delete profile name="FiberCorp wifi193 5.8GHz"
netsh wlan delete profile name="FiberCorp wifi193 2.4GHz"
netsh wlan delete profile name="CE1588 2"
netsh wlan delete profile name="Fibertel WiFi506  5.8GHz"
netsh wlan delete profile name="Fibertel WiFi506  2.4GHz"
netsh wlan delete profile name="Personal-F74-5GHz"
netsh wlan delete profile name="Personal-0F4"
netsh wlan delete profile name="Zorrilla 5047"


echo "ordenar PC"
defrag C: /U /V
sfc /scannow
@echo off
mrt -scan -sequential -full
wuauclt.exe /updatenow
chkdsk /f /r  /x

echo "Quitando el instalador de Win"
sc config msiexec start= disabled
::sc config msiexec start= auto Para habilitarlo de nuevo

echo "incorporando tareas"
schtasks /create /tn "ApagarPC" /tr "shutdown /s /f /t 0" /sc once /st 22:20

echo Apagando el ordenador
shutdown /s /t 30
