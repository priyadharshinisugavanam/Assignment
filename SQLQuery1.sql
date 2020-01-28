CREATE TABLE PROGRAMMER
(
id numeric(3) not null PRIMARY KEY,
Name varchar(8) not null ,
DOB date,
DOJ date,
Sex varchar(1),     
Prof1 varchar(8),
Prof2 varchar(8),
Salary int not null,
)
INSERT INTO PROGRAMMER(id,Name, DOB, DOJ, Sex, Prof1, Prof2, Salary)
VALUES (1,'Somdutt', '21-Apr-98', '21-Apr-18', 'm', 'java', 'basic', 3200);
INSERT INTO PROGRAMMER(id,Name, DOB, DOJ, Sex, Prof1, Prof2, Salary)
VALUES (12,'Priya', '16-Sep-98', '22-Apr-19', 'm', 'dotnet', 'cobal', 6000);
INSERT INTO PROGRAMMER(id,Name, DOB, DOJ, Sex, Prof1, Prof2, Salary)
VALUES (22,'Lavi', '16-Apr-99', '20-Apr-18', 'm', 'pascal', 'c++', 3500);
INSERT INTO PROGRAMMER(id,Name, DOB, DOJ, Sex, Prof1, Prof2, Salary)
VALUES (2,'Mary', '21-Apr-95', '21-Sep-17', 'm', 'dotnet', 'cobal', 6000);
INSERT INTO PROGRAMMER(id,Name, DOB, DOJ, Sex, Prof1, Prof2, Salary)
VALUES (13,'Asihu', '31-Aug-94', '30-Apr-11', 'f', 'clipper', 'pascal', 4000);
INSERT INTO PROGRAMMER(id,Name, DOB, DOJ, Sex, Prof1, Prof2, Salary)
VALUES (20,'Vishnu', '28-Feb-99', '20-Jan-19', 'm', 'c', 'dotnet', 3300);
INSERT INTO PROGRAMMER(id,Name, DOB, DOJ, Sex, Prof1, Prof2, Salary)
VALUES (16,'Rama', '10-Jan-92', '21-Apr-17', 'm', 'java', 'basic', 3200);
INSERT INTO PROGRAMMER(id,Name, DOB, DOJ, Sex, Prof1, Prof2, Salary)
VALUES (5,'Ankitha', '02-Dec-91', '22-Apr-16', 'f', 'cobal', 'c', 3100);
INSERT INTO PROGRAMMER(id,Name, DOB, DOJ, Sex, Prof1, Prof2, Salary)
VALUES (3,'malini', '01-May-93', '20-Apr-16', 'm', 'python', 'basic', 3200);
select* from PROGRAMMER;
use Assignment1
drop table PROGRAMMER

/*CREATE PROCEDURE PROCEDURES
@programmerName varchar(8),
@DOB date,
@DOJ date,
@Sex varchar(1),
@Prof1 varchar(8),
@Prof2 varchar(8),
@Salary int ,
@Action numeric(1)

as
BEGIN
	--INSERT
	 IF @Action=1
	 BEGIN
		INSERT INTO PROGRAMMER(Name, DOB, DOJ, Sex, Prof1, Prof2, Salary) VALUES (@programmerName,@DOB, @DOJ, @Sex,@Prof1, @Prof2, @Salary)
	 END

	

	 
END
Create procedure Proceduress
@Action Int
as
BEGIN
	--INSERT
	 IF @Action=2
	 BEGIN
	

	Select * from PROGRAMMER
end
end
Create procedure Procedurs
@programmerName varchar(8),
@DOB date,
@DOJ date,
@Sex varchar(1),
@Prof1 varchar(8),
@Prof2 varchar(8),
@Salary int ,
@Action numeric(1),
@ename varchar(8)
as
BEGIN
	--INSERT
	 IF @Action=4
	 BEGIN
	 UPDATE Programmer set Name=@programmerName ,DOB=@DOB ,DOJ=@DOJ,Prof1=@Prof1,Prof2=@Prof2,Salary=@Salary where Name=@ename

	 end
	 end

Create procedure Procedurss
@programmerName varchar(8),
@Action numeric(1)
as
BEGIN
	--INSERT
	 IF @Action=3
	 BEGIN
	 Delete from PROGRAMMER where name=@programmerName

	 end
	 end



Drop Procedure Procedurss*/
CREATE VIEW Id_greaterthan_5 AS
SELECT * from PROGRAMMER
WHERE id > 18;
select * from Id_greaterthan_5

