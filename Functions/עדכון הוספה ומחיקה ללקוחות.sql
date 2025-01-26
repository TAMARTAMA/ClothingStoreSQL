--dml
--insert custmor


create procedure InsertValueToCusotmer
@cuslast nvarchar(20),
@cusfirst nvarchar(20),
@city int,
@adress nvarchar(20)
as 
begin
insert into Customer
values(@cuslast,@cusfirst,@city,@adress)
print 'נוסף בהצלחה'
end
exec InsertValueToCusotmer 'גברא','אסתי',2,'דרור 3'



--delete custmor
alter procedure deleteValueToCusotmer
@id int
as 
begin
delete from Customer
where CustomerId=@id
print 'נמחק בהצלחה'
end
exec deleteValueToCusotmer 1004

--update custmer
alter procedure updateValueToCusotmer
@coulom nvarchar(20),
@id nvarchar(10),
@v nvarchar(20)
as 
begin
declare @x nvarchar(60)='update Customer set '
if @id is not null
set @x+=@coulom+'='''+@v+'''where CustomerId='+@id
exec(@x)
print 'עודכן בהצלחה'
end
exec updateValueToCusotmer 'Adress','9','יונה 87'

