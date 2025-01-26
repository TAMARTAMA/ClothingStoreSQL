create index index_firstLastName
on Customer (CusFirstName,CusLastName)
select CusFirstName,CusLastName
from Customer
order by CusFirstName

create index index_CityIdCus
on City (CityName)
select City.CityName 
from City 
order by City.CityName