SELECT * FROM EligibleList
CREATE TABLE PROGRAMMERAUDIT
(
Name Varchar(20),
AUDITDATA VARCHAR(50)
)

SELECT * FROM PROGRAMMER
SELECT * FROM PROGRAMMERAUDIT
drop table PROGRAMMERAUDIT
CREATE TRIGGER TR_TABLE_FORINSERT
ON PROGRAMMER
FOR INSERT
AS
BEGIN
	DECLARE @Id NUMERIC(20)
	
	SELECT @Id=id FROM INSERTED
	INSERT INTO PROGRAMMERAUDIT VALUES('PROGRAMMER id='+CAST(@id AS VARCHAR(5)),'IS ADDED AT'+CAST(GETDATE() AS varchar(20)))
END
Insert into programmer(id,name,DOB,DOJ,Prof1,Prof2,Salary)values(37,'naveen','22-Apr-1999','22-May-1999','c#','java',50000)
drop trigger TR_TABLE_FORINSERT
select * from PROGRAMMERAUDIT
drop table PROGRAMMERAudit

CREATE TRIGGER TR_TABLE_FORDELETE
ON PROGRAMMER
FOR DELETE
AS
BEGIN
	DECLARE @Id NUMERIC(20)
	
	SELECT @Id=id FROM deleted
	INSERT INTO PROGRAMMERAUDIT VALUES('PROGRAMMER id='+CAST(@id AS VARCHAR(5)),'IS deleted AT'+CAST(GETDATE() AS varchar(20)))
END
delete from PROGRAMMER where id=37

