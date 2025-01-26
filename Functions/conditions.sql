--מציגה את 5 הבגדים שיש מהם הכי הרבה במלאיtop,order~
select top 5 s.*,m.*
from Size s join Model m on  m.ModelId=s.ModelId
order by s.Inventory desc
--הצגת הקטוגריות ששיכות לדגמים ללא כפיליותdistinct~
select distinct c.*
from Category c join Model m on m.CategoryId=c.CategoryId
--הצגת העובדים שלפחות לקוח אחד קנה מהם~
select se.SellerId,se.SellerFirstName+' '+se.SellerLastName ,count(o.CustomerId)
from Seller se join Orders o on o.SellerId=se.SellerId
group by se.SellerId,se.SellerFirstName,se.SellerLastName
having count(o.CustomerId)>=1
