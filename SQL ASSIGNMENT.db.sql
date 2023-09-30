select * from `Order Details`;
SElect * from Products;
-- Calculating how many quantities sold in each product and sorting them with highest quantities sold with their maximum quantity- supplier companyname
select Prdqty.ProductID,Prdqty.Productname,sum(quantity) as `total quantity`,Prdqty.CompanyName
from (
select Products.ProductID,Products.ProductName,`Order Details`.Quantity,Suppliers.SupplierID,Suppliers.CompanyName
from Products 
inner join `Order Details` on Products.ProductID=`Order details`.ProductID
inner join Suppliers on Suppliers.SupplierID= Products.SupplierID ) as Prdqty
group by Prdqty.ProductID
order by `total quantity` desc;

Select * from Products;
select * from Suppliers;


-- Suppliers with no of products supplying  
Select Suppliers.SupplierID, Suppliers.CompanyName,count(Products.ProductName) as `No of products supplying`,max(QuantityPerUnit) as `MAX Quantity Supplied`,Products.ProductName
from Products
inner join Suppliers on Suppliers.SupplierID= Products.SupplierID 
group by  Suppliers.SupplierID
order by count(Products.ProductName) desc;
 
 
 
select * from Products;
 
select * from Suppliers;
--Calculating how many products are supplied by each supplierID and ranking them with their top supply
with Supply_Product_Rank as (
  select Suppliers.supplierID,products.ProductName,products.QuantityPerUnit,dense_rank() over(Partition by  Suppliers.SupplierID order by  products.QuantityPerUnit desc)as rankqty
  from products inner join Suppliers on  Suppliers.SupplierID= Products.SupplierID 
  order by Suppliers.supplierID)

  select SupplierID,ProductName,rankqty
  from Supply_Product_Rank
  where rankqty=1

  
