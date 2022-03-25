DELIMITER $
DROP TRIGGER IF EXISTS tri_oataskfeedback;

create trigger tri_oataskfeedback after insert
on oataskfeedback for each row
begin
declare tmp_uid varchar(64);
declare tmp_kind int; 
DECLARE done INT DEFAULT FALSE;
declare cur_feedback CURSOR FOR select distinct t.UserId,t.kind from (SELECT  UserId,(case  Kind when  0 then 3  when  1 then 4 end) kind from oatasklink where UserId <> New.UserId and TaskId=New.TaskId 
																		union all select CreateUserId,0 from oatask where  CreateUserId <> New.UserId and Id=New.TaskId) t;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('OaTask' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';
 

select concat('任务反馈 进度:',Progress)  into @snapContent from oataskfeedback where Id=New.Id;

  
OPEN cur_feedback;
REPEAT  
        FETCH cur_feedback INTO tmp_uid,tmp_kind;
    
    	
    	if NOT done then 
        insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,tmp_uid,@moduleGroup,@moduleName,tmp_kind,New.TaskId,@snapContent,now());
			
			
			set @cnt =(select count(*)   from appnotify  where ProjectId=New.ProjectId and UserId=tmp_uid  and Module=@moduleName);
			if @cnt=0 then 
			insert into appnotify(id,ProjectId,UserId,Module,SnapContent,UpdateTime,LastSendTime) values(UUID(),New.ProjectId,tmp_uid,@moduleName,@snapContent,now(),(now()-INTERVAL 7 DAY));
			else
			update appnotify t set t.SnapContent=@snapContent,UpdateTime=now() where ProjectId=New.ProjectId and UserId= tmp_uid and Module=@moduleName;
			end if;
        
      end if;
UNTIL done END REPEAT;  
CLOSE cur_feedback;


end$
DELIMITER ;