--תת שאליתות
--תת שאילתא-הצגת השמלות שמחירם גבוה מהממוצע של אותו קטוגריה~
select m.*
from Model m
where m.Price>=(select avg(inm.Price)
from Model inm  
where inm.CategoryId=m.CategoryId)
--הצגת העובדים שהשכר שלהם גבוה משכר הממוצע-תת שאילתא~
select *
from Seller
where SalaryHour>(select avg(SalaryHour) from Seller)
--מציג את הלקוחות שקנו יותר משתי הזמנות~
select *
 from Customer
 where 2<(select count(orderId)
 from orders
 where Customer.CustomerId=Orders.CustomerId)