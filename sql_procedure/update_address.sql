use finalproj;
delimiter //
create procedure update_address(ID varchar(30), state varchar(30), city varchar(30), street varchar(30), zip int)
begin
	start transaction;
    if((select count(*) from address where address.id = ID) = 0) then
		rollback;
        SIGNAL SQLSTATE '45000' set message_text = 'customerID not found';
	end if;
	update address set address.state = state, address.city = city, address.street = street, address.zip = zip
    where address.id = ID;
    commit;
end; //
delimiter ;

drop procedure update_customer;
select * from address;
call update_address('1','PA','Phil','Fifth',15230);