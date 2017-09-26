
--Table Supplier
--Only one Primary Key
create table Supplier(
id_supplier int,
name varchar(25),
descript varchar(100),
comercial_name varchar(25),
contact_person varchar(25),
comment varchar(200),
addr varchar(25),
city varchar(25),
country varchar(25)
primary key (id_supplier));

alter table Supplier 
drop column city;

alter table Supplier
drop column country;

alter table Supplier
add id_city int;

alter table Supplier
add id_country int;

alter table Supplier
add foreign key (id_city)
references City (id_city);

alter table Supplier
add foreign key (id_country)
references Country(id_country);






--Table JewellryItem
create table JewellryItem(
id_item int,
name varchar(25),
descript varchar(100),
comment varchar(200),
jewellry_type int,
id_price int,
id_preciousstone int,
id_material int,
id_fashioncompany int,
id_style int,
id_color int,
id_shape int,
id_famouspersonality int,
id_customercategory int,
id_movietrend int,
id_bodypart int,
id_age_era int,
id_holiday int,
id_jewellrytype int,
id_metal int
primary key (id_item),
foreign key(id_price) references Price,
foreign key (id_preciousstone) references PreciousStone,
foreign key (id_material) references Material,
foreign key (id_fashioncompany) references FashionCompany,
foreign key (id_style) references Style,
foreign key (id_color) references Color,
foreign key (id_shape) references Shape,
foreign key (id_famouspersonality) references FamousPersonality,
foreign key (id_movietrend) references MovieTrend,
foreign key (id_bodypart) references BodyPart,
foreign key (id_age_era) references AgeEra,
foreign key (id_holiday) references Holiday,
foreign key (id_jewellrytype) references JewellryType,
foreign key(id_metal) references Metal);

--Relationship Table Supplier-Jewellry Item
--SupplierItem
create table SuplierItem(
id_supplier int,
id_item int,
purchase_cost decimal(9,2),
purchase_date timestamp,
descript nvarchar(100),
comment nvarchar(200)
primary key (id_supplier, id_item),
foreign key (id_supplier) references Supplier,
foreign key (id_item) references JewellryItem);

--Table Warehouse
create table Warehouse(
id_warehouse int,
name_warehouse nvarchar(25),
manager int,
addr varchar(25),
zip_code nchar(10),
city varchar(25),
country varchar(25),
descript nvarchar(100),
comment nvarchar(200)
primary key(id_warehouse));

alter table Warehouse
drop column city;

alter table Warehouse
drop column country;

alter table Warehouse
add id_city int;

alter table Warehouse
add id_country int;

alter table Warehouse
add foreign key (id_city)
references City (id_city);

alter table Warehouse
add foreign key (id_country)
references Country (id_country);






--Relationship Table Warehouse-JewellryItem
--WarehouseItem
create table WarehouseItem(
id_warehouse int,
id_item int,
quant_available int,
last_sale_date timestamp
primary key(id_warehouse,id_item),
foreign key(id_warehouse) references Warehouse,
foreign key (id_item) references JewellryItem);


--Table Store
create table Store(
id_store int,
name nvarchar(25),
addr nvarchar(25),
zip_code nchar(10),
city nvarchar(25),
country nvarchar(25),
manager int,
descript nvarchar(100),
comment nvarchar(200)
primary key(id_store));

alter table Store
drop column city;

alter table Store 
drop column country;

alter table Store
add id_city int;

alter table Store
add id_country int;

Alter table Store
add foreign key (id_city)
references City (id_city);

alter table Store
add foreign key (id_country)
references Country (id_country);



--Relationship Table for Store and Warehouse
--WarehouseStore
create table WarehouseStore(
id_warehouse int,
id_store int
primary key(id_warehouse, id_store),
foreign key (id_warehouse) references Warehouse,
foreign key (id_store) references Store);


--Table Sale
create table Sale(
id_sale int,
date_sale timestamp,
id_customer int,
id_employee int,
id_store int,
sale_amount decimal(9,2),
tax decimal(9,2),
quantity_items int
primary key(id_sale),
foreign key(id_customer) references Customer,
foreign key(id_employee) references Employee,
foreign key(id_store) references Store);

--Table SaleJewellryItem
--Relationship between sales and JewellryItem
create table SaleJewellryItem(
id_sale int,
id_item int
primary key(id_sale,id_item),
foreign key(id_sale) references Sale,
foreign key(id_item) references JewellryItem);

