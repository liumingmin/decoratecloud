::ָ����������ĳ���  
@set mysql_service="%~dp0bin\mysqld.exe"  
@set service_name="EBC_MYSQL10" 

::��ʼ��װMariadb����  
%mysql_service% --install %service_name% --defaults-file="%~dp0my.ini"  

net start %service_name%
@pause  