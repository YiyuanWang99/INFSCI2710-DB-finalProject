use finalproj;
delimiter //
create procedure read_product(storeID varchar(30))
begin

select p.productID,p.Name_,p.kind,p.price,s.quantity from products p,stock s
where s.storeID = storeID and s.productID = p.productID;
end; //
delimiter ;

drop procedure read_product;
select * from products;
select * from store;
select * from stock;
call read_product('1');