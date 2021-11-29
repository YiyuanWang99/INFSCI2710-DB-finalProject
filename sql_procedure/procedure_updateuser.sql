use finalproj;
delimiter //
create procedure update_customer(c_ID varchar(30), phone varchar(30), c_Name varchar(30))
begin
	start transaction;
    if((select count(*) from customers where customers.customerID = c_ID) = 0) then
		rollback;
        SIGNAL SQLSTATE '45000' set message_text = 'customerID not found';
	end if;
	update customers set customers.phone = phone, customers.name_ = c_Name where c_ID = customers.customerID;
    commit;
end; //
delimiter ;

drop procedure update_customer;
select * from customers;
call update_customer('000','123-456-7890','ab');