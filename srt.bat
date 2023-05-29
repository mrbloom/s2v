@echo off

echo HELP:
echo srt PATH_TO_FILES EXT_OF_VIDEO_FILES 

setlocal EnableDelayedExpansion

set "dir=%~1"
set "ext=%~2"


for /r "%dir%" %%f in (*.%ext%) do (	
	set "filename=%%~nf"
    set "nameext=%%~nxf"
    set "pathfile=%%~dpf"

    if exist !pathfile!!filename!.srt (	
		set "pathantislash=!pathfile:~0,-1!"    	
		echo Recognize begins with opts:
		echo ffmpeg -i "%%f" -vf subtitles="!pathfile!!filename!.srt"  "!pathfile!srt_!filename!.mp4" 
		
		rem "subtitles=\'<srt_path>\':force_style='FontName=Z003,PrimaryColour=&HCCFF0000&'"
		
		rem ffmpeg -i "%%f" -vf "subtitles=\'!pathfile!!filename!.srt\':force_style='FontName=Z003,PrimaryColour=&HCCFF0000&'"  "!pathfile!srt_!filename!.mp4"
		ffmpeg -i "%%f" -vf subtitles=!filename!.srt  srt_!filename!.mp4 
    ) else ( 
		echo "!pathfile!!filename!.srt is  not exists"
    )
)

pause