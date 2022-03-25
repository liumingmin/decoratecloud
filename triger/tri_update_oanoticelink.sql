DELIMITER $
DROP TRIGGER IF EXISTS tri_update_oanoticelink;

create trigger tri_update_oanoticelink after update
on oanoticelink for each row
begin
set @hadView = 0;

select count(*) into @hadView from oanoticelink where isView=1 and noticeId=New.NoticeId;

update oanotice t set t.HadView=@hadView where Id=New.NoticeId;

end$
DELIMITER ;