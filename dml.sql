create or replace procedure sales_hire(first_name VARCHAR, last_name VARCHAR, pay MONEY default 50000)
language plpgsql
as $$
begin
	insert into salesperson(first_name,last_name,pay)
	values (first_name,last_name,pay);
end;
$$;

call sales_hire('Bubba','Gunthrop');
call sales_hire('Zoë','Kaczynski');

create or replace procedure mechanic_hire(first_name VARCHAR, last_name VARCHAR, pay MONEY default 50000)
language plpgsql
as $$
begin
	insert into mechanic(first_name,last_name,pay)
	values (first_name,last_name,pay);
end;
$$;

call mechanic_hire('Chadwick','Holt');
call mechanic_hire('Tiffany','Fitzsimmons');

create or replace procedure log_customer(first_name VARCHAR, last_name VARCHAR)
language plpgsql
as $$
begin 
	insert into customer(first_name,last_name)
	values (first_name,last_name);
end;
$$;

call log_customer('Sanjay','Narasimhan');
call log_customer('Mengzi','Xi');

create or replace procedure sell_car(VIN VARCHAR,sales_id INTEGER,customer_id INTEGER,used BOOLEAN,year_ numeric,make VARCHAR,model VARCHAR,license_plate VARCHAR,date_sold DATE,price MONEY)
language plpgsql
as $$
begin
	insert into car_sold(VIN,sales_id,customer_id,used,year_,make,model,license_plate)
	values (VIN,sales_id,customer_id,used,year_,make,model,license_plate);
	insert into invoice(VIN,date_sold,price)
	values (VIN,date_sold,price);
end;
$$;

call sell_car('HH8729K9907J74325',3,1,TRUE,2021,'Honda','Civic','MASL89A',DATE('5/29/2023'),MONEY(25000));
call sell_car('J8440B124RE78VC42',1,2,false,2023,'Ford','Explorer','ZK8925V',DATE('5/30/2023'),MONEY(35000));

create or replace procedure service_car(VIN_ VARCHAR,customer_id INTEGER,year_ numeric,make VARCHAR,model VARCHAR,license_plate VARCHAR,date_serviced DATE,cost_ MONEY,description text,mechanic_id INTEGER)
language plpgsql
as $$
begin 
	insert into car_serviced(VIN,customer_id,year_,make,model,license_plate)
	values (VIN_,customer_id,year_,make,model,license_plate);
	insert into service_ticket(VIN,date_serviced,cost_,description,mechanic_id)
	values (VIN_,date_serviced,cost_,description,mechanic_id);
	insert into service_history(VIN,dates_serviced) values(VIN_,array[date_serviced])
	on conflict(VIN) do update set dates_serviced = array_append(dates_serviced,date_serviced);
end;
$$;


call service_car('HH8729K9907J74325',1,1977,'Ford','Mustang','MMG8834',DATE('5/30/2023'),MONEY(2000),'Fixed alternator',2);





