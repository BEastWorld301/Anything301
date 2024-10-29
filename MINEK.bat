@echo off
:: Enable Remote Desktop
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

:: Allow Remote Desktop through Firewall
netsh advfirewall firewall set rule group="remote desktop" new enable=yes

:: Display IP address and port
echo IP Address: %COMPUTERNAME%
echo Port: 3389

:: Display IP address
echo IP Address:
ipconfig | findstr /i "IPv4 Address"
echo.

:: Display Port
echo Port: 3389

:: Start Remote Desktop Session Host
net start TermService

echo RDP server is now active.
