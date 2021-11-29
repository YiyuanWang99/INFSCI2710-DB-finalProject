use finalproj;
delimiter //
create procedure update_store(storeID varchar(30), state varchar(30), city varchar(30), street varchar(30), zip int)
begin
	start transaction;
    if((select count(*) from store where store.storeID = storeID) = 0) then
		rollback;
        SIGNAL SQLSTATE '45000' set message_text = 'store not found';
	end if;
	update address set address.state = state, address.city = city, address.street = street, address.zip = zip
    where (select ID from locateOn where locateOn.storeID = storeID) = address.ID;
    
    commit;
end; //
delimiter ;

drop procedure update_store;
select * from address;
select * from store;
select * from locateOn;
call update_store('1','CA','LA','Fifth',12345);