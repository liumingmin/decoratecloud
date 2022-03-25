DELIMITER $
DROP TRIGGER IF EXISTS tri_sitetelltechlink;

create trigger tri_sitetelltechlink after insert
on sitetelltechlink for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('SiteQtySafe' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';
set @title='';
if set New.Module == 0 THEN
  set @title= CONVERT('质量:' USING utf8) COLLATE utf8_unicode_ci;
ELSE
  set @title= CONVERT('安全:' USING utf8) COLLATE utf8_unicode_ci;
end if;

select concat(@title,Title) into @snapContent from SiteQtySafe where Id=New.QtySafeId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,New.Kind,New.QtySafeId,@snapContent,now());

set @cnt =(select count(*)   from appnotify  where ProjectId=New.ProjectId and UserId=New.UserId  and Module=@moduleName);
if @cnt=0 then 
insert into appnotify(id,ProjectId,UserId,Module,SnapContent,UpdateTime,LastSendTime) values(UUID(),New.ProjectId,New.UserId,@moduleName,@snapContent,now(),(now()-INTERVAL 7 DAY));
else
update appnotify t set t.SnapContent=@snapContent,UpdateTime=now() where ProjectId=New.ProjectId and UserId= New.UserId and Module=@moduleName;
end if;

end$
DELIMITER ;