# SQL Syntax

***Contributor: Bill Yao***

<br>
<br>

## Chapter 1: SQL的基本应用

### Lecture 1.1 认识SQL，为什么要学SQL

***What is SQL?*** 
Structurre Querry Language (SQL) is a speicla purpose programming language.

***What is database?*** 
A container to help organize data / a way to efficiently store and retrieve data.

*User ----> SQL ----> Database*

***Why LEARN SQL?***
- At least 80% - 90% of data analysis work is to wrtie SQL query.
- Almost every data-related job interviews will test SQL.
- Most of candidates will fail SQL interviews although they have learned it by themselves.

Database | Dataset | Model| Business Analysis 
---------|---------|------|------------------|
Oracle/Microsoft/Teradata | SAS dataset | Regression | Excel
AWS/Google/Azure | CSV | Decision Tree | Tableau

---

### Lecture 1.2 SQL的安装和设置

***SQL Server Installation***

MYSQLWorkbench

---

### Lecture 1.3 SQL基本语法(SELCT, SORT)

***SQL Statements***

*SELECT（选择）* 

` SELECT first_name, last_name FROM contacts;`

*INSERT（插入）* 

` INSERT INTO contacts(first_name, last_name) VALUES('Fritz', 'Onion'); `

*UPDATE（修改）* 

` UPDATE contacts SET last_name = 'Ahern' WHERE id=1; `

*DELETE（删除）* 

` DELETE FROM contacts where id = 2; `

*COMMENT（注释）* 

SELECT prod_id, prod_name, prod_price FROM Products  ` -- this is a comment `

` #This is also a comment `

` /* This is selecting mutiple lines ` <br>
` as comments */ `

<br>
<br>

## Chapter 2: SQL中的筛选和函数使用

### Lecture 2.1 使用WHERE语句进行筛选1

#### Order By Clause:  (default ascending sort order) -- Order从句进行column排序

` ORDER BY ` takes the name of one or more columns by which to sort the output.


- ` SELECT prod_name FROM Products ORDER BY prod_name; ` *(sort by one single conlumn order)* 

- ` SELECT prod_id, prod_price, prod_name FROM Products ORDER BY prod_price, prod_name; ` 
*(sort by mutiple columns order)*

- ` SELECT prod_id, prod_price, prod_name FROM Products ORDER BY 2, 3; ` 
*(sort by relative position column)*

***How to order by descending order (降序排列)***

` SELECT prod_id, prod_price, prod_name FROM Products ORDER BY prod_price DESC; `

#### Filter Data by using Where Clause -- WHERE从句用于筛选数据

SELECT ---> FROM ----> WHERE ---> ORDER BY

- ` SELECT prod_name, prod_price FROM Products WHERE prod_price = 3.49; `

- ` SELECT prod_name, prod_price FROM Products WHERE prod_price BETWEEN 5 AND 10; ` *(inclusive)*

- ` SELECT * From Customers WHERE Cust_email is not NULL; ` *("is not NULL" refers to non-empty blank)*

- ` SELECT prod_name, prod_price FROM Products WHERE vend_id = 'DLL01" AND prod_price <= 4; `

---

### Lecture 2.2 使用WHERE语句进行筛选2

***SQL processes AND operators before OR operators.(AND放在OR前面)***

` SELECT prod_name, prod_price FROM Products WHERE (vend_id = 'DLL01' OR vend_id = 'BRS01') AND prod_price >= 10; `

***IN用于代替多个OR***

` IN operators ` ---> used to specify a range of conditions, any of which can be matched (equivalent to a series of "or")

` SELECT prod_name, prod_price, vend_id FROM Products WHERE vend_id IN ('DLL01', 'BRS01'); `

#### WildCard Filtering ---> can be only used with text fields (Wildcard筛选) 

- '%' match any number of occurrences of any character (任意位置筛选)

  `  SELECT prod_id, prod_name FROM Products WHERE prod_name LIKE 'Fish%'; `
  
- '_' macth a single character （固定长度筛选）

  ` SELECT prod_id, prod_name FROM Products WHERE prod_name LIKE '__inch teddy bear'; `

---

### Lecture 2.3 常见函数的使用

> Rather than retrieve data as it is, what you really want is to retireve converted, calculated, or reformatted data directly from the database. 

- Concatenating Fields: (组合列)

  ` SELECT concat(vend_name, ' (', vend_country, ') ') FROM Vendors ORDER BY vend_name; `

- Aliases: (命名) 

  ` SELECT concat(vend_name, ' (', vend_country, ') ') AS vend_title FROM Vendors ORDER BY vend_name; `

- Calculation: (计算)

  ` SELECT quantity * item_price AS total_sales, prod_id, quantity, item_price FROM OrderItems WHERE order_num = 20008; `
  
#### Use Data Manipulation Functions:

- Extract part of a strings
  
  UPPER() ---> ` SELECT vend_name, UPPER (vend_name) AS vend_name_uppercase FROM Vendors ORDER BY vend_name; `
  
  SUBSTRING() ---> ` SELECT vend_name, SUBSTRING(vend_name, 1, 4) AS first_4_letters_of_vend_name FROM Vendors ORDER BY vend_name; `
  
-  Datatype converstion
    
   EAR() ---> ` SELECT order_num, order_date FROM Orders WHERE YEAR(order_date) = 2012; `

   NOW() ---> ` SELECT order_num, order_date, NOW() as currentdateandtime FROM Orders; `

-  Get current date
    
   curdate() ---> Return current date as a single column
  
   datediff(curdate(), order_date) ---> ` SELECT order_num, order_date NOW() as currentdateandtime, curdate() as curdt, datediff(curdate(), order_date) as dategap FROM Orders; `


