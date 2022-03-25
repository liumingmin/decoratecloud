DELIMITER $
DROP TRIGGER IF EXISTS tri_oaappleavelink;

create trigger tri_oaappleavelink after insert
on oaappleavelink for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('OaAppLeave' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';

select concat('请假:',u.RealName) into @snapContent from OaAppLeave t,SysUser u where t.CreateUserId=u.Id and  t.Id=New.LeaveId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,1,New.LeaveId,@snapContent,now());

/*
set @cnt =(select count(*)   from appnotify  where ProjectId=New.ProjectId and UserId=New.UserId  and Module=@moduleName);
if @cnt=0 then 
insert into appnotify(id,ProjectId,UserId,Module,SnapContent,UpdateTime,LastSendTime) values(UUID(),New.ProjectId,New.UserId,@moduleName,@snapContent,now(),(now()-INTERVAL 7 DAY));
else
update appnotify t set t.SnapContent=@snapContent,UpdateTime=now() where ProjectId=New.ProjectId and UserId= New.UserId and Module=@moduleName;
end if;*/

end$
DELIMITER ;