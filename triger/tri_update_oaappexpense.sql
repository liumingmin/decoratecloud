DELIMITER $
DROP TRIGGER IF EXISTS tri_update_oaappexpense;

create trigger tri_update_oaappexpense after update
on oaappexpense for each row
begin

if new.Status=1 then
select min(n.OrderNo) into @minOrderNo from oaappexpensenode n where n.expenseId=New.Id;
update oaappexpensenode t set t.Token=1 where t.expenseId=New.Id and t.OrderNo =@minOrderNo;
end if;

if new.Status=3 or new.Status=4 then
update oaappexpensenode t set t.Token=0,t.Done=0 where t.expenseId=New.Id;
end if;

end$
DELIMITER ;