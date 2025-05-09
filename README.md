# Database Queries Showcase

This project demonstrates various SQL queries performed on two distinct databases: "**tienda**" (shop) and "**universidad**" (university). Below, you'll find a categorized list of the queries executed for each database, describing the purpose of each query.

## "tienda" Database Queries

This section contains SQL queries designed for the "**tienda**" database.

1.  -- Lists the name of all products in the 'producto' table.
2.  -- Lists the names and prices of all products in the 'producto' table.
3.  -- Lists all columns of the 'producto' table.
4.  -- Lists the product name, price in Euros, and price in US Dollars (USD).
5.  -- Lists the product name, price in Euros, and price in US Dollars.
6.  -- Lists the names and prices, with names in uppercase.
7.  -- Lists the names and prices, with names in lowercase.
8.  -- Shows manufacturer names with the first two letters in uppercase.
9.  -- Shows names and rounded prices.
10. -- Shows names and truncated prices (without decimals).
11. -- Lists manufacturer codes associated with products.
12. -- Lists unique manufacturer codes associated with products.
13. -- Lists manufacturer names ordered in ascending order.
14. -- Lists manufacturer names ordered in descending order.
15. -- Lists product names ordered by name (ascending) and then by price (descending).
16. -- Retrieves the first 5 rows from the 'fabricante' table.
17. -- Retrieves 2 rows from the 'fabricante' table, starting from the fourth row.
18. -- Finds the cheapest product.
19. -- Finds the most expensive product.
20. -- Finds the cheapest product along with its manufacturer's name.
21. -- Lists the product name, price, and manufacturer name.
22. -- Lists the product name, price, and manufacturer name, ordered by manufacturer.
23. -- Lists the product code, name, and manufacturer name.
24. -- Finds the cheapest product along with its manufacturer's name.
25. -- Finds the most expensive product along with its manufacturer's name.
26. -- Lists all products from the manufacturer 'Lenovo'.
27. -- Lists products from 'Crucial' with a price greater than 200.
28. -- Lists products from 'Asus', 'Hewlett-Packard', and 'Seagate' (without using the `IN` operator).
29. -- Lists products from 'Asus', 'Hewlett-Packard', and 'Seagate' (using the `IN` operator).
30. -- Lists products with manufacturers whose names end in 'e'.
31. -- Lists products with manufacturers whose names contain 'w'.
32. -- Lists products with a price greater than or equal to 180, ordered by price descending and then by name ascending.
33. -- Lists products with a price between 100 and 200 (inclusive), ordered by price ascending.
34. -- Lists the unique codes and names of manufacturers that have associated products.
35. -- Lists only manufacturers that do not have any associated products.
36. -- Lists products from 'Lenovo' (without using `INNER JOIN`).

## "universidad" Database Queries

This section features SQL queries tailored for the "**universidad**" database.

1.  -- Returns the total number of students.
2.  -- Calculates the number of students born in 1999.
3.  -- Shows the number of professors in each department (only departments with professors are listed).
4.  -- Shows all departments along with the number of professors in each (includes departments with no professors).
5.  -- Lists all degrees and the number of subjects in each (includes degrees with no subjects).
6.  -- Lists degrees that have more than 40 subjects.
7.  -- Shows the name of each degree and the total credits for each type of subject within that degree.
8.  -- Shows the number of students enrolled in each academic year.
9.  -- Shows the number of subjects taught by each professor (includes professors who don't teach any subjects).
10. -- Retrieves the information of the youngest student.
11. -- Lists professors who are associated with a department but do not teach any subjects.
12. -- Returns a list with the first surname, middle surname, and first name of all students. The list must be sorted alphabetically from lowest to highest by first surname, middle surname, and first name.
13. -- Finds the first and both surnames of students who have not registered their phone number in the database.
14. -- Returns a list of students born in 1999.
15. -- Returns a list of teachers who have not registered their phone number in the database and whose NIF ends in K.
16. -- Returns a list of courses taught in the first semester, in the third year of the degree with the identifier 7.
17. -- Returns a list of teachers along with the name of the department to which they are associated. The list must return four columns: first surname, middle surname, first name, and department name. The result will be sorted alphabetically from lowest to highest by last name and first name.
18. --Returns a list of course names, start year, and end year of the academic year for the student with NIF 26902806M.
19. --Returns a list of all departments with professors teaching a course in the Bachelor's Degree in Computer Engineering (2015 Curriculum).
20. --Returns a list of all students enrolled in a course during the 2018/2019 academic year.

## 🗄️ Database Management

- **Database system:** MySQL 8  
- **GUI client:** DBeaver 25.09.3

### 🛠️ Connection Parameters

- **Host:** `localhost`  
- **Port:** `3308`  
- **User:** `root`  
- **Password:** `root`  
- **Database name:** `universidad` and `tienda`

> 💡 You can use DBeaver or any preferred SQL client to explore, manage, and query the database structure.
