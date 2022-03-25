DELIMITER $
DROP TRIGGER IF EXISTS tri_update_oaappapproves;

create trigger tri_update_oaappapproves after update
on oaappapproves for each row
begin

if new.Status=1 then
select min(n.OrderNo) into @minOrderNo from oaappapprovesnode n where n.approvesId=New.Id;
update oaappapprovesnode t set t.Token=1 where t.approvesId=New.Id and t.OrderNo =@minOrderNo;
end if;

if new.Status=3 or new.Status=4 then
update oaappapprovesnode t set t.Token=0,t.Done=0 where t.approvesId=New.Id;
end if;

end$
DELIMITER ;