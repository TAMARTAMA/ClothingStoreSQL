--ôåð ùî÷áìú îéãä åëîåú åáåã÷ú äàí ðùàø áîìàé
alter function IfstayInvontry(@sizeid int,@amount int)
returns bit
as
begin
if exists(select s.*
          from Size s join Model m on  m.ModelId=s.ModelId
		  where  @sizeid=s.SizeId and (s.Inventory-@amount)>=0) 
		  return 1
return 0
end
print dbo.IfstayInvontry(1,1)
--ôåð ñåã÷ú äàí ÷ééîú äæîðä ëîñ ä÷åã ù÷áìä~
create function IfThereOrder(@IdOrder int)
returns bit
as
begin
if exists(select * from Orders where OrderId=@IdOrder)
return 1
return 0
end
print dbo.IfThereOrder (1)
--1.ôøåöãåøä ùî÷áìú ãâí åîéãä åëîåú åáåã÷ú äàí ÷ééí áîìàé àí ëï úòãëï àú äîìàé(îòðä ìîèøä îñ 4)

alter procedure UpdateAmount
@size int,@model int ,@amount int,@x bit output
as
begin
set @x= dbo.IfstayInvontry(@size,@model,@amount)
if @x=1
  begin
   update Size
   set Inventory=(Inventory-@amount)
   where Size=@size and ModelId=@model
  end
end 

declare @t bit
exec UpdateAmount @size=18,@model=7,@amount=10,@x=@t output
print @t

--~(ôåð ùî÷áìú îéãä åëîåú åîçæéøä àú ëì äáâãéí îîéãä æå ùéù áîìàé áèáìä(äîéãåú îîåéðåú ìôé ÷èåâøéåú
alter function OrderBySize(@sizeid int,@amount int)
returns
@OutputTable TABLE
(
modelname nvarchar(30),color nvarchar(20),price int,Inventory int ,Size int ,SizeId int ,categoryname nvarchar(30))
as
begin
insert into @OutputTable
select m.ModelName,m.Color,m.Price,s.Inventory,s.Size,s.SizeId,c.CategoryName
from Size s join Model m on m.ModelId=s.ModelId join Category c on c.CategoryId=m.CategoryId
where s.SizeId=@sizeid and dbo.IfstayInvontry(@sizeid,@amount)=1
return
end 
select *
from dbo.OrderBySize(38,1)
-- ôøåöãåøä ùî÷áìú ãâí åîéãä åëîåú åîòãëðú àú äîìàé àí àéï áîìàé îãôéñä äåãòä åîçæéøä 0~
--alter procedure UpdateAmount
--@size int,@model int ,@amount int,@x bit output
--as
--begin
--set @x= dbo.IfstayInvontry(@size,@model,@amount)
--if @x=1
--  begin
--   update Size
--   set Inventory=(Inventory-@amount)
--   where Size=@size and ModelId=@model
--  end
--end  
--declare @t bit
--exec UpdateAmount @size=18,@model=7,@amount=10,@x=@t output
--print @t
--~ôøåöãåøä ùî÷áìú ÷åã îùúîù åîçæéøä àú äñëåí äëåìì ùì ääæîðåú ùì äîåöøéí ùäæîéï~
create procedure TotalPrice
@id int,@total int output
as
begin
set @total=(select sum(m.Price)from Orders o join orderDetail orr on orr.OrderId=o.OrderId 
       join Size s on orr.SizeId=s.SizeId join Model m on m.ModelId=s.SizeId
        where o.CustomerId=@id)
end 
declare @total int
exec TotalPrice 5,@total output
print @total
--~ôøåöãåøä ùîèôìú áäæîðä ôøéè ìì÷åç àí ääæîðä ÷ééîú úåñéó ìäæîðä æå àí ìà úéöåø çãùä åúçæéø àú îñ ääæîðä äçãùä
--îùúîùú áôåð IfThereOrder
create procedure AddOrderDetial
@idOrder int,@cusId int,@selId int,@date date,
@amount int,@sizeid int,@size int,@modelid int,@ifthere int output,@x bit output
as
begin
declare @t bit
set @ifthere=dbo.IfThereOrder(@idOrder)
if @ifthere=0
   begin
   insert into Orders
   values(@selId,@cusId,@date)
   end
   exec UpdateAmount @size=@sizeid,@model=@modelid,@amount=@amount,@x=@t output
   set @x=@t
   if @x=1
   begin
     set @ifthere=(select max(OrderId) from Orders )
     insert into orderDetail
     values(@amount,@ifthere,@sizeId)
   end
   else
   print 'àéï áîìàé'
print @t
end 
--declare @d='24.03.2022' date
declare @total int
declare @tbit bit
exec AddOrderDetial 19,1002,6,'2024/03/2',1,9,18,7,@total output,@tbit output
print @total


create table ##OrderBySize(
Modelid int ,
modelname nvarchar(30),
color nvarchar(20),
price int,
Inventory int ,
Size int ,
SizeId int ,
categoryname nvarchar(30)

)
