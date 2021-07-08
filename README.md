# <a name="toppen"></a> Getting started

- Start [HER](#windows) vis du bruker Windows
- Fortsett guiden for linux og macos

## Sett opp VS Code
1. Last ned VS Code
    https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user

2. Installer programmet

3. Åpne VS Code og installer extensions
    * Remote - WSL
    * Remote - Containers

## Sett opp zsh (optional)
1. Åpne en ny fane i WSL
2. Kjør kommandoen 
    
    `sudo apt install zsh -y && chsh -s $(which zsh)`

3. Åpne en ny fane og følg anvisningene for å sette opp zsh.
    * Velg option 1 hvis du er i tvil


## Sett opp repo
1. Åpne en ny fane i terminalen
2. Clone repoet fra github
3. Naviger til repoet i terminalen
4. Kjør sriptet 

    `/bin/bash setup.sh`

5. Åpne repoet i VS Code med kommandoen

    `code ./`


## Kjør opp container i VS Code
1. Åpne repoet i VS Code
2. Trykk CTRL + p
3. Skriv 
    
    `> remote-containers: reopen in container`

# <a name="windows"></a>For Windows

## Sett opp WSL 2 terminal
1. Åpne Powershell som admin
2. Kjør kommandoen:

    `dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart`

3. Kjør så kommandoen:

    `dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart`

4. Restart Windows
5. Last ned og kjør Linux kernel update package for x64 PC
    
    https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi

6. Åpne Powershell som admin
7. Kjør kommandoen

    `wsl --set-default-version 2`

8. Last ned Linux fra MS Store (trykk Get/Hent knappen i MS Store), feks:

    OS | URL | Anbefalt
    -|-|-
    Ubuntu 20.04 LTS | https://www.microsoft.com/store/apps/9n6svws3rx71 | ☑️
    Ubuntu 18.04 LTS | https://www.microsoft.com/store/apps/9N9TNGVNDL3Q | ➖
    Debian GNU/Linux | https://www.microsoft.com/store/apps/9MSVKQC78PK6 | ➖

9. Åpne WSL2 terminal, sjekk at det fungerer og start fra [toppen](#toppen) av denne readme