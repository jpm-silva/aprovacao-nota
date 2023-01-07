LOCAL lcSucesso AS String, lcUsuarioInfo AS UsuarioInfo OF UserControls

DO FORM frmLogin TO lcSucesso
IF lcSucesso THEN
	DO Menu.mpr
	
	SET CLASSLIB TO UserControls ADDITIVE
	_SCREEN.AddObject("UsuarioInfo", "UsuarioInfo")
	lcUsuarioInfo = _SCREEN.UsuarioInfo
	lcUsuarioInfo.txtUsuario.Value = Usuario.Login
	lcUsuarioInfo.txtData.Value = DATETIME()
	IF NOT ISNULL(Usuario.Foto) THEN
		lcUsuarioInfo.imgFoto.PictureVal = Usuario.Foto
		lcUsuarioInfo.imgSemFoto.Visible = .F.
	ELSE
		lcUsuarioInfo.imgSemFoto.Visible = .T.
	ENDIF
	lcUsuarioInfo.Left = 10
	lcUsuarioInfo.Top = _SCREEN.Height - lcUsuarioInfo.Height - 10
	lcUsuarioInfo.Visible = .T.
ENDIF
RETURN lcSucesso