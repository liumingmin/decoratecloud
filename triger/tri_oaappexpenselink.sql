DELIMITER $
DROP TRIGGER IF EXISTS tri_oaappexpenselink;

create trigger tri_oaappexpenselink after insert
on oaappexpenselink for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('OaAppExpense' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';

select concat('报销:',u.RealName) into @snapContent from OaAppExpense t,SysUser u where t.CreateUserId=u.Id and  t.Id=New.expenseId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,1,New.expenseId,@snapContent,now());


end$
DELIMITER ;