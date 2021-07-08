# <a name="toppen"></a> Getting started

- Start [HER](#windows) vis du bruker Windows
- Fortsett guiden for linux og macos

## Sett opp VS Code
1. Last ned og installer VS Code for ditt operativsystem
    - [Windows](https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user)
    - [OSX](https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal)
    - [Debian/Ubuntu](https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64)
    

2. Åpne VS Code og installer extensions
    * Remote - WSL
    * Remote - Containers

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

    OS | Anbefalt
    -|-
    [Ubuntu 20.04 LTS](https://www.microsoft.com/store/apps/9n6svws3rx71) | ☑️
    [Ubuntu 18.04 LTS](https://www.microsoft.com/store/apps/9N9TNGVNDL3Q) | ➖
    [Debian GNU/Linux](https://www.microsoft.com/store/apps/9MSVKQC78PK6) | ➖

9. Åpne WSL2 terminal, sjekk at det fungerer og start fra [toppen](#toppen) av denne readme

# Troubleshooting
### __Hjelp jeg får ikke til å pinge eller pushe til Github fra WSL__
* Forklaring

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