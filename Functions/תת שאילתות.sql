--�� �������
--�� ������-���� ������ ������ ���� ������� �� ���� �������~
select m.*
from Model m
where m.Price>=(select avg(inm.Price)
from Model inm  
where inm.CategoryId=m.CategoryId)
--���� ������� ����� ���� ���� ���� ������-�� ������~
select *
from Seller
where SalaryHour>(select avg(SalaryHour) from Seller)
--���� �� ������� ���� ���� ���� ������~
select *
 from Customer
 where 2<(select count(orderId)
 from orders
 where Customer.CustomerId=Orders.CustomerId)