echo "Copiando Archivos"
schtasks /create /tn "Clean System" /tr "C:\Users\system-cleaning.bat" /sc daily /st 22:30 /f
Xcopy /y "D:\system-cleaning.bat" "C:\Users\system-cleaning.bat"
cd "C:\Users\"
echo Mantenimiento realizado el %date% a las %time% >> mantenimiento.txt
system-cleaning.bat