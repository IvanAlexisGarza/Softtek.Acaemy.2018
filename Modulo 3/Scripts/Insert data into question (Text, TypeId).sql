--9
--Insert data into question (Text, TypeId)
--**************************************
use [Survey]
go

create procedure InsertQuestion
(
	@Insert varchar (50),
	@Type int
)
as

insert into Questions(QuestionTypeId, Text)
Values (@Type, @Insert)
go

--**************************************
exec InsertQuestion @Insert = 'Wich one is the one?', @Type = 2
--**************************************



--Moded with try catch for errors
-- Ivan Alexis Garza
-- 1/29/2018
use [Survey]
go

set ANSI_NULLS on
go

set QUOTED_IDENTIFIER on 
go

alter procedure [dbo].[InsertQuestion]
(
	@Insert varchar (50),
	@Type int
)
as
begin transaction

begin try
	insert into Questions(QuestionTypeId, Text)
	Values (@Type, @Insert)
end try

begin catch
		execute GetError
		select @@TRANCOUNT as 'Transaction Count', 'Failed, need rollback' as 'Transaction location'
		if @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
end catch

if @@TRANCOUNT > 0
	commit transaction;
go

--**************************************
exec InsertQuestion @Insert = 'Wich one is the one?', @Type = 2
--**************************************

--USE [Survey]
--GO
--alter PROCEDURE GetError
--AS
---- Check the error code in a catch statement

--    SELECT ERROR_NUMBER() AS ErrorNumber
--     ,ERROR_SEVERITY() AS ErrorSeverity
--     ,ERROR_STATE() AS ErrorState
--     ,ERROR_PROCEDURE() AS ErrorProcedure
--     ,ERROR_LINE() AS ErrorLine
--     ,ERROR_MESSAGE() AS ErrorMessage;


--EXEC GetError