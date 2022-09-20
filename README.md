# DataBase-01
To know in which dabatase you are working, type the next command
```
SELECT DB_Name()
```

## [Insert - Update - Delete](https://github.com/ReyEduardo836/DataBase-01/blob/main/SQLQuery5.1%20-%20Gesti%C3%B3n%20de%20Registros%20(Insert-Update-Delete).sql)

## [Select - Where - Order by](https://github.com/ReyEduardo836/DataBase-01/blob/main/SQLQuery5.2%20-%20Consulta%20de%20Datos%20%20SQL%20(Select%20%E2%80%93Where%20%E2%80%93%20Order%20by).sql)

## [Constraints](https://github.com/ReyEduardo836/DataBase-01/blob/main/SQLQuery4%20-%20Constraints.sql)

* DEFAULT -> **City char(50) default 'Masaya'**
* NOT NULL -> **Last_Name varchar (30) NOT NULL**
* UNIQUE -> **SID integer Unique**
* CHECK -> **SID integer CHECK (SID > 2)**

## [System Functions](https://github.com/ReyEduardo836/DataBase-01/blob/main/SQLQuery5.3%20-%20Consultas%20y%20Funciones%20agregadas%20del%20Sistema.sql)

**MAX**
* To find the max value of some atribute, we use the function **MAX**
```
SELECT MAX(UnitPrice)
FROM Product
```

**MIN**
* To find the min value of some atribute, we use the function **MIN**
```
SELECT MIN(UnitPrice)
FROM Product
```

**COUNT**
* To count something we use the function **COUNT**, for example how many products cost 10 dollars
```
SELECT COUNT(Price)
FROM Product
WHERE Price = 10
```

**SUM**
* To know the sumatory of some data we use **SUM** (it always has to be grouped with **GROUP BY**), for example the sumatory of all the products bought by the user 1
```
SELECT SUM(Price)
FROM User
WHERE Id = 1
GROUP BY Id
```

**AVG**
* To know the average of some atribute we use the function **AVG** (it always has to be grouped with **GROUP BY**), for example the average of all the products bought by the user 1
```
SELECT AVG(Price)
FROM User
WHERE Id = 1
GROUP BY Id
```

**LEN**
* --TODO--
```
```


## [Operators and sub queries](https://github.com/ReyEduardo836/DataBase-01/blob/main/SQLQuery5.4%20-%20Sub%20Consultas.sql)

**LIKE**
* Queries that start with some letter or letters
Example, To find all the product names that start with "Es"
```
SELECT Name
FROM Product
WHERE Name LIKE 'Es%'
```
* Blank spaces mean any letter 
Example, To find all the product names that start wit "Es" and have 3 more letters
```
SELECT Name
FROM Product
WHERE Name LIKE 'Es___'
```

**IN**
* To bring the data that belongs to certain data given by the query that you want to see we use the function **IN**, for example to show the name of all the products that cost 10, 20, 30 dollars 
```
SELECT Name
FROM Product
WHERE Price IN(10,20,30)
```

**EXISTS**
* To bring information given by a sub query that return true or false (true if the sub query returns some result, false if not)
Example, Finding a list of customers who bought a pencil
```
SELECT Customer
FROM Bill b
WHERE EXISTS(
	SELECT * FROM Details d
	WHERE b.Num = d.BillNum AND d.Product = 'Pencil')
```

## UNION, UNION ALL, INTERSECT, EXCEPT

Press this URL to know more about this topic [**Press Here**](https://www.sqlshack.com/es/revision-ejemplos-y-uso-de-sql-union/)

## LEFT, SUBSTRING, CONCAT, UPPER, LOWER
Press this URL to know more about this topic [**Press Here**](http://www.edu4java.com/es/sql/sql9.html)

## Operator ANY or SOME
Press this URL to know more about this topic [**Press Here**](http://dbadixit.com/operador-any-o-some/#:~:text=El%20operador%20ANY%20(%20o%20SOME,la%20lista%20de%20valores%20proporcionada.&text=La%20lista%20de%20valores%20debe,pero%20de%20una%20sola%20columna.))

## Operator ALL
* This operator is used for comparing two lists of data, if the first list is the same as the second list, this will return true, else false.

## Time Functions
* **PRINT GETDATE()** To know the actual date
* **MONTH(Date)** To know the month of a date
* **DATEPART(HOUR, SomeHour)** To know the hour of some hour

# SELECT TOP Clause
* The **SELECT TOP** clause is used to specify the number of records to return
```
SELECT TOP 3 * 
FROM Customers
```

* We have the **SELECT TOP n WITH TIES**, this is used to bring n numbers of records, and if the last record repeats itself, it will be shown anyway.
**It always has to have a "GROUP BY" clause**
```
SELECT TOP 2 WITH TIES *
FROM Product
ORDER BY Price DESC
```
>**Note:** Not all database systems support the **SELECT TOP** clause. MySQL supports the **LIMIT** clause to select a limited number of records, while Oracle uses **FETCH FIRST n ROWS ONLY** and **ROWNUM.**