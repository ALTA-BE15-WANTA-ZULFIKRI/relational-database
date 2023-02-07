--1
create database alta_online_shop;

--2
CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
);
create table product(
	id int auto_increment primary key,
	name varchar(255) not null,
	price int not null,
	stock int not null, 
	created_at datetime not null,
	updated_at datetime not null
);

create table product_type(
	id int auto_increment primary key,
	name varchar(255) not null,
	created_at datetime not null,
	update_at datetime not null
);

CREATE TABLE product_description (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    product_type_id INT NOT NULL,
    description TEXT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (product_type_id) REFERENCES product_type(id)
);

create table payment_method (
	id int auto_increment primary key,
	name varchar(255) not null,
	craeated_at datetime not null, 
	updated_at  datetime not null
);

create table payment_method_decription (
	id int auto_increment primary key,
	payment_method_id int not null,
	description text not null, 
	created_at datetime not null, 
	updated_at datetime not null, 
	foreign key(payment_method_id)references payment_method(id)
);

create table transaction(
	id int auto_increment primary key,
	user_id int not null,
	payment_method_id int not null,
	total_price int not null,
	created_at datetime not null,
	updated_at datetime not null,
	foreign key (user_id)references user(id),
	foreign key(payment_method_id) references payment_method(id)
);

create table transaction_detail(
	id int auto_increment primary key, 
	transaction_id int not null, 
	product_id int not null, 
	quantity int not null, 
	create_at datetime not null,

	update_at datetime not null,
	foreign key (transaction_id) references transaction(id),
	foreign key (product_id) references product(id)
);

--3
create table shipping( 
	id int auto_increment primary key,
	name varchar(255) not null,
	ongkos_dasar int not null, 
	created_at datetime not null,
	updated_at datetime not null
);

--4
ALTER TABLE shipping ADD ongkos_dasar INT NOT NULL;

--5
alter table shipping rename to shipping;

--6
drop table shipping;
--7
create table payment_method_description(
	id int auto_increment primary key, 
	payment_method_id int not null, 
	description text not null, 
	created_at datetime not null,
	updated_at datetime not null
);

create table user_address(
	id int auto_increment primary key,
	user_id int not null,
	address text not null,
	created_at datetime not null,
	updated_at datetime not null
);

create table user_payment_method_detail (
	id int auto_increment primary key,
	user_id int not null,
	payment_method_id int not null,
	created_at datetime not null,
	updated_at datetime not null
);