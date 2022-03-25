DELIMITER $
DROP TRIGGER IF EXISTS tri_projectuserlink;

create trigger tri_projectuserlink after insert
on projectuserlink for each row
begin
set @moduleGroup=CONVERT('Project' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('ProjectUser' USING utf8) COLLATE utf8_unicode_ci;
set @globeProject = CONVERT('__globe__' USING utf8) COLLATE utf8_unicode_ci;

set @projectName = '';

select Name into @projectName from project where Id=New.ProjectId;

set @snapContent = concat( (CONVERT('已加入' USING utf8) COLLATE utf8_unicode_ci) , @projectName);

if New.IsOwner = 0 then

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),@globeProject,New.UserId,@moduleGroup,@moduleName,1,New.ProjectId,@snapContent,now());


set @cnt =(select count(*)   from appnotify  where ProjectId=@globeProject and UserId=New.UserId  and Module=@moduleName);
if @cnt=0 then 
insert into appnotify(id,ProjectId,UserId,Module,SnapContent,UpdateTime,LastSendTime) values(UUID(),@globeProject,New.UserId,@moduleName,@snapContent,now(),(now()-INTERVAL 7 DAY));
else
update appnotify t set t.SnapContent=@snapContent,UpdateTime=now() where ProjectId=@globeProject and UserId= New.UserId and Module=@moduleName;
end if;

end if;


end$
DELIMITER ;