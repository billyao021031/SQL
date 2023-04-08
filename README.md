# SQL Syntax

***Author: Bill Yao***

<br>

## Chapter 1: SQL的基本应用

### Lecture 1.1

**What is SQL?** <br>
Structurre Querry Language (SQL) is a speicla purpose programming language.

**What is database?** <br>
A container to help organize data / a way to efficiently store and retrieve data.

*User ----> SQL ----> Database*

**Why LEARN SQL?**
- At least 80% - 90% of data analysis work is to wrtie SQL query.
- Almost every data-related job interviews will test SQL.
- Most of candidates will fail SQL interviews although they have learned it by themselves.

Database | Dataset | Model| Business Analysis 
---------|---------|------|------------------|
Oracle/Microsoft/Teradata | SAS dataset | Regression | Excel
AWS/Google/Azure | CSV | Decision Tree | Tableau

---

### Lecture 1.2

**SQL Server Installation** <br>
MYSQLWorkbench

---

### Lecture 1.3

**SQL Statement:**

*SELECT（选择）* <br>
` SELECT first_name, last_name FROM contacts;`

*INSERT（插入）* <br>
` INSERT INTO contacts(first_name, last_name) VALUES('Fritz', 'Onion'); `

*UPDATE（修改）* <br>
` UPDATE contacts SET last_name = 'Ahern' WHERE id=1; `

*DELETE（删除）* <br>
` DELETE FROM contacts where id = 2; `

*Comment（注释）* <br>

SELECT prod_id, prod_name, prod_price FROM Products  ` -- this is a comment `

` #This is also a comment `

` /* This is selecting mutiple lines ` <br>
` as comments */ `

<br>

## Chapter 2: SQL中的筛选和函数使用

### Lecture 2.1:
