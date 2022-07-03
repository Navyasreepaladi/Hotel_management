CREATE TABLE Hotel
(
name varchar(50) NOT NULL,
location varchar(50) NOT NULL,
hotel_id int primary key
);
CREATE TABLE Employee
(
employee_id int primary key,
email varchar(50) NOT NULL,
DOB date NOT NULL,
Fname varchar(20) NOT NULL,
LName varchar(20) NOT NULL,
address varchar(50) NOT NULL,
salary numeric(10,2),
gender char NOT NULL,
e_h_id int,
foreign key(e_h_id) references Hotel(hotel_id) 
);
CREATE TABLE Rooms(
room_id int primary key,
room_type char(10),
r_h_id int,
foreign key(r_h_id) references Hotel(hotel_id)
);

CREATE TABLE Employee_PhNo(
e_id int,
foreign key(e_id) references Employee(employee_id),
phone_num bigint,
primary key(e_id,phone_num)
);

CREATE TABLE Customer(
customer_id varchar(10) primary key,
email_customer varchar(30) NOT NULL,
customer_Fname varchar(30) NOT NULL,
customer_Lname varchar(30) NOT NULL,
customer_payment_id varchar(15) NOT NULL,
customer_payment_method char(10) NOT NULL,
customer_pay_date date NOT NULL,
customer_checkin_date date NOT NULL,
customer_checkout_date date NOT NULL,
customer_room_id int,
foreign key(customer_room_id) references Rooms(room_id)
);
ALTER TABLE Customer ADD CONSTRAINT unique_fname UNIQUE (customer_Fname);
ALTER TABLE Customer ADD CONSTRAINT unique_lname UNIQUE (customer_Lname);
ALTER TABLE Customer ADD CONSTRAINT unique_checkin UNIQUE (customer_checkin_date);
ALTER TABLE Customer ADD CONSTRAINT unique_checkout UNIQUE (customer_checkout_date);
CREATE TABLE Today_Price(
t_h_id int,
foreign key(t_h_id) references Hotel(hotel_id),
room_t_p_id int,
foreign key(room_t_p_id) references Rooms(room_id),
price decimal(10,2) NOT NULL,
availability char NOT NULL,
today_date date NOT NULL,
primary key(today_date,room_t_p_id)
);

CREATE TABLE Reservation(
r_room_t_p_id int,
r_date date,
r_c_id varchar(10),
primary key(r_room_t_p_id,r_date,r_c_id),
start_date date NOT NULL,
end_date date NOT NULL
);

CREATE Table Invoice(
invoice_id varchar(10),
i_c_id varchar(10),
primary key(invoice_id,i_c_id),
foreign key(i_c_id) references Customer(customer_id),
i_fname varchar(30),
i_lname varchar(30),
amount decimal(10,2)
);

ALTER Table Invoice 
	ADD CONSTRAINT fk_ifname
	FOREIGN KEY(i_fname)
	References Customer(customer_Fname);
ALTER Table Invoice 
	ADD CONSTRAINT fk_ilname
	FOREIGN KEY(i_lname)
	References Customer(customer_Lname);

CREATE TABLE Customer_Contact(
customer_contact_id varchar(10),
contact_number bigint,
primary key(customer_contact_id,contact_number),
foreign key(customer_contact_id) references Customer(customer_id)
);

