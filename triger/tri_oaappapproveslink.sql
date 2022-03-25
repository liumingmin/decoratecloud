DELIMITER $
DROP TRIGGER IF EXISTS tri_oaappapproveslink;

create trigger tri_oaappapproveslink after insert
on oaappapproveslink for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('OaAppApproves' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';

select concat('通用审批:',u.RealName) into @snapContent from OaAppapproves t,SysUser u where t.CreateUserId=u.Id and  t.Id=New.approvesId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,1,New.approvesId,@snapContent,now());


end$
DELIMITER ;