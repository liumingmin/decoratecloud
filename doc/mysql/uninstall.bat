::指定创建服务的程序  
@set mysql_service="%~dp0bin\mysqld.exe"  
@set service_name="EBC_MYSQL10" 

net stop %service_name%
%mysql_service% --remove %service_name%

@pause