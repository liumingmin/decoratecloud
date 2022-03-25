DELIMITER $
DROP TRIGGER IF EXISTS tri_project;

create trigger tri_project after insert
on project for each row
begin

set @LinkId = REPLACE(uuid(),'-',''); 

insert into projectuserlink(Id,ProjectId,UserId,IsOwner) values(@LinkId,NEW.Id,New.CreateUserId,1);

end$
DELIMITER ;