::指定创建服务的程序  
@set mysql_service="%~dp0bin\mysqld.exe"  
@set service_name="EBC_MYSQL10" 

::开始安装Mariadb服务  
%mysql_service% --install %service_name% --defaults-file="%~dp0my.ini"  

net start %service_name%
@pause  