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

---

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

- ***Concatenating Fields: (组合列)***

  ` SELECT concat(vend_name, ' (', vend_country, ') ') FROM Vendors ORDER BY vend_name; `

- ***Aliases: (命名)***

  ` SELECT concat(vend_name, ' (', vend_country, ') ') AS vend_title FROM Vendors ORDER BY vend_name; `

- ***Calculation: (计算)***

  ` SELECT quantity * item_price AS total_sales, prod_id, quantity, item_price FROM OrderItems WHERE order_num = 20008; `
  
#### Use Data Manipulation Functions:

- ***Extract part of a strings***
  
  UPPER() ---> ` SELECT vend_name, UPPER (vend_name) AS vend_name_uppercase FROM Vendors ORDER BY vend_name; `
  
  SUBSTRING() ---> ` SELECT vend_name, SUBSTRING(vend_name, 1, 4) AS first_4_letters_of_vend_name FROM Vendors ORDER BY vend_name; `
  
-  ***Datatype converstion***
    
   YEAR() ---> ` SELECT order_num, order_date FROM Orders WHERE YEAR(order_date) = 2012; `

   NOW() ---> ` SELECT order_num, order_date, NOW() as currentdateandtime FROM Orders; `

-  ***Get current date***
    
   curdate() ---> Return current date as a single column
  
   datediff(curdate(), order_date) ---> ` SELECT order_num, order_date NOW() as currentdateandtime, curdate() as curdt, datediff(curdate(), order_date) as dategap FROM Orders; `

#### CASE Expression: (control flow function)

It can be used to conditionally enter into some logic based on the status of a condition being satisfied. Conditions have to be mutually exclusive.  

CASE WHEN [value=compare_value] THEN result

```
  SELECT prod_price,
       case when prod_price < 6 then 'low price'
	     else 'high price'
	     end as price_segment
  FROM Products;
```

#### Numeric Functions

These are used to perform mathematical operations on numeric data, for example, returning absolute numbers and performing algebraic calculations. 

` ABS(), COS(), EXP().... `

---

<br>
<br>

## Chapter 3: 数据的汇总

### Lecture 3.1 汇总数据1

#### Examples of Aggregate Functions

- Determining the number of rows in a table; 
- Obtaining the sum of a set of rows in a table;
- Finding the highest, lowest, and average values in a table column

#### AVG(), COUNT(), MAX(), MIN(), SUM() only five aggregate functions in SQL  (Make sure only one column in the bracket)

- ***AVG() Function - can be used to return the average value of any function***
  
  ` SELECT AVG(prod_price) AS avg_price FROM Products WHERE vend_id = 'DLL01'; ` 
  
  有空值的时候跳过空值，所以计算时的total number会有变化
  
- ***COUNT() Function - can determine the number of rows in a table or the number of rows that match a specific criterion***

  ` SELECT COUNT(*) AS num_cust FROM Customers; `
  
  返回customer列表中所有的行数，包括null
  
  ` SELECT COUNT(cust_email) AS num_cust FROM Customers; `
  
  返回cust_email中不包含null的行数

- ***MAX() Function - return the highest value in a specified column***

  ` SELECT MAX(prod_price) AS max_price FROM Products; `

- ***MIN() Function - return the lowest value in a specified column***
  
  ` SELECT MIN(prod_price) AS min_price FROM Products; `
  
- ***SUM() Function - return the sum of the values in a specific column***

  ` SELECT SUM(quantity) AS items_ordered FROM OrderItems WHERE order_num = 20005; `
  
  返回一个column内所有值的和
  
  ` SELECT SUM(item_price*quantity) AS total_sales FROM OrderItems WHERE order_num = 20005; `
  
  返回多个column计算的和
  
#### Aggregate on DISTINCT values:
  
  ` SELECT COUNT(DISTINCT prod_price) AS count_price FROM Products WHERE vend_id = 'DLL01'; `
  
  ` SELECT COUNT(DISTINCT vend_id) FROM Products; `
  
#### WHEN DOING ANALYSIS:

**IDENTIFY!!!**

  1. how many records?                    
  2. whether there are missings?
  3. whether there are dup records?

**Solution:** SELECT

          COUNT(*)                                  //find records
          
          COUNT(vend_id)                            //find missing 
          
          COUNT(DISTINCT vend_id) FROM Products;    //find duplicates
          
---

### Lecture 3.2 汇总数据2

Groups are created using the ` GROUP BY ` clause in your SELECT statement

```
SELECT  vend_id,
        COUNT(*) AS num_prod
        FROM Products
        GROUP BY vend_id
        ORDER BY num_prods;
```

Sometimes we call ` non-aggregated ` columns as ` segmentation variables `.

You can have more than one non-aggregated columns in SELECT statement, but make sure they are also in GROUP BY. 
**select中的分类变量必须出现在group by里!!!**

```
SELECT  order_num, prod_id,
        SUM(quantity)
        FROM OrderItems
        GROUP BY order_num, prod_id;
```

We can group by using relative position.

```
SELECT  order_num, prod_id,
        SUM(quantity)
        FROM OrderItems
        GROUP BY 1, 2;
```

#### FILTER Group

We have to use HAVING clause, instead of WHERE clause.

**WHERE --** filter before data is grouped

**HAVING --** filter after data is grouped

```
SELECT vend_id, COUNT(*) AS num_prods
        FROM Products
        WHERE prod_price >= 4
        GROUP BY vend_id
        HAVING COUNT(*) > 3;
```

Clause | Description | Required| 
-------|-------------|---------|
SELECT | Columns or expressions to be returned | YES
FROM   | Table to retrieve data from | Only if selecting data from a table
WHERE  | Row-level filtering | NO
GROUP BY | Group Specification | Only if calculating aggregates by group
HAVING | Group-level filtering | Only if calculating aggregates by group
ORDER BY | Output sort order | NO

#### Subquery -- queries that are embedded into other queries

```
SELECT cust_name, cust_contact
FROM Customers
WHERE cust_id IN (SELECT cust_id
                        FROM Orders
                        WHERE order_num IN (SELECT order_num FROM OrderItems 
                                            WHERE prod_id = 'RGAN101'));
```

Subquery SELECT statements can only retrieve a single column. Attempting to retrieve multiple columns will return an error.

---

<br>
<br>

## Chapter 4: Join的使用和进阶

