DELIMITER $
DROP TRIGGER IF EXISTS tri_update_oaappleave;

create trigger tri_update_oaappleave after update
on oaappleave for each row
begin

if new.Status=1 then
select min(n.OrderNo) into @minOrderNo from oaappleavenode n where n.LeaveId=New.Id;
update oaappleavenode t set t.Token=1 where t.LeaveId=New.Id and t.OrderNo =@minOrderNo;
end if;

if new.Status=3 or new.Status=4 then
update oaappleavenode t set t.Token=0,t.Done=0 where t.LeaveId=New.Id;
end if;

end$
DELIMITER ;