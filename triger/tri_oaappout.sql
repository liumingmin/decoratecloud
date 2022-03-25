DELIMITER $
DROP TRIGGER IF EXISTS tri_oaappout;

create trigger tri_oaappout after insert
on oaappout for each row
begin

set @minOrderNo = 1;

insert into oaappoutnode(Id,outId,ProjectId,OrderNo,UserId,Kind) select UUID(),New.Id,New.ProjectId,OrderNo,UserId,Kind from bpmnode where ProcessId = New.ProcessId and ProjectId=New.ProjectId;

if New.Status=1 then 
select min(n.OrderNo) into @minOrderNo from oaappoutnode n where n.outId=New.Id;
update oaappoutnode t set t.Token=1 where t.outId=New.Id and t.OrderNo =@minOrderNo;
end if;

end$
DELIMITER ;