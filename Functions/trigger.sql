--����� ������ ��� ����� ���� ������ ������ ���� ��� ���� ���� ��� �� �� �����
create trigger updateInvontry
on orderDetail
instead of insert
as
begin
declare @sizeid int
set @sizeid=(select SizeId from inserted)
declare @amount int
set @amount=(select Amount from inserted)
if 0<(select dbo.IfstayInvontry(@sizeid,@amount))
 begin
 insert into orderDetail
 values(@amount,(select OrderId from inserted),@sizeid)
 end
else
 print '����� ���� ���� ������'
end