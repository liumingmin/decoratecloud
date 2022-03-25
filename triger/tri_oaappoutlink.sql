DELIMITER $
DROP TRIGGER IF EXISTS tri_oaappoutlink;

create trigger tri_oaappoutlink after insert
on oaappoutlink for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('OaAppOut' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';

select concat('外出:',u.RealName) into @snapContent from OaAppout t,SysUser u where t.CreateUserId=u.Id and  t.Id=New.outId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,1,New.outId,@snapContent,now());


end$
DELIMITER ;