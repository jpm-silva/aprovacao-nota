LOCAL lcBd AS Bd OF Sgbd

IF VARTYPE(_SCREEN.Bd) = "O" THEN
	lcBd = _SCREEN.Bd
	lcBd.Desconectar()
	
	_SCREEN.Bd = NULL
	REMOVEPROPERTY(_SCREEN, "Bd")
ENDIF

IF VARTYPE(_SCREEN.UsuarioInfo) = "O" THEN
	_SCREEN.RemoveObject("UsuarioInfo")
ENDIF

SET SYSMENU TO DEFAULT
CLOSE DATABASES ALL
CLEAR EVENTS