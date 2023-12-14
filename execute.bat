@echo off
Rem To Get the current batch filename and extension 
set batFileName=%0
echo %batFileName% 
Rem Set destination path
set destPath=C:\Users\Public\Documents\Klaric\Config\DatFiles
Rem The folder content will be copied to C:\Users\Public\Documents\Klaric\Config
Rem /E means recursive, /Y Overwrites without request, /I directory as default   
Xcopy %cd% %destPath% /E /Y /I 
Rem Delete copied batch file in destination
del C:\Users\Public\Documents\Klaric\Config\DatFiles\execute.bat