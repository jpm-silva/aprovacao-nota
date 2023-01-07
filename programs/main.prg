LOCAL lcIni AS String, lcBd AS Bd OF Sgbd
LOCAL ARRAY lcExeInfo(1) AS Variant

ON SHUTDOWN QUIT
SET DELETED ON
SET HOURS TO 24
SET DATE DMY
SET CENTURY ON
SET SAFETY OFF
SET POINT TO ","
SET SEPARATOR TO "."
CURSORSETPROP("MapBinary", .T., 0)

IF UPPER(JUSTFNAME(APPLICATION.SERVERNAME)) <> "VFP9.EXE" THEN
	_SCREEN.WindowState = 2
	_SCREEN.Icon = "AprovacaoNota.ico"
ENDIF
_SCREEN.AddProperty("Aplicativo", "Aprovação de Notas")

IF AGETFILEVERSION(lcExeInfo, SYS(16, 0)) > 0 THEN
	_SCREEN.Caption = _SCREEN.Aplicativo + " - Versão: " + lcExeInfo(11)
ENDIF

lcIni = SYS(5) + CURDIR() + "AprovacaoNota.ini"
lcBd = NEWOBJECT("Bd", "Sgbd")
IF lcBd.ConectarFromIni(lcIni) THEN
	_SCREEN.AddProperty("Bd", lcBd)
ELSE
	MESSAGEBOX("Não foi possível estabelecer comunicação com o banco de dados. Motivo:" + CHR(13) + CHR(13) + lcBd.ErrorMsg, 16, _SCREEN.Aplicativo)
	RETURN
ENDIF

IF Login() THEN
	READ EVENTS
ENDIF
Fim()