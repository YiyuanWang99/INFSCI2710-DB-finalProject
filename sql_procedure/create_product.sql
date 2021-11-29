use finalproj;
delimiter //
create procedure create_product(productID varchar(30),storeID varchar(30), pro_Name varchar(30),
pro_Kind varchar(10), pro_Price float, quantity int)
begin
declare t_error int default 0;
declare continue handler for sqlexception,sqlstate '45000' 
begin
set t_error = 1;
SELECT 'procedure failed, rolling back.' AS msg;
end;


	start transaction;
    if((select count(*) from store where storeID = storeID) = 0 ) then
		SIGNAL SQLSTATE '45000' ;
	end if;
    
	if((select count(*) from products where products.productID = productID) = 0) then
		insert into products(productID,kind,price,name_) values (productID,pro_Kind,pro_Price,pro_Name);
    end if;
    insert into stock(productID,storeID,quantity) values(productID,storeID,quantity);
    
    if t_error = 1 then
		rollback;
	else
		commit;
	end if;
end; //
delimiter ;

drop procedure create_product;
select * from products;
select * from store;
select * from stock;
call create_product('010','1', 'Banana',
'Fruit', 1.3,1024);