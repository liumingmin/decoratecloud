DELIMITER $
DROP TRIGGER IF EXISTS tri_oaapppurchase;

create trigger tri_oaapppurchase after insert
on oaapppurchase for each row
begin

set @minOrderNo = 1;

insert into oaapppurchasenode(Id,purchaseId,ProjectId,OrderNo,UserId,Kind) select UUID(),New.Id,New.ProjectId,OrderNo,UserId,Kind from bpmnode where ProcessId = New.ProcessId and ProjectId=New.ProjectId;

if New.Status=1 then 
select min(n.OrderNo) into @minOrderNo from oaapppurchasenode n where n.purchaseId=New.Id;
update oaapppurchasenode t set t.Token=1 where t.purchaseId=New.Id and t.OrderNo =@minOrderNo;
end if;

end$
DELIMITER ;