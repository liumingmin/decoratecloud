DELIMITER $
DROP TRIGGER IF EXISTS tri_update_oaapptravel;

create trigger tri_update_oaapptravel after update
on oaapptravel for each row
begin

if new.Status=1 then
select min(n.OrderNo) into @minOrderNo from oaapptravelnode n where n.TravelId=New.Id;
update oaapptravelnode t set t.Token=1 where t.TravelId=New.Id and t.OrderNo =@minOrderNo;
end if;

if new.Status=3 or new.Status=4 then
update oaapptravelnode t set t.Token=0,t.Done=0 where t.TravelId=New.Id;
end if;

end$
DELIMITER ;