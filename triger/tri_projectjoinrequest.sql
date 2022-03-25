DELIMITER $
DROP TRIGGER IF EXISTS tri_projectjoinrequest;

create trigger tri_projectjoinrequest after insert
on projectjoinrequest for each row
begin
set @moduleGroup=CONVERT('Project' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('Request' USING utf8) COLLATE utf8_unicode_ci;
set @globeProject = CONVERT('__globe__' USING utf8) COLLATE utf8_unicode_ci;

set @projectName = '';
select Name into @projectName from project where Id=New.ProjectId;

set @snapContent = '';
set @userId ='';

if New.ReqKind = 0 then

set @userId = New.ProjectUserId;

set @userName = '';
select RealName into @userName from sysuser where Id=New.JoinUserId;
set @snapContent = concat(@userName , (CONVERT('申请加入' USING utf8) COLLATE utf8_unicode_ci) , @projectName);

elseif New.ReqKind = 1 then

set @userId = New.JoinUserId;

set @userName = '';
select RealName into @userName from sysuser where Id=New.ProjectUserId;
set @snapContent = concat(@userName , (CONVERT('邀请你加入' USING utf8) COLLATE utf8_unicode_ci) , @projectName);

end if;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),@globeProject,@userId,@moduleGroup,@moduleName,1,New.Id,@snapContent,now());

set @cnt =(select count(*)   from appnotify  where ProjectId=@globeProject and UserId=@userId  and Module=@moduleName);
if @cnt=0 then 
insert into appnotify(id,ProjectId,UserId,Module,SnapContent,UpdateTime,LastSendTime) values(UUID(),@globeProject,@userId,@moduleName,@snapContent,now(),(now()-INTERVAL 7 DAY));
else
update appnotify t set t.SnapContent=@snapContent,UpdateTime=now() where ProjectId=@globeProject and UserId= @userId and Module=@moduleName;
end if;

end$
DELIMITER ;