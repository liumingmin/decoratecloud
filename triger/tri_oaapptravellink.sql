DELIMITER $
DROP TRIGGER IF EXISTS tri_oaapptravellink;

create trigger tri_oaapptravellink after insert
on oaapptravellink for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('OaAppTravel' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';

select concat('出差:',u.RealName) into @snapContent from OaAppTravel t,SysUser u where t.CreateUserId=u.Id and  t.Id=New.TravelId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,1,New.TravelId,@snapContent,now());


end$
DELIMITER ;