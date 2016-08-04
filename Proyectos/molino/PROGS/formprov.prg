LOCAL oFormWin

oFormWin = CREATEOBJECT("base")
oFormWin.Visible = .t.

oFormWin.AddObject("_oprovincia","_ogroup_noenter")
oFormWin._oprovincia.Visible = .t.
stop()

RELEASE oFormWin
