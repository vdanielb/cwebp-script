================================================================================
                        WEBP BATCH CONVERTER
                            README.txt
================================================================================

WARNING: This script permanently deletes original images after conversion!
         Make sure you have backups before using it.

================================================================================
PREREQUISITES
================================================================================

1. Download cwebp (already included in this repo)
   - Go to: https://developers.google.com/speed/webp/download
   - Download the Windows version
   - Extract to a location (e.g., C:\webp\)

2. Add cwebp to your PATH
   - Press Win + R
   - Type: sysdm.cpl
   - Press Enter
   - Click "Advanced" tab
   - Click "Environment Variables" button
   - Under "User variables", find "Path"
   - Click "Edit"
   - Click "New"
   - Add your cwebp bin folder path (e.g., C:\webp\bin)
   - Click OK on all windows
   - IMPORTANT: Close and reopen any Command Prompt windows

3. Verify installation
   - Open Command Prompt
   - Type: cwebp -version
   - You should see version information

================================================================================
CONFIGURATION
================================================================================

Open convert_to_webp.bat in Notepad and edit these settings:

OPTION 1: Target File Size (Recommended for consistent sizes)
--------------------------------------------------------------
set TARGET_SIZE=500000

Common sizes:
  250000  = 250KB per image
  500000  = 500KB per image
  1000000 = 1MB per image
  2000000 = 2MB per image

The script adjusts compression automatically to reach this target size.

OPTION 2: Fixed Quality (For consistent compression)
-----------------------------------------------------
set TARGET_SIZE=
set QUALITY=85

Leave TARGET_SIZE empty and set QUALITY instead.

Quality values (1-100):
  100 = Best quality, larger files
  85  = High quality (recommended)
  75  = Good quality, smaller files
  50  = Lower quality, much smaller files

================================================================================
HOW TO USE
================================================================================

METHOD 1: Drag and Drop (Easiest)
----------------------------------
1. Drag a folder onto the convert_to_webp.bat file
2. Type Y when asked to confirm
3. Press Enter
4. Wait for conversion to complete

METHOD 2: Command Line
----------------------
1. Open Command Prompt
2. Type: convert_to_webp.bat "C:\path\to\your\images"
3. Replace the path with your actual folder path
4. Type Y to confirm
5. Press Enter

METHOD 3: Interactive
---------------------
1. Double-click convert_to_webp.bat
2. Type or paste the folder path when prompted
3. Press Enter
4. Type Y to confirm
5. Press Enter

================================================================================
WHAT IT DOES
================================================================================

1. Finds all PNG, JPG, and JPEG images in the specified folder
2. Converts each image to WebP format
3. Deletes the original file if conversion succeeds
4. Keeps the original filename (just changes extension to .webp)
5. Shows a count of converted images

================================================================================
