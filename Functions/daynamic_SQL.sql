--sql ăéđîé
--ůî÷áě ůí čáěä ĺňîĺăä ĺňřę ĺîçćéř ŕú äůĺřä áčáěä ůáä ňřę ćä-sql ăéđîé 
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
exec search 'CategoryName','''ŕřĺňéí đůéí''','Category'
exec search 'CategoryName',null,'Category'
