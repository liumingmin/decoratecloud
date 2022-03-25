DELIMITER $
DROP TRIGGER IF EXISTS tri_oaapppurchaselink;

create trigger tri_oaapppurchaselink after insert
on oaapppurchaselink for each row
begin
set @moduleGroup=CONVERT('App' USING utf8) COLLATE utf8_unicode_ci;
set @moduleName=CONVERT('OaAppPurchase' USING utf8) COLLATE utf8_unicode_ci;
set @snapContent = '';

select concat('采购:',u.RealName) into @snapContent from OaApppurchase t,SysUser u where t.CreateUserId=u.Id and  t.Id=New.purchaseId;

insert into appredpoint(id,ProjectId,UserId,ModuleGroup,Module,Kind,ModuleKey,SnapContent,UpdateTime) values(UUID(),New.ProjectId,New.UserId,@moduleGroup,@moduleName,1,New.purchaseId,@snapContent,now());


end$
DELIMITER ;