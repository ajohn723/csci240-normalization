This is a school database, with five tables. PERSON contains both STUDENT and TEACHER but I was unsure of how to represent that in a spreadsheet. 

It is in 3NF because it is in 1NF and 2NF, and there are no transitive dependencies. In the CLASS table, each attribute depends only on the primary key of CLASSID, and so there are no transitive depedencies. 

PERSON
- PK: PERSONID, STUDENTID/TEACHERID
- contains PERSONID, STUDENTID, TEACHERID, BIRTHDATE

	STUDENT
	- PK: STUDENTID
	- FK: HOMEROOMTEACHERID, HOMEROOMCLASSROOMID
	- contains STUDENTID, FIRSTNAME, LASTNAME, HOMEROOMTEACHERID, HOMEROOMCLASSROOMID

	TEACHER
	- PK: TEACHERID
	- contains TEACHERID, FIRSTNAME, LASTNAME
CLASS
	- PK: CLASSID
 	- contains CLASSID, CLASSNAME, GRADELEVEL, DESCRIPTION, DEPARTMENT
SECTION
	- PK: SECTIONID
	- FK: CLASSID, TEACHERID
	- contains SECTIONID, CLASSID, ROOMNUMBER, TEACHERID

STUDENT would also contain the foreign key of SECTIONID but I am unsure of how to represent that in the spreadsheet. The forign key would represent classes taken. 
