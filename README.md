# <a name="toppen"></a> Getting started

- Start [HER](#windows) vis du bruker Windows
- Fortsett guiden for linux og macos

## Installer Docker Desktop
1. Last ned og installer Docker Desktop for ditt operativsystem
    - [Windows](https://desktop.docker.com/win/stable/amd64/Docker%20Desktop%20Installer.exe?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=module)
    - [MacOS - Intel chip](https://desktop.docker.com/mac/stable/amd64/Docker.dmg?utm_source=docker&amp;utm_medium=webreferral&amp;utm_campaign=dd-smartbutton&amp;utm_location=module)
    - [MacOS - Apple chip](https://desktop.docker.com/mac/stable/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=dd-smartbutton&utm_location=module)
2. Åpne Docker Desktop og verifiser at programmet ble installert.

## Sett opp VS Code
1. Last ned og installer VS Code for ditt operativsystem
    - [Windows](https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user)
    - [MacOS](https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal)
    - [Debian/Ubuntu](https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64)
    

2. Åpne VS Code og installer extensions
    * Remote - WSL
    * Remote - Containers

## Kjør opp container i VS Code
1. Åpne repoet i VS Code
2. Trykk CTRL + P
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

    OS | Anbefalt
    -|-
    [Ubuntu 20.04 LTS](https://www.microsoft.com/store/apps/9n6svws3rx71) | ☑️
    [Ubuntu 18.04 LTS](https://www.microsoft.com/store/apps/9N9TNGVNDL3Q) | ➖
    [Debian GNU/Linux](https://www.microsoft.com/store/apps/9MSVKQC78PK6) | ➖

9. Åpne WSL2 terminal, sjekk at det fungerer og start fra [toppen](#toppen) av denne readme

# Troubleshooting
### __Hjelp jeg får ikke til git push/pull  fra devcontainer__

Du har tidligere clonet repoet med ssh, lagt til ssh key på github og får nå meldingen
>Permission denied (publickey)

i devcontaineren når du prøver å nå remote git repository.

* Fix
    - Åpne terminal og kjør kommandoen 

        `sudo apt install keychain socat -y`

    -  Åpne ~/.bash_profile (eller ~/.zprofile hvis du bruker zsh)

        `nano ~/.bash_profile` 
        
        (eller `nano ~/.zprofile` )
    
    - Legg til navnet på ssh key du brukte for repoet på git

        `eval $(keychain --eval --agents ssh <key_rsa>)`

    - Lukk eventuelle åpne VS Code vinduer
    - Lukk WSL terminaler
    - Åpne ny WSL terminal
    - Naviger til repoet
    - Kjør kommandoen

        `code .`
    
    - Gjenåpne repoet i devcontainer inne på VSCode 
    - Prøv å kjøre kommandoen

        `git fetch`

        for å se om ssh key nå fungerer i devcontainer
        
### __Hjelp jeg får ikke til å pinge Github fra WSL__

Mest sannsynlig er det en DNS-feil på WSL.

* Quick fix
    - Åpne /etc/resolv.conf

        `sudo nano /etc/resolv.conf`
    - Modifiser filen sånn at innholdet ser slikt ut:
        ```
        nameserver 8.8.8.8
        nameserver 8.8.4.4
        ```

* Long fix:
    - Åpne /etc/wsl.conf

        `sudo nano /etc/wsl.conf`
    - Se til at filen ser slik ut:
        ```
        [network]
        generateResolvConf = false
        ```
    - Restart WSL
        * Lukk alle WSL vinduene
        * Åpne cmd.exe
        * Kjør kommandoen: 
            
            `wsl --shutdown` 
        * Åpne WSL igjen
    - Lag ny /etc/resolv.conf
        * Fjern linken til /etc/resolv.conf
        
            `sudo rm /etc/resolv.conf`
        * Lag ny fil

            `sudo nano /etc/resolv.conf`
            ```
            nameserver 8.8.8.8
            nameserver 8.8.4.4
            ```