/* EXERCISE 2 */

CREATE TABLE PET_OWNER (
OwnerID int not null,
OwnerLastName varchar(255),
OwnerFirstName varchar(255),
OwnerPhone int not null,
OwnerEmail varchar(255)
Constraint OwnerIDPrim_FK primary key (OwnerID)
)


Create table Pet (
PetID int not null,
PetName varchar(255),
PetType varchar(255),
PetBreed varchar(255),
PetDOB char(10),
PetWeight int,
OwnerId int,
Constraint OwnerID_FK foreign key(OwnerId) references PET_OWNER(OwnerId),
Constraint PetID_FK primary key (PetID)
)

INSERT INTO PET_OWNER(OwnerID,OwnerFirstName,OwnerLastName,OwnerPhone,OwnerEmail) 
Values (0,'Gunnar', 'Helgason','22229633','ggh@email.com')

INSERT INTO PET(PetID,PetName,PetType,PetBreed,PetDOB,PetWeight,Owner_ID) VALUES (0,'Turtle','Dog','HotDog','01-12-2015',10,0)

delete Pet
delete PET_OWNER



/* EXERCISE 3 */

CREATE TABLE INVOICE (
InvoiceNumber int not null,
InvoiceDate date,
SubTotal decimal,
TaxPct decimal,
Total decimal
Constraint Invoice_FK primary key (InvoiceNumber)
)

CREATE TABLE LINE_ITEM (
Invoice_Number int,
LineNumber int,
ProductNumber int,
Quantity int,
Unitprice decimal,
Total decimal,
Constraint LinePrimKey_FK primary key (Invoice_Number, LineNumber),
Constraint InvoiceFrgn_FK foreign key(Invoice_Number) references INVOICE(InvoiceNumber)
)

CREATE TABLE PRODUCT (
ProductNumber int not null,
ProductType varchar(255),
ProductDescription varchar(255),
Unitprice decimal,
Constraint ProduNumb_FK primary key (ProductNumber)
)

/* EXERCISE 4 */

CREATE TABLE SEMINAR (
SeminarID int not null,
SeminarDate date,
Location varchar(255),
SeminarTitle varchar(255),
Constraint SeminarID_FK primary key (SeminarID)
)

CREATE TABLE ZIP_CITY (
Zip int not null,
City varchar(100),
Constraint ZIP_FK primary key (Zip)
)

CREATE TABLE CUSTOMER (
CustomerID int not null,
FirstName varchar(255),
LastName varchar(255),
Street varchar(255),
Zip int,
Constraint CustPrimKey_FK primary key (CustomerID),
constraint ZipFrgn_FK foreign key(Zip) references ZIP_CITY(Zip)
)

CREATE TABLE SEMINAR_CUSTOMER (
SeminarID int,
CostumerID int,
constraint SeminarCustomerPrimKey_FK primary key (SeminarID, CostumerID),
constraint SemIdFrg_FK foreign key(SeminarID) references SEMINAR(SeminarID),
constraint CostIdFrg_FK foreign key(CostumerID) references CUSTOMER(CustomerID)
)


