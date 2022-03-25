DELIMITER $
DROP TRIGGER IF EXISTS tri_sitetelltechlink;

create trigger tri_sitetelltechlink after insert
on sitetelltechlink for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('SiteTellTech' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';

select concat('施工交底:',Title) into @snapContent from SiteTellTech where Id=New.TellTechId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,New.Kind,New.TellTechId,@snapContent,now());

set @cnt =(select count(*)   from appnotify  where ProjectId=New.ProjectId and UserId=New.UserId  and Module=@moduleName);
if @cnt=0 then 
insert into appnotify(id,ProjectId,UserId,Module,SnapContent,UpdateTime,LastSendTime) values(UUID(),New.ProjectId,New.UserId,@moduleName,@snapContent,now(),(now()-INTERVAL 7 DAY));
else
update appnotify t set t.SnapContent=@snapContent,UpdateTime=now() where ProjectId=New.ProjectId and UserId= New.UserId and Module=@moduleName;
end if;

end$
DELIMITER ;