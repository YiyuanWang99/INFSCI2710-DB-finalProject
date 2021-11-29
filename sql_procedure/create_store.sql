use finalproj;
delimiter //
create procedure create_store(storeID varchar(30),state varchar(30), city varchar(30),
street varchar(30), zip int)
begin
declare last_ID int default -1;
declare t_error int default 0;
declare continue handler for sqlexception,sqlstate '45000' 
begin
set t_error = 1;
SELECT 'procedure failed, rolling back.' AS msg;
end;


	start transaction;
    if(storeID = '') then
		SIGNAL SQLSTATE '45000' ;
	end if;
    
	START transaction;
    if((select count(*) from Address) <> 0) then
		select max(id) from Address into last_ID;
	end if;
    
    #if((select count(*) from Store where Store.storeID = storeID) <> 0) then
	#	resignal set message_text = 'illegal storeID';
	#end if;
    
	insert into Store(storeID) values(storeID);
    insert into Address(ID,state,city,street,zip) values(last_ID,state,city,street,zip);
    insert into locateOn(ID,storeID) values(last_ID,storeID);
    
    if t_error = 1 then
		rollback;
	else
		commit;
	end if;
end; //
delimiter ;

drop procedure create_store;
select * from Store;
select * from locateOn;
select * from Address;
call create_store('10','PA1', 'Pitt1',
'Centre Ave1', 152181);

delete from locateOn where storeID = '' and ID ='-1';
delete from store where storeID = '' ;
delete from address where ID ='-1';