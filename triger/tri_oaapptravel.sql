DELIMITER $
DROP TRIGGER IF EXISTS tri_oaapptravel;

create trigger tri_oaapptravel after insert
on oaapptravel for each row
begin

set @minOrderNo = 1;

insert into oaapptravelnode(Id,TravelId,ProjectId,OrderNo,UserId,Kind) select UUID(),New.Id,New.ProjectId,OrderNo,UserId,Kind from bpmnode where ProcessId = New.ProcessId and ProjectId=New.ProjectId;

if New.Status=1 then 
select min(n.OrderNo) into @minOrderNo from oaapptravelnode n where n.TravelId=New.Id;
update oaapptravelnode t set t.Token=1 where t.TravelId=New.Id and t.OrderNo =@minOrderNo;
end if;

end$
DELIMITER ;