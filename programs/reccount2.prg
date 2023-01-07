LPARAMETERS lpCursor AS String, lpIgnoreDeleted AS Boolean
LOCAL lcCount AS Integer, lcSelect AS Integer, lcRecno AS Integer

lcCount = 0
IF NOT lpIgnoreDeleted THEN
	lcCount = RECCOUNT(lpCursor)
ELSE
	lcSelect = SELECT()
	IF USED(lpCursor) THEN
		SELECT (lpCursor)
		lcRecno = RECNO(lpCursor)
		COUNT FOR NOT DELETED() TO lcCount
		IF lcRecno <= RECCOUNT(lpCursor) THEN
			GO lcRecno IN (lpCursor)
		ENDIF
		IF NOT EMPTY(lcSelect) THEN
			SELECT(lcSelect)
		ENDIF
	ENDIF
ENDIF
RETURN lcCount