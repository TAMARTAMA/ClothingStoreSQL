create database storeClothes
create table City
(
CityId int  constraint city_id_pk  primary key identity(1,1),
CityName nvarchar (25) constraint city_name_unique unique constraint city_id_null not null 
)
create table Seller
(SellerId int constraint seller_id_pk primary key identity(1,1),
SellerFirstName nvarchar (25) constraint seller_namef_null  not null,
SellerLastName nvarchar (25) constraint seller_namel_null  not null,
SalaryHour int constraint salary_check  check(SalaryHour between 0 and 100000),
CityId int constraint city_id_pf references City(CityId),
SelManager int constraint sel_id_pf references Seller(SellerId),
)
create table Customer
(
CustomerId int constraint cus_id_pk primary key identity(1,1),
CusFirstName nvarchar (25) constraint cus_namef_null  not null,
CusLastName nvarchar (25) constraint cus_namel_null  not null,
CityId int constraint cityc_id_pf references City(CityId),
Adress nvarchar(50) constraint Adress_null  not null
)
create table Model--דגמים
(ModelName nvarchar(30) constraint name_model_uq  unique,
CategoryId int constraint model_catid_pf references Category(CategoryId),
Color nvarchar(30) ,
Price int  constraint price_model_null  not null,
ModelId int constraint model_id_pk primary key identity(1,1))
create table Size
(ModelId int constraint model_size_id_pf references Model(ModelId),
Inventory int constraint amount_check  check(Inventory between 0 and 100000),
Size int constraint size_check check(Size between 0 and 60),
SizeId int constraint size_id_pk primary key identity(1,1))
create table Category
(CategoryName nvarchar(20) constraint name_category_null  not null,
CategoryId int constraint category_id_pk primary key identity(1,1))
create table Orders
(SellerId int constraint sel_order_id_pk references Seller(SellerId),
CustomerId int constraint cusorder_id_pf references Customer(CustomerId),
OrderId int constraint order_id_pk primary key identity(1,1),
DateOrder date constraint  date_order_ch check(DateOrder <= getdate()))


create table orderDetail
(Amount int constraint amount_check_order  check(Amount between 1 and 100000),
orderDetailId int constraint orderDetail_id_pk primary key identity(1,1),
OrderId int constraint order_id_pf references Orders(OrderId),
SizeId int constraint orDetailmodel_id_pf references Size(SizeId))
