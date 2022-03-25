DELIMITER $
DROP TRIGGER IF EXISTS tri_oaappapproves;

create trigger tri_oaappapproves after insert
on oaappapproves for each row
begin

set @minOrderNo = 1;

insert into oaappapprovesnode(Id,approvesId,ProjectId,OrderNo,UserId,Kind) select UUID(),New.Id,New.ProjectId,OrderNo,UserId,Kind from bpmnode where ProcessId = New.ProcessId and ProjectId=New.ProjectId;

if New.Status=1 then 
select min(n.OrderNo) into @minOrderNo from oaappapprovesnode n where n.approvesId=New.Id;
update oaappapprovesnode t set t.Token=1 where t.approvesId=New.Id and t.OrderNo =@minOrderNo;
end if;

end$
DELIMITER ;