@echo
del Del C:\GESTION\PASAJE\03\*.* /Q\*.TRA
if errorlevel <> 0 goto Error
goto salir
:Error
:Salir