CREATE TRIGGER TR_TABLE_FORUPDATE
ON PROGRAMMER
FOR UPDATE
AS
BEGIN
	DECLARE @Id NUMERIC(3)
    DECLARE @NAME varchar(8)
	DECLARE @ONAME varchar(8)
	DECLARE @PROF1 varchar(8)
	DECLARE @OPROF1 varchar(8)
	DECLARE @PROF2 varchar(8)
	DECLARE @OPROF2 varchar(8)
	DECLARE @SALARY NUMERIC(8)
	DECLARE @OSALARY NUMERIC(8)
	DECLARE @AUDITSTRING varchar(1000)

	
	SELECT * INTO #TEMPTABLE FROM inserted
	WHILE(EXISTS(SELECT ID FROM #TEMPTABLE))
	
	BEGIN
	SET @AUDITSTRING=''
	SELECT TOP 1 @Id=Id,@NAME=NAME,@PROF1=PROF1,@PROF2=PROF2,@SALARY=SALARY FROM #TEMPTABLE
	SELECT @ONAME=NAME,@OPROF1=PROF1,@OPROF2=PROF2,@OSALARY=SALARY FROM deleted WHERE id=@ID
	SET @AUDITSTRING='ID '+CAST(@ID AS varchar(4))+' CHANGED '
	IF(@ONAME<>@NAME)
		SET @AUDITSTRING=@AUDITSTRING+' NAME FROM '+@ONAME+' TO ' +@NAME
	
	IF(@OPROF1<>@PROF1)
		SET @AUDITSTRING=@AUDITSTRING+'PROF1  FROM '+@OPROF1+' TO '+@PROF1
	IF(@OPROF2<>@PROF2)
		SET @AUDITSTRING=@AUDITSTRING+'PROF2  FROM '+@OPROF2+' TO '+@PROF2
	IF(@OSALARY<>@SALARY)
		SET @AUDITSTRING=@AUDITSTRING+'SALARY FROM'+CAST(@OSALARY AS varchar(10))+'TO'+ CAST(@SALARY AS varchar(10))


	INSERT INTO PROGRAMMERAUDIT VALUES('Updated string',@AUDITSTRING)
	DELETE FROM #TEMPTABLE WHERE Id=@ID
	END
END
 
drop trigger TR_TABLE_FORUPDATE
UPDATE PROGRAMMER SET NAME='Pavi' WHERE ID=3




CREATE VIEW UserHistory AS
	SELECT FirstName, DOB, Sex, MobileNo FROM UserDetails WHERE Roles = 'Admin'

	SELECT * FROM UserHistory

	Sp_Rename UserHistory , HistoryOfUser
	SELECT * FROM HistoryOfUser

	Sp_Helptext HistoryOfUser

	DROP VIEW UserHistorys

CREATE TABLE StudentApproval 
(name Varchar(20),
addr Varchar(15)
)
INSERT INTO Student values('Priya','Salem',13,'7708565343')
ENABLE TRIGGER INSERT_AUDIT ON Student
  ALTER TABLE STUDENT ENABLE TRIGGER INSERT_AUDIT
  DISABLE TRIGGER INSERT_AUDIT ON STUDENT
  ALTER TABLE STUDENT DISABLE TRIGGER INSERT_AUDIT
  CREATE TRIGGER INSERT_INSTEAD
  on Student
  INSTEAD OF INSERT
  AS
  BEGIN 
  INSERT INTO StudentApproval values('Priya','Salem')
  END








update
CREATE TRIGGER TR_TABLE_FORUPDATE
ON PROGRAMMER
FOR UPDATE
AS
BEGIN
	DECLARE @Id NUMERIC(3)
    DECLARE @NAME varchar(8)
	DECLARE @ONAME varchar(8)
	DECLARE @PROF1 varchar(8)
	DECLARE @OPROF1 varchar(8)
	DECLARE @PROF2 varchar(8)
	DECLARE @OPROF2 varchar(8)
	DECLARE @SALARY NUMERIC(8)
	DECLARE @OSALARY NUMERIC(8)
	DECLARE @AUDITSTRING varchar(1000)

	
	SELECT * INTO #TEMPTABLE FROM inserted
	WHILE(EXISTS(SELECT ID FROM #TEMPTABLE))
	
	BEGIN
	SET @AUDITSTRING=''
	SELECT TOP 1 @Id=Id,@NAME=NAME,@PROF1=PROF1,@PROF2=PROF2,@SALARY=SALARY FROM #TEMPTABLE
	SELECT @ONAME=NAME,@OPROF1=PROF1,@OPROF2=PROF2,@OSALARY=SALARY FROM deleted WHERE id=@ID
	SET @AUDITSTRING='ID '+CAST(@ID AS varchar(4))+' CHANGED '
	IF(@ONAME<>@NAME)
		SET @AUDITSTRING=@AUDITSTRING+' NAME FROM '+@ONAME+' TO ' +@NAME
	
	IF(@OPROF1<>@PROF1)
		SET @AUDITSTRING=@AUDITSTRING+'PROF1  FROM '+@OPROF1+' TO '+@PROF1
	IF(@OPROF2<>@PROF2)
		SET @AUDITSTRING=@AUDITSTRING+'PROF2  FROM '+@OPROF2+' TO '+@PROF2
	IF(@OSALARY<>@SALARY)
		SET @AUDITSTRING=@AUDITSTRING+'SALARY FROM'+CAST(@OSALARY AS varchar(10))+'TO'+ CAST(@SALARY AS varchar(10))


	INSERT INTO PROGRAMMERAUDIT VALUES('Updated string',@AUDITSTRING)
	DELETE FROM #TEMPTABLE WHERE Id=@ID
	END
END
 





CREATE TABLE VoterList
(
voterId VARCHAR(10),
name VARCHAR(15) NOT NULL,
mobileNumber VARCHAR(15) UNIQUE,
age int,
);

INSERT INTO VoterList (voterId,name,mobileNumber,age) VALUES('1656465456','Gowtham','9876543210',20)
INSERT INTO VoterList (voterId,name,mobileNumber,age) VALUES('1656465451','Kowsalya','9876543216',16)
INSERT INTO VoterList (voterId,name,mobileNumber,age) VALUES('1656461453','Priya','9876543014',21)
INSERT INTO VoterList (voterId,name,mobileNumber,age) VALUES('27','Anisha','98765904',131)
DELETE FROM VoterList WHERE voterId = '1656461456';
UPDATE VoterList SET name = 'Monisha' where voterId = '1656461453';
	SELECT * FROM VOTERLIST

---------------------------------------------------------------------------------------------------------------																				
--VIEWS

CREATE VIEW EligibleList AS
SELECT voterId,name,mobileNumber,age FROM VOTERLIST
WHERE age > 18;

SELECT * FROM EligibleList

---------------------------------------------------------------------------------------------------------------
--INSERT TRIGGER

CREATE TRIGGER AfterInsert
ON VOTERLIST
FOR INSERT
AS
BEGIN
	DECLARE @voterId int
	select @voterId = voterId from inserted
	INSERT INTO TriggerDemo_History (voterid,modifiedAt) VALUES (cast(@voterid as nvarchar(10)),'Inserted at ' + CAST(GETDATE() as varchar(50)))
END

---------------------------------------------------------------------------------------------------------------

DISABLE TRIGGER AfterInsert ON VOTERLIST;  

--DELETE TRIGGER	
CREATE TRIGGER AfterDelete
ON VOTERLIST
FOR DELETE
AS
BEGIN
	DECLARE @voterId int
	select @voterId = voterId from deleted
	INSERT INTO TriggerDemo_History (voterid,modifiedAt) VALUES (cast(@voterid as nvarchar(10)),'Deleted at '+ CAST(GETDATE() as varchar(50)))
END

---------------------------------------------------------------------------------------------------------------
DISABLE TRIGGER AfterDelete ON VOTERLIST;  

CREATE TABLE TriggerDemo_History
(
voterid varchar(10),
modifiedAt varchar(50)
);

SELECT * FROM TriggerDemo_History

---------------------------------------------------------------------------------------------------------------
CREATE trigger AFTERINSERTT
on VOTERLIST
Instead Of Insert  
as  
Begin  
Declare @voterId VARCHAR(10)  
Select @voterId = voterId from inserted
DECLARE @age int
SELECT @age = age from INSERTED
if(@age > 100)  
Begin  
Raiserror('Invalid Age (Maxinum Age) . Statement Terminated OK', 16, 1)  
return  
End  
else if(@age < 0)  
Begin  
Raiserror('Invalid Age (Mininum Age) . Statement Terminated OK', 16, 1)  
return  
End   
else 
BEGIN
	INSERT INTO TriggerDemo_History VALUES(@voterId,Cast(getdate()as varchar(50)))
END
--Select voterId,name,mobileNumber,age, @voterId from inserted  
End

create table ProgrammerApproval(
Name  varchar(8) not null ,
Prof2 varchar(4) 
)
select * from ProgrammerApproval
  CREATE TRIGGER INSERT_INSTEAD
  on programmer
  INSTEAD OF INSERT
  AS
  BEGIN 
  INSERT INTO ProgrammerApproval values('Lavi','c#')
  END
  Drop trigger INSERT_INSTEAD
  INSERT INTO PROGRAMMER(id,Name, DOB, DOJ, Sex, Prof1, Prof2, Salary)
VALUES (55,'malini', '01-May-93', '20-Apr-16', 'm', 'python', 'basic', 3200);
select * from PROGRAMMER

CREATE TRIGGER UPDATE_INSTEAD
  on ProgrammerApproval
  INSTEAD OF UPDATE
  AS
  BEGIN 
  DECLARE @ID INT
    SELECT @ID = id
    FROM PROGRAMMER

  UPDATE PROGRAMMER set id =ID
    FROM INSERTED
  END
  update PROGRAMMER set id=99 where id=22
  select * from ProgrammerApproval
-------------------------------------------------------------------------------------------------------------------------------
--Temporary user defined table
  Declare @Programmer_table TABLE(
  Name varchar(18),
  id numeric(8)
  )

  INSERT into @Programmer_table
  select name,id from programmer where id=1

  select* from @Programmer_table
-------------------------------------------------------------------------------------------------------------------------------
--user defined function 
  create  function userDefinedTabel(
  @model_prof2 varchar(8)
  )
  
  returns table
  as
  return
	select
		name,salary from programmer where prof2=@model_prof2

  select * from userDefinedTabel('c++')

-------------------------------------------------------------------------------------------------------------------------------
Multi valued user defined function
Create  function userDefined()
returns @Programmers table(
name varchar(12),
prof2 varchar(13),
programmer_trype varchar(20)
)

As
Begin

insert into @Programmers

Select name,prof2,'devop' from PROGRAMMER
return
end
select * from userDefined()
-------------------------------------------------------------------------------------------------------------------------------
--table variable in user defined function
CREATE FUNCTION UDFSplit(
    @string VARCHAR(MAX), 
    @delimiter VARCHAR(50) = ' ')
RETURNS @parts TABLE
(    
idx INT IDENTITY PRIMARY KEY,
val VARCHAR(MAX)   
)
AS
BEGIN
 
DECLARE @index INT = -1;
 
WHILE (LEN(@string) > 0) 
BEGIN 
    SET @index = CHARINDEX(@delimiter , @string)  ;
    
    IF (@index = 0) AND (LEN(@string) > 0)  
    BEGIN  
        INSERT INTO @parts 
        VALUES (@string);
        BREAK  
    END 
 
    IF (@index > 1)  
    BEGIN  
        INSERT INTO @parts 
        VALUES (LEFT(@string, @index - 1));
        
        SET @string = RIGHT(@string, (LEN(@string) - @index));  
    END 
    ELSE
    SET @string = RIGHT(@string, (LEN(@string) - @index)); 
    END
RETURN
END


-- Calls the UDFSplit() function:
SELECT * FROM UDFSplit('priya,lavi,aishu',',');