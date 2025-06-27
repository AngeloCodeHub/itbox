# 啟動預設的 WSL 發行版
# wsl、bash都可以啟動 WSL

# 列出目前已經安裝的 image
wsl -l -v
# 啟動 Ubuntu
wsl -d Ubuntu
# 關閉 Ubuntu
wsl --terminate Ubuntu
# 安裝kali linux
wsl --install kali-linux --location d:\
# 更改預設的 WSL 發行版
wsl -s Ubuntu

Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/microsoft/Windows-Containers/Main/helpful_tools/Install-DockerCE/install-docker-ce.ps1" -o install-docker-ce.ps1
.\install-docker-ce.ps1


