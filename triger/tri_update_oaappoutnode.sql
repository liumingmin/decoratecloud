DELIMITER $
DROP TRIGGER IF EXISTS tri_update_oaappoutnode;

create trigger tri_update_oaappoutnode after update
on oaappoutnode for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('OaAppOut' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';


if old.Token = 0 and new.Token=1 then

select concat('外出审批:',u.RealName) into @snapContent from OaAppout t,SysUser u where t.CreateUserId=u.Id and  t.Id=New.outId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,2,New.outId,@snapContent,now());


set @cnt =(select count(*)   from appnotify  where ProjectId=New.ProjectId and UserId=New.UserId  and Module=@moduleName);
if @cnt=0 then 
insert into appnotify(id,ProjectId,UserId,Module,SnapContent,UpdateTime,LastSendTime) values(UUID(),New.ProjectId,New.UserId,@moduleName,@snapContent,now(),(now()-INTERVAL 7 DAY));
else
update appnotify t set t.SnapContent=@snapContent,UpdateTime=now() where ProjectId=New.ProjectId and UserId= New.UserId and Module=@moduleName;
end if;

end if;

end$
DELIMITER ;