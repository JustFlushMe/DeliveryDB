CREATE DATABASE Delivery_78 COLLATE Cyrillic_General_CI_AS

CREATE TABLE Clients(
	cl_id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	cl_name varchar(90) NOT NULL,
	cl_phone varchar(11) NOT NULL,
	cl_mail varchar(256),
	cl_addr varchar(200),

	UNIQUE(cl_phone)
);

USE Delivery_78;
CREATE TABLE Curiers(
	cur_id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	cur_name varchar(90) NOT NULL,
	cur_phone varchar(11) NOT NULL
);

CREATE TABLE Contractors(
	con_id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	con_numbOfAgr varchar(6) NOT NULL,
	con_bin varchar(13) NOT NULL,
	con_name varchar(30) NOT NULL
);


USE Delivery_78
CREATE TABLE Orders(
	ord_id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	ord_addrS varchar(200) NOT NULL,
	ord_addrF varchar(200) NOT NULL,
	ord_details varchar(300) NOT NULL,
	ord_contractor int NOT NULL,
	ord_client int NOT NULL,
	ord_curier int NOT NULL,
	ord_datetime datetime NOT NULL,
	ord_status varchar(15) NOT NULL,
	ord_total float NOT NULL,
	CHECK(ord_status IN('Выполнен', 'В процессе', 'Отменён')),

	CONSTRAINT FK_ord_client FOREIGN KEY (ord_client) REFERENCES Clients(cl_id),
	CONSTRAINT FK_ord_curier FOREIGN KEY (ord_curier) REFERENCES Curiers(cur_id),
	CONSTRAINT FK_ord_contractor FOREIGN KEY (ord_contractor) REFERENCES Contractors(con_id)
	
);

USE Delivery_78;
-- СОЗДАНИЕ ПОЛЬЗОВАТЕЛЕЙ
USE Delivery_78
CREATE USER FitnessMED WITHOUT LOGIN

CREATE USER AndrewHuss WITHOUT LOGIN

CREATE USER MeinGerank WITHOUT LOGIN

-- ВЫДАЧА ПРАВ НА ПРОСМОТР ТАБЛИЦЫ Orders
GRANT SELECT on Orders to FitnessMED
GRANT SELECT on Orders to AndrewHuss
GRANT SELECT on Orders to MeinGerank


