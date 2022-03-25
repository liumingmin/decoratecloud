DELIMITER $
DROP TRIGGER IF EXISTS tri_appredpoint;

create trigger tri_appredpoint after insert
on appredpoint for each row
begin

if New.ModuleGroup = "App" then

set @workitemcnt =(select count(*)   from workbenchitem  where ProjectId=New.ProjectId and UserId=New.UserId  and Module=New.Module);
if @workitemcnt=0 then 
insert into workbenchitem(id,ProjectId,UserId,Module,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,New.Module,New.SnapContent,now());
else
update workbenchitem t set t.SnapContent=New.SnapContent,UpdateTime=now() where ProjectId=New.ProjectId and UserId= New.UserId and Module=New.Module;
end if;

end if;

end$
DELIMITER ;