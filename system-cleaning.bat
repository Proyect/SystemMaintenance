echo "Clear User Data"
cd /d "C:\Users\PC\Desktop"
del /s /q *.*

cd /d "C:\Users\PC\Documents"
del /s /q *.*

cd /d "C:\Users\PC\Downloads"
del /s /q *.*

echo "Cleaning unnecessary data"
del /f /s /q %temp%\*
cleanmgr

echo Verificando las redes guardadas
netsh wlan show profiles
echo elimiando redes wiffi guardadas
netsh wlan delete profile name="SomeNet"

echo "put in order the datas"
defrag C: /U /V
sfc /scannow
wuauclt.exe /updatenow
chkdsk /f /r

echo "Removing the Win installer"
sc config msiexec start= disabled
::sc config msiexec start= auto Para habilitarlo de nuevo

echo turn off
shutdown /s /t 30
