-- 1. 
select DATEPART(YEAR, OrderDate) Año, DATEPART(QUARTER, OrderDate) Trimestre, SUM((UnitPrice*Quantity-((UnitPrice*Quantity)*(Discount)))) recaudacion
from Orders O inner join [Order Details] od on o.OrderID = od.OrderID
group by DATEPART(YEAR, OrderDate), DATEPART(QUARTER, OrderDate)
order by DATEPART(YEAR, OrderDate) asc
-- 2.	YA 
select DATEPART(YEAR, OrderDate) Año, datename(month, DATEPART(MONTH, OrderDate)*29) mes, SUM((UnitPrice*Quantity-((UnitPrice*Quantity)*(Discount)))) recaudacion
from Orders O inner join [Order Details] od on o.OrderID = od.OrderID
group by DATEPART(YEAR, OrderDate), DATEPART(MONTH, OrderDate)
order by DATEPART(YEAR, OrderDate) asc
--3.    YA
select p.ProductID, ProductName, sum(od.quantity) cantidadVendida, count(od.quantity) cantidadDeOrdenes, 
(select count(discount) from [Order Details] where discount != 0 AND ProductID = p.ProductID) CantidadDescuento,
(select count(discount) from [Order Details] where discount = 0 AND ProductID = p.ProductID) CantidadSinDescuento
from Products p inner join [Order Details] od on p.ProductID = od.ProductID
group by p.ProductID, p.ProductName
order by sum(od.quantity) desc
--4.
declare @TotalQuantity float
select @TotalQuantity = count(*) from orders
print @TotalQuantity

select shipcountry, count(shipcountry) cantidad, concat(round((count(shipcountry)/@TotalQuantity)*100, 2), ' %') Porcentaje
from orders
group by ShipCountry
order by count(shipcountry) desc