drop table Customer;
--Table Customer
create table Customer(
id_customer int,
name varchar(25),
last_name varchar(25),
company varchar(25),
profession varchar(25),
email varchar(25),
phone nchar(10),
zip_code nchar(10),
addr varchar(25),
city int,
country int,
birthdate date,
price_category varchar(25),
descript varchar(100),
comment varchar(200)
primary key(id_customer));

drop table Customer;

alter table Customer
  drop column country;

  alter table Customer
  add id_country int;


--Table Employee
create table Employee(
id_employee int,
name varchar(25),
last_name varchar(25),
position varchar(25),
id_store int,
birth_date date,
start_dat timestamp,
zip_code nchar(10),
city varchar(25),
country varchar(25),
email varchar(25),
phone nchar(10),
descript varchar(100),
comment varchar(200)
primary key(id_employee),
foreign key(id_store) references Store);

alter table Customer
  drop column country;

  alter table Customer
  add id_country int;

  alter table Employee
  drop column city;
  
  alter table Employee
  drop column country;

  alter table Employee
  add id_city int;

  alter table Employee 
  add id_country int;

  alter table Employee
  add foreign key (id_city)
  references City (id_city);

  alter table Employee
  add foreign key (id_country)
  references Country (id_country);








--Table for Precious Stones
create table PreciousStone(
id_preciousstone int,
name varchar(25),
descript varchar(100),
comment varchar(200)
primary key(id_preciousstone));

--Table for Material
create table Material(
id_material int,
name varchar(25),
descript varchar(100),
comment varchar(200)
primary key(id_material));

--Table for Fashion Company
create table FashionCompany(
id_fashioncompany int,
name varchar(25),
descript varchar(100),
comment varchar(200)
primary key(id_fashioncompany));

--Table for Style
create table Style(
id_style int,
name varchar(25),
descript varchar(100),
comment varchar(200)
primary key(id_style));

--Table for Color
create table Color(
id_color int,
name varchar(25),
descript varchar(100),
comment varchar(200)
primary key(id_color));

--Table for Shape
create table Shape(
id_shape int,
name varchar(25),
descript varchar(100),
comment varchar(200)
primary key(id_shape));

--Table for Famous Personality
create table FamousPersonality(
id_famouspersonality int,
name varchar(25),
descript varchar(100),
comment varchar(200)
primary key(id_famouspersonality));

--Table for Customer Category
create table CustomerCategory(
id_customercategory int,
name varchar(25),
descript varchar(100),
comment varchar(200)
primary key(id_customercategory));

--Table for Movie Trend
create table MovieTrend(
id_movietrend int,
name varchar(25),
descript varchar(100),
comment varchar(200)
primary key(id_movietrend));

--Table for Body Part
create table BodyPart(
id_bodypart int,
name varchar(25),
descript varchar(100),
comment varchar(200)
primary key(id_bodypart));

--Table for age/era
create table AgeEra(
id_age_era int,
name varchar(25),
descript varchar(100),
comment varchar(200)
primary key(id_age_era));

--Table for Holiday
create table Holiday(
id_holiday int,
name varchar(25),
descript varchar(100),
comment varchar(200)
primary key(id_holiday));

--Table for Jewellry Type
create table JewellryType(
id_jewellrytype int,
name varchar(25),
descript varchar(100),
comment varchar(200)
primary key(id_jewellrytype));

--Table for Metal
create table Metal(
id_metal int,
name varchar(25),
descript varchar(100),
comment varchar(200)
primary key(id_metal));


--Table Price
create table Price(
id_price int,
id_store int,
price_category varchar(25),
amount decimal(9,2),
amount_currency varchar(25),
validity bit
primary key(id_price),
foreign key(id_store) references Store);

--Table ItemSalePrice
create table ItemSalePrice(
id_item int,
id_price int,
primary key(id_item, id_price),
foreign key(id_item) references JewellryItem,
foreign key(id_price) references Price);



--Table CustomerCategory
create table CustomerCategory(
id_customercategory int,
name varchar(25),
descript varchar(100),
comment varchar(200)
primary key(id_customercategory));

--Table Country
create table Country(
id_country int,
name varchar(25),
descript varchar(100),
comment varchar(200)
primary key(id_country));

--Table City
create table City(
id_city int,
name varchar(25),
descript varchar(100),
comment varchar(200)
primary key(id_city));



