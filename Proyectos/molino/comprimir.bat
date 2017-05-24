@echo
cls
pkzip -ep -t  J:\XSOFTMOLINO\PROYECTOS\MOLINO\Temporal\24051150.ges J:\XSOFTMOLINO\PROYECTOS\MOLINO\Temporal\SECCION.tra
if not errorlevel 0 goto Salir
pause
:Error
:Salir
