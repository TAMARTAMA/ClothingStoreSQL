--sql �����
--����� �� ���� ������ ���� ������ �� ����� ����� ��� ��� ��-sql ����� 
create procedure search
@coulom nvarchar(20),
@data nvarchar(20),
@table nvarchar(20)
as 
begin
declare @sqlCommand nvarchar(max)='select * from '+@table
 if @data is not null
   set  @sqlCommand+=' where '+@coulom+' ='+@data
print @sqlCommand
exec  (@sqlCommand)
end
exec search 'CategoryName','''������ ����''','Category'
exec search 'CategoryName',null,'Category'