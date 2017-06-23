USE TestDB
GO
create table student
(
stdID int check(stdID>0),
name nvarchar(25) not null,
surname nvarchar(25) not null,
age int not null,
phoneNumber nvarchar(20),
constraint student_stdID_pk primary key(stdID)
);

create table Specialty
(
spcID int,
spcName nvarchar(30) not null
);

select * from student

-- Add default constraint with alter function
Alter table student
add constraint student_phone_Default default ('No phone number') for phoneNumber

insert into student(stdID,name,surname,age) values(100,'Ali','Musayev',28);

-- Add default constraint with alter function
alter table student
add constraint student_age_Check
Check(age>0 and age<150)
----------------------
alter table student
add specialtyId int
check (specialtyId>0)

----------------
-- her hansi sutunu modify etmek
alter table Specialty
alter column spcID int not null 

alter table Specialty
add constraint specialty_spcId_pk
primary key(spcID)

alter table student
add constraint student_specialtyId_FK
foreign key(specialtyId) references Specialty(spcID)


-- *** Cascading referential integrity constraint ***
-- Kaskadlama o zaman edilir ki eger foreign key-in bagli oldugu primary key cedveli silinerse o zaman default buna icaze vermir sistem
-- Eger istesek sistem buna icaze versin bu zaman kaskadlamadan istifade edirik
-- Bunun 3 formasi var
-- Set Null -> primary key cedveli ve ya o cedvelde her hansi ID silinse, foreign key-de hemen id-lere uygun deyerler null olacaq avtomatik
-- Default -> Bu zaman ise foreign key cedvelinde uygun IDler default deyeri ne olmalidirsa onu alacaq
-- Cascade -> Bu zaman foreign key-de olan value-da silinecek hansi ki primary key ile uygundur


-- *** CHECK CONSTRAINT *** 


create table test
(
id int identity(1,1) primary key,
name nvarchar(20)
);

select * from test

insert into test VALUES('CCC')
-- Tutaq ki biz cedvelde her hansi Id ni sildik... Eger biz davam etsek bu zaman silinmis id-ni istifade etmeyecek sistem.. Eger silinmis Id-ni manual yazmaq istesek

--meselen Id=1 silek
delete from test where id=1

SET IDENTITY_INSERT test ON 

-- bundan sonra biz lazimi id-ni istifade ede bilerik. Ancaq sorgunu mutlqe asagida kimi yazmaliyiq.. Field-leri qeyd etmeliyik
insert into test(id,name) values(1,'fffff')

-- bundan sonra eger istesek ki identity avtomatik ishlesin onda gerek Identity_insert off edek
SET IDENTITY_INSERT test OFF

-- TESEVVUR EDEK KI CEDVELDEKI BUTUN DATALARI SILIRIK
delete from test
-- bu zaman baxmayaraq ki butun datalar silinib ancaq identity basdan baslamiyacaq.. harda qalmisdisa ordan basliyacaq
-- identity-ni sifirlamaq ucun asaqidaki emrden istifade edirik

DBCC CHECKIDENT(test,reseed,0)

