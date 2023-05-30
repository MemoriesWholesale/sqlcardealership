create table salesperson(
sales_id SERIAL primary key,
first_name VARCHAR(25),
last_name VARCHAR(25),
pay MONEY
);

create table customer(
customer_id SERIAL primary key,
first_name VARCHAR(25),
last_name VARCHAR(25)
);

create table car_sold(
VIN VARCHAR(17) primary key,
sales_id INTEGER not null unique,
foreign key(sales_id) references salesperson(sales_id),
customer_id INTEGER not null unique,
foreign key(customer_id) references customer(customer_id),
used BOOLEAN,
year_ NUMERIC(4),
make VARCHAR(20),
model VARCHAR(20),
license_plate VARCHAR(7) not null unique
);

create table invoice(
sale_id SERIAL primary key,
date_sold DATE,
VIN VARCHAR(17) not null unique,
foreign key(VIN) references car_sold(VIN),
price MONEY
);

create table car_serviced(
VIN VARCHAR(17) primary key,
customer_id INTEGER not null,
foreign key(customer_id) references customer(customer_id),
year_ NUMERIC(4),
make VARCHAR(20),
model VARCHAR(20),
license_plate VARCHAR(7)
);

create table mechanic(
mechanic_id SERIAL primary key,
first_name VARCHAR(25),
last_name VARCHAR(25),
pay MONEY
);

create table service_ticket(
service_id SERIAL primary key,
VIN VARCHAR(17),
foreign key(VIN) references car_serviced(VIN),
date_serviced DATE,
cost_ MONEY,
description text,
mechanic_id INTEGER,
foreign key(mechanic_id) references mechanic(mechanic_id)
);


create table service_history(
VIN VARCHAR(17),
foreign key(VIN) references car_serviced(VIN),
dates_serviced DATE ARRAY
);