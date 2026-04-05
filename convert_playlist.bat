@echo off
setlocal enabledelayedexpansion

set "input=%USERPROFILE%\Downloads\playlist.txt"
set "output=%USERPROFILE%\Downloads\youtube_links.txt"

if exist "%output%" del "%output%"

for /f "delims=" %%L in (%input%) do (
    set "line=%%L"

    rem Check if the line contains id:
    echo !line! | findstr /C:"id:" >nul
    if !errorlevel! == 0 (
        rem Remove everything before first quote
        for /f tokens^=2^ delims^=^" %%A in ("!line!") do (
            echo https://www.youtube.com/watch?v=%%A>>"%output%"
        )
    )
)

echo Done!
echo Saved to: %output%
pause