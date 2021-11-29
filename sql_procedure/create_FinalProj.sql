create database FinalProj;
use FinalProj;

create table Customers(
customerID varchar(30),
phone varchar(30),
name_ varchar(30),
kindType bool,
PRIMARY kEY (customerID)
);

create table Address(
ID varchar(30),
zip int,
street varchar(30),
state varchar(10),
city varchar(30),
PRIMARY KEY(ID)
);

create table Store(
storeID varchar(30),
PRIMARY KEY(storeID)
);

create table Employee(
employeeID varchar(30),
email varchar(30),
name_ varchar(30),
PRIMARY KEY(employeeID)
);

create table Region(
regionID varchar(30),
regionName varchar(30),
regionManager varchar(30),
PRIMARY kEY(regionID)
);

create table Order_(
orderNumber varchar(30),
date_ date,
totalPrice float,
PRIMARY KEY(orderNumber)
);

create table Products(
productID varchar(30),
kind varchar(10),
price float,
name_ varchar(30),
PRIMARY KEY(productID)
);


create table livesIn(
customerID varchar(30) references Customers(customerID),
ID varchar(30) references Address(ID),
PRIMARY KEY(customerID,ID)
);

create table locateOn(
ID varchar(30) references Address(ID),
storeID varchar(30) references Store(storeID),
PRIMARY KEY(ID,storeID)
);

create table worksIn(
employeeID varchar(30) references Employee(employeeID),
storeID varchar(30) references Store(storeID),
jobTitle varchar(20),
PRIMARY KEY(employeeID,storeID)
);

create table manage(
storeID varchar(30) references Store(storeID),
regionID varchar(30) references Region(regionID),
PRIMARY KEY(storeID,regionID)
);

create table placeOn(
storeID varchar(30) references Store(storeID),
orderNumber varchar(30) references Order_(orderNumber),
PRIMARY KEY(storeID,orderNumber)
);

create table stock(
productID varchar(30) references Product(productID),
storeID varchar(30) references Store(storeID),
quantity int,
PRIMARY KEY(productID,storeID)
);

create table placeOrder(
customerID varchar(30) references Customers(customerID),
orderNumber varchar(30) references Order_(orderNumber),
PRIMARY KEY(customerID,orderNumber)
);

create table contains_(
orderNumber varchar(30) references Order_(orderNumber),
productID varchar(30) references Product(productID),
PRIMARY KEY(orderNumber,productID)
);

create table helpOn(
employeeID varchar(30) references Employee(employeeID),
orderNumber varchar(30) references Order_(orderNumber),
PRIMARY KEY(employeeID,orderNumber)
);

create table SlivesIn(
ID varchar(30) references Address(ID),
employeeID varchar(30) references Employee(employeeID)
);

