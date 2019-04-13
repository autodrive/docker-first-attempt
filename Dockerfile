# https://github.com/MicrosoftDocs/Virtualization-Documentation/blob/master/windows-container-samples/python/Dockerfile
FROM microsoft/windowsservercore

LABEL Description="Anaconda3" Version="2018.12" maintainer="kangwon@gmail.com"

RUN powershell.exe -Command \
    $ErrorActionPreference = 'Stop'; \
    wget https://repo.continuum.io/archive/Anaconda3-2019.03-Windows-x86_64.exe -OutFile c:\anaconda3.2019.03.exe ; \
    Start-Process c:\anaconda3.2019.03.exe -ArgumentList '/InstallationType=JustMe /AddToPath=1 /RegisterPython=0 /S /D=%UserProfile%\\Anaconda3' -Wait ; \
    Remove-Item c:\anaconda3.2019.03.exe -Force

RUN echo print("Hello World!") > c:\hello.py

CMD ["python", "c:/hello.py"]
