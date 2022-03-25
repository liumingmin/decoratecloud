DELIMITER $
DROP TRIGGER IF EXISTS tri_oaappleave;

create trigger tri_oaappleave after insert
on oaappleave for each row
begin
set @minOrderNo = 1;

insert into oaappleavenode(Id,LeaveId,ProjectId,OrderNo,UserId,Kind) select UUID(),New.Id,New.ProjectId,OrderNo,UserId,Kind from bpmnode where ProcessId = New.ProcessId and ProjectId=New.ProjectId;

if New.Status=1 then 
select min(n.OrderNo) into @minOrderNo from oaappleavenode n where n.LeaveId=New.Id;
update oaappleavenode t set t.Token=1 where t.LeaveId=New.Id and t.OrderNo =@minOrderNo;
end if;

end$
DELIMITER ;