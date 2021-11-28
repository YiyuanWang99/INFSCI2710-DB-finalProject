
use finalproj;
delimiter //
create procedure create_customer( c_ID varchar(30), phone varchar(30), c_Name varchar(30),
State varchar(30), City varchar(30), Street varchar(30), Zip int) 
BEGIN
	declare last_ID int default -1;
	START transaction;
    if(select count(*) from Address) then
		select max(id) from Address into last_ID;
	end if;
		if( (select count(*) from Customers where c_ID = Customers.customerID) = 0) then
			insert into Customers(customerID,phone,name_,kindType) values(c_ID,phone,c_Name,0);
		end if;
		insert into Address(ID,State,City,Street,Zip) values(last_ID+1,State,City,Street,Zip);
		insert into livesin(customerID,ID) values(c_ID,last_ID+1);
		
		commit;
END; //
DELIMITER ;

drop procedure if exists create_customer;
drop database finalproj;
call create_customer('001','123-456-789','aa','PA','Pitt','Forbes Ave',15218);
select * from customers;
select * from livesin;
select * from Address;