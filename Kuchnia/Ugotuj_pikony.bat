@echo off
setlocal enabledelayedexpansion
chcp 1250 1> nul

:: Œcie¿ka do ImageMagick
set MAGICK_PATH="C:\Program Files\ImageMagick-6.9.3-Q16"

:: Utwórz katalogi
mkdir ugotowane 2> nul
cd ugotowane 2> nul
mkdir BigPicon-transparent-32bit 2> nul
mkdir BigPicon-transparent-8bit 2> nul

echo ===================================
echo \\\ Gotujê pikony przeŸroczyste ///
echo ===================================

:: Przytnij, zmieñ rozmiar i konwertuj do PNG
for %%i in (..\do_ugotowania\*.*) do (
	echo Gotujê "%%~ni"...
	convert -background none "%%i" -trim +repage "BigPicon-transparent-32bit\%%~ni.png"
	for /f %%x in ('identify -ping -format "%%w" "%%i"') do set S=%%x
	for /f %%y in ('identify -ping -format "%%h" "%%i"') do set W=%%y
	set RES=false
	if !S! gtr 220 if !W! gtr 132 set RES=true
	if "!RES!"=="true" %MAGICK_PATH%\convert -background none "BigPicon-transparent-32bit\%%~ni.png" -resize 220x132 -gravity center -extent 220x132 PNG32:"BigPicon-transparent-32bit\%%~ni.png"
	if "!RES!"=="false" %MAGICK_PATH%\convert -background none "BigPicon-transparent-32bit\%%~ni.png" -gravity center -extent 220x132 PNG32:"BigPicon-transparent-32bit\%%~ni.png"
)
:: Wersja 8bit + optymalizacja pngquant
copy /Y BigPicon-transparent-32bit BigPicon-transparent-8bit 1> nul
for %%i in (BigPicon-transparent-8bit\*.png) do ("..\tools\pngquant2.exe" --force --ext .png 256 "%%i" 2> nul)

:: Ok, teraz wersja z t³em
for %%j in (..\tlo\*.png) do (
	echo.
	echo ========================================
	echo \\\ Gotujê pikony z t³em "%%~nj.png" ///
	echo ========================================
	:: Utwórz katalogi
	mkdir "BigPicon-%%~nj-32bit" 2> nul
	mkdir "BigPicon-%%~nj-8bit" 2> nul
	:: Skopiuj pikony utworzone wczeœniej do katralogu roboczego
	copy /Y BigPicon-transparent-32bit "BigPicon-%%~nj-32bit" 1> nul

	:: Zmniejsz logo, zrób cieñ i pod³ó¿ t³o
	for %%i in (BigPicon-transparent-32bit\*.*) do (
		echo Gotujê "%%~ni" na tle "%%~nj.png"...
		%MAGICK_PATH%\convert "%%i" -resize 178x107 ^( +clone -background black -shadow 85x3+3+3 ^) +swap -background none -flatten PNG32:"BigPicon-%%~nj-32bit\%%~ni.png"
		%MAGICK_PATH%\composite -gravity center "BigPicon-%%~nj-32bit\%%~ni.png" "..\tlo\%%~nj.png" PNG32:"BigPicon-%%~nj-32bit\%%~ni.png"
	)
	:: Wersja 8bit + optymalizacja pngquant
	copy /Y BigPicon-%%~nj-32bit BigPicon-%%~nj-8bit 1> nul
	for %%i in (BigPicon-%%~nj-8bit\*.png) do ("..\tools\pngquant2.exe" --force --ext .png 256 "%%i" 2> nul)
)

:: Wróc do katalogu ze skryptem
cd .. 2> nul

echo.
echo ========================
echo \\\ Pikony ugotowane ///
echo ========================

:: Zatrzymaj konsolê
pause