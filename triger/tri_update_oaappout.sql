DELIMITER $
DROP TRIGGER IF EXISTS tri_update_oaappout;

create trigger tri_update_oaappout after update
on oaappout for each row
begin

if new.Status=1 then
select min(n.OrderNo) into @minOrderNo from oaappoutnode n where n.outId=New.Id;
update oaappoutnode t set t.Token=1 where t.outId=New.Id and t.OrderNo =@minOrderNo;
end if;

if new.Status=3 or new.Status=4 then
update oaappoutnode t set t.Token=0,t.Done=0 where t.outId=New.Id;
end if;

end$
DELIMITER ;