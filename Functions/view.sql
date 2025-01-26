--view שמציג את ההזמנות ואת כל המוצרים לכל הזמנה
create view showClothesForOrders
as
select o.OrderId,orr.orderDetailId,orr.Amount,orr.SizeId
,s.Inventory,s.Size,s.ModelId,m.Color,m.Price,m.ModelName,m.CategoryId,c.CategoryName
from Orders o join orderDetail orr on orr.OrderId=o.OrderId
join Size s on orr.SizeId=s.SizeId join Model m on  m.ModelId=s.ModelId
join Category c on m.CategoryId=c.CategoryId
group by o.OrderId,orr.orderDetailId,orr.Amount,orr.SizeId
,s.Inventory,s.Size,s.ModelId,m.Color,m.Price,m.ModelName,m.CategoryId,c.CategoryName

select *
from showClothesForOrders
order by OrderId