@echo off
setlocal enabledelayedexpansion

set "input=templates"
if not exist releases mkdir releases

for /f "delims=" %%i in (%input%) do (
    echo Install theme %%i...
    
    echo npm install jsonresume-theme-%%i
    npm install jsonresume-theme-%%i

    echo Generating %%i...
    
    echo resume export releases\resume_%%i.html -t %%i
    resume export releases\resume_%%i.html -t %%i
    
    echo resume export releases\resume_%%i.pdf -t %%i
    resume export releases\resume_%%i.pdf -t %%i
)
