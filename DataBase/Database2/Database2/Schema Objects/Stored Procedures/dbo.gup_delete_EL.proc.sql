﻿CREATE PROCEDURE [dbo].[gup_delete_EL]
	@iOK_		int = 0
AS

BEGIN TRAN
	UPDATE dbo.GItem
		SET DelDate = GETDATE()
			WHERE ItemID IN (129000,129010)
				AND Deleted = 0

	IF @@ERROR <> 0
		BEGIN	SELECT @iOK_ = -3	GOTO FAIL_TRAN	END

COMMIT TRAN

GOTO END_PROC

FAIL_TRAN:
ROLLBACK TRAN

END_PROC:
SELECT @iOK_

