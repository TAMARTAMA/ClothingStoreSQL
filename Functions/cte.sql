--CTE
with sellerTable as
(select boss. SellerId,boss.SellerFirstName,boss.SellerLastName
,boss.SalaryHour,boss.CityId,boss.SelManager,1 as 'sellerlevel'
from Seller boss
where boss.SelManager is null
union all
select seller. SellerId,seller.SellerFirstName,seller.SellerLastName
,seller.SalaryHour,seller.CityId,seller.SelManager,sellerTable.sellerlevel+1
from Seller seller
join sellerTable
on seller.SelManager=sellerTable.SellerId
where seller.SelManager is not null
)
select *
from sellerTable
order by SellerId