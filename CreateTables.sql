CREATE DATABASE Delivery278 COLLATE Cyrillic_General_CI_AS

USE Delivery278;

CREATE TABLE Clients(
	cl_id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	cl_name varchar(90) NOT NULL,
	cl_phone varchar(11) NOT NULL,
	cl_mail varchar(256),
	cl_addr varchar(200),

	UNIQUE(cl_phone)
);

USE Delivery278;
CREATE TABLE Curiers(
	cur_id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	cur_name varchar(90) NOT NULL,
	cur_phone varchar(11) NOT NULL,
);

CREATE TABLE Contractors(
	con_id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	con_numbOfAgr varchar(6) NOT NULL,
	con_bin varchar(13) NOT NULL,
	con_name varchar(30) NOT NULL
);


USE Delivery278
CREATE TABLE Orders(
	ord_id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
	ord_addrS varchar(200) NOT NULL,
	ord_addrF varchar(200) NOT NULL,
	ord_details varchar(300) NOT NULL,
	ord_contractor int NOT NULL,
	ord_client int NOT NULL,
	ord_courier int NOT NULL,
	ord_datetime datetime NOT NULL,
	ord_status varchar(15) NOT NULL,
	ord_total float NOT NULL,
	CHECK(ord_status IN('Выполнен', 'В процессе', 'Отменён'))

	CONSTRAINT FK_ord_client FOREIGN KEY (ord_client) REFERENCES Clients(cl_id),
	CONSTRAINT FK_ord_curier FOREIGN KEY (ord_curier) REFERENCES Curiers(cur_id),
	CONSTRAINT FK_ord_contractor FOREIGN KEY (ord_contractor) REFERENCES Contractors(con_id),
	
);


-- ПОЛЬЗОВАТЕЛИ
CREATE lOGIN Operator
	WITH PASSWORD = 'operator_password';

CREATE lOGIN Contractor
	WITH PASSWORD = 'contractor_password';
	
CREATE LOGIN Courier
	WITH PASSWORD = 'courier_password';

-- У клиента нет своего пользователя

-- СОЗДАНИЕ ПОЛЬЗОВАТЕЛЕЙ
CREATE USER Operator1 FOR LOGIN Operator

CREATE USER Contractor1 FOR LOGIN Contractor

CREATE USER Courier1 FOR LOGIN Courier

CREATE SERVER ROLE Oprator278
CREATE SERVER ROLE Courier278
CREATE SERVER ROLE Contractor278

