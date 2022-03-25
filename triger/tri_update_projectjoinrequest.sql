DELIMITER $
DROP TRIGGER IF EXISTS tri_update_projectjoinrequest;

create trigger tri_update_projectjoinrequest after update
on projectjoinrequest for each row
begin

if old.Result=0 and new.Result=1 then

set @LinkId = REPLACE(uuid(),'-',''); 

set @cnt =(select count(*)   from projectuserlink  where ProjectId=New.ProjectId and UserId=New.JoinUserId);
if @cnt=0 then 
insert into projectuserlink(Id,ProjectId,UserId) values(@LinkId,New.ProjectId,New.JoinUserId);
end if;

end if;
end$
DELIMITER ;