:: 1.Lance la compilation du code source
:: 2. Nettoie le r�pertoire build, renomme dist en "bibliostratus" et y place le raccourci pour le lancement du fichier
:: 3. Compresse le r�pertoire obtenu
:: 4. Supprime le r�pertoire initial "bibliostratus" 
@echo off
set /p version="version: "
pyinstaller main.py
rd /s /q build
copy bibliostratus.bat dist
xcopy /S main\files dist\main\files\
del dist\main\files\preferences.json
xcopy /S main\examples dist\main\examples\
rename dist bibliostratus
"C:\Program Files\7-Zip\7z" a -tzip ..\bin\bibliostratus_%version%_win64_py3.6.zip bibliostratus/
rd /s /q bibliostratus