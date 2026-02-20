@echo off
REM Batch convert images to WebP format and delete originals
REM Usage: convert_to_webp.bat "C:\path\to\folder"
REM Or drag and drop a folder onto this .bat file

setlocal enabledelayedexpansion

REM Set the target file size in bytes (e.g., 500000 = 500KB, 1000000 = 1MB)
REM Leave empty to use quality setting instead
set TARGET_SIZE=

REM Set the quality (0-100, only used if TARGET_SIZE is empty)
set QUALITY=85

REM Set the path to cwebp
set CWEBP_PATH=cwebp

REM Get the folder path from command line argument or ask user
if "%~1"=="" (
    set /p TARGET_FOLDER="Enter the folder path to convert: "
) else (
    set TARGET_FOLDER=%~1
)

REM Remove quotes if present
set TARGET_FOLDER=%TARGET_FOLDER:"=%

REM Check if folder exists
if not exist "%TARGET_FOLDER%" (
    echo Error: Folder does not exist: %TARGET_FOLDER%
    pause
    exit /b 1
)

echo.
echo Target folder: %TARGET_FOLDER%

REM Display current settings
if not "%TARGET_SIZE%"=="" (
    set /a SIZE_KB=%TARGET_SIZE% / 1000
    echo Target file size: !SIZE_KB!KB per image
) else (
    echo Quality: %QUALITY%
)

echo.
echo WARNING: This will DELETE all original images after conversion!
echo.
set /p CONFIRM="Are you sure you want to continue? (Y/N): "
if /i not "%CONFIRM%"=="Y" (
    echo Cancelled.
    pause
    exit /b 0
)

cd /d "%TARGET_FOLDER%"

echo.
echo Converting images to WebP format...
echo.

set COUNT=0

REM Convert PNG files
for %%f in (*.png *.PNG) do (
    if exist "%%f" (
        echo Converting: %%f
        if not "%TARGET_SIZE%"=="" (
            %CWEBP_PATH% "%%f" -size %TARGET_SIZE% -o "%%~nf.webp"
        ) else (
            %CWEBP_PATH% "%%f" -q %QUALITY% -o "%%~nf.webp"
        )
        if !errorlevel! equ 0 (
            del "%%f"
            set /a COUNT+=1
        ) else (
            echo Failed to convert: %%f
        )
    )
)

REM Convert JPG/JPEG files
for %%f in (*.jpg *.jpeg *.JPG *.JPEG) do (
    if exist "%%f" (
        echo Converting: %%f
        if not "%TARGET_SIZE%"=="" (
            %CWEBP_PATH% "%%f" -size %TARGET_SIZE% -o "%%~nf.webp"
        ) else (
            %CWEBP_PATH% "%%f" -q %QUALITY% -o "%%~nf.webp"
        )
        if !errorlevel! equ 0 (
            del "%%f"
            set /a COUNT+=1
        ) else (
            echo Failed to convert: %%f
        )
    )
)

echo.
echo Conversion complete! Converted and deleted %COUNT% original images.
echo WebP files are in: %TARGET_FOLDER%
echo.
pause