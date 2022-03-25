DELIMITER $
DROP TRIGGER IF EXISTS tri_oaappexpense;

create trigger tri_oaappexpense after insert
on oaappexpense for each row
begin

set @minOrderNo = 1;

insert into oaappexpensenode(Id,ExpenseId,ProjectId,OrderNo,UserId,Kind) select UUID(),New.Id,New.ProjectId,OrderNo,UserId,Kind from bpmnode where ProcessId = New.ProcessId and ProjectId=New.ProjectId;

if New.Status=1 then 
select min(n.OrderNo) into @minOrderNo from oaappexpensenode n where n.expenseId=New.Id;
update oaappexpensenode t set t.Token=1 where t.expenseId=New.Id and t.OrderNo =@minOrderNo;
end if;

end$
DELIMITER ;