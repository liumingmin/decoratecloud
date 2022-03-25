DELIMITER $
DROP TRIGGER IF EXISTS tri_update_oaapppurchase;

create trigger tri_update_oaapppurchase after update
on oaapppurchase for each row
begin

if new.Status=1 then
select min(n.OrderNo) into @minOrderNo from oaapppurchasenode n where n.purchaseId=New.Id;
update oaapppurchasenode t set t.Token=1 where t.purchaseId=New.Id and t.OrderNo =@minOrderNo;
end if;

if new.Status=3 or new.Status=4 then
update oaapppurchasenode t set t.Token=0,t.Done=0 where t.purchaseId=New.Id;
end if;

end$
DELIMITER ;