--úú ùàìéúåú
--úú ùàéìúà-äöâú äùîìåú ùîçéøí âáåä îäîîåöò ùì àåúå ÷èåâøéä~
select m.*
from Model m
where m.Price>=(select avg(inm.Price)
from Model inm  
where inm.CategoryId=m.CategoryId)
--äöâú äòåáãéí ùäùëø ùìäí âáåä îùëø äîîåöò-úú ùàéìúà~
select *
from Seller
where SalaryHour>(select avg(SalaryHour) from Seller)
--îöéâ àú äì÷åçåú ù÷ðå éåúø îùúé äæîðåú~
select *
 from Customer
 where 2<(select count(orderId)
 from orders
 where Customer.CustomerId=Orders.CustomerId)
