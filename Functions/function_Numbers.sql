

--4 úéàåø) äöâä ìëì òåáã àú äîðäì  ùìå îòðä ìîèøä îñôø )~
select s1.SellerFirstName +' '+s1.SellerLastName  as'nameSeller',s2.SellerFirstName +' '+ s2.SellerLastName as' nameManager'
from Seller s1 join Seller s2 on s1.SelManager=s2.SellerId
--àå
select s1.SellerFirstName +' '+s1.SellerLastName  as'nameSeller',s2.SellerFirstName +' '+ s2.SellerLastName as' nameManager'
from Seller s1, Seller s2
where s1.SelManager=s2.SellerId
--ôåð ùîöéâä àú  äîçéø äî÷ñéîìé ìãâí  ~
select *
from Model
where Price=(select max(Price) from  Model  )
--îöéâ àú äãâîéí ù÷ðå îäí éåúø îàçã~
select s.SizeId,m.ModelName
from Size s join Model m on m.ModelId=s.ModelId 
where (select count(o.Amount) from orderDetail o where s.SizeId=o.SizeId)>1
--îîåöò îçéø ìëì îéãä áúðàé ùäîçéø äîîåöò âãåì î100~
select s.SizeId, s.Size,avg(m.Price)
from Size s join Model m on m.ModelId=s.ModelId 
group by s.SizeId ,s.Size
having avg(m.Price)>100
--äöáò äëé ôåôìøé ááâãéí~
select m.Color,count(*)
from Model m left join Size s on s.ModelId=m.ModelId left join orderDetail o on o.SizeId=s.SizeId
group by m.Color
--äöâú îîåöò äæîðåú ìì÷åç~
select avg(sumTocus) as avgCountOrders
from (select c.CustomerId,count(o.OrderId) as sumTocus
from Customer c join Orders o on o.CustomerId=c.CustomerId
group by c.CustomerId )avgTocus

