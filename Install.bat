@echo off
setlocal enabledelayedexpansion

:: Di chuyển thư mục Powershell, EVKey, và SAM
echo Dang xu ly thu muc Powershell, EVKey, va SAM...
for %%i in (Powershell EVKey SAM) do (
    if exist "%USERPROFILE%\Documents\%%i" (
        echo Xoa thu muc %%i cu trong Documents...
        rmdir /s /q "%USERPROFILE%\Documents\%%i"
    )
    if exist "%%i" (
        echo Di chuyen thu muc %%i vao Documents...
        move "%%i" "%USERPROFILE%\Documents\"
    ) else (
        echo Khong tim thay thu muc %%i.
    )
)

:: Cài đặt Scoop và các ứng dụng
echo Cai dat Scoop va cac ung dung...
powershell -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser"
powershell -Command "Invoke-WebRequest -Uri $url -Proxy 'http://10.10.7.11:80' -ProxyCredential $creds"
powershell -Command "Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression"
powershell -Command "scoop install git"
powershell -Command "scoop bucket add extras"
powershell -Command "scoop bucket add nerd-fonts"
powershell -Command "scoop bucket add nonportable"
powershell -Command "scoop install python nodejs oh-my-posh spicetify-cli JetBrainsMono-NF neovim vcredist2022 microsoft-edge-beta-np fastfetch discord telegram vmware-workstation-player-np vscode winrar revouninstaller git-lfs"

:: Chạy các file cài đặt từ thư mục Apps
echo Chay cac file cai dat tu thu muc Apps...
if exist Apps (
    cd Apps
    for %%f in (*.exe) do (
        echo Dang chay %%f...
        start /wait %%f
    )
    cd ..
) else (
    echo Khong tim thay thu muc Apps.
)

:: Di chuyển thư mục Vencord/settings
echo Di chuyen thu muc Vencord/settings...
if exist Vencord\settings (
    if exist "%APPDATA%\Vencord\settings" (
        echo Xoa thu muc settings cu trong Vencord...
        rmdir /s /q "%APPDATA%\Vencord\settings"
    )
    echo Tao thu muc Vencord trong AppData neu chua ton tai...
    if not exist "%APPDATA%\Vencord" mkdir "%APPDATA%\Vencord"
    echo Di chuyen settings vao Vencord...
    xcopy /E /I /Y Vencord\settings "%APPDATA%\Vencord\settings"
) else (
    echo Khong tim thay thu muc Vencord/settings.
)

echo Hoan thanh cac buoc cai dat va cau hinh.
pause
