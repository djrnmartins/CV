@echo off
setlocal enabledelayedexpansion

set "input=templates"
if not exist releases mkdir releases

for /f "delims=" %%i in (%input%) do (
    echo Install theme %%i...
    
    echo npm install jsonresume-theme-%%i
    npm install jsonresume-theme-%%i

    echo Generating %%i...
    
    echo .\node_modules\.bin\resume export releases\resume_%%i.html -t %%i
    .\node_modules\.bin\resume export releases\resume_%%i.html -t %%i
    
    echo .\node_modules\.bin\resume export releases\resume_%%i.pdf -t %%i
    .\node_modules\.bin\resume export releases\resume_%%i.pdf -t %%i
)

cd releases
tar -zcvf CV.tar.gz *
