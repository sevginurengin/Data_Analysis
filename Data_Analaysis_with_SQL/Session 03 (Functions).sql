


-----------------------------------------------
-- DS 11/22 EU -- RDB&SQL Session 3 -----------
----------- 06.06.2022 ------------------------
-----------------------------------------------


/* 
SELECT
FROM
WHERE
ORDER BY
TOP
*/


SELECT *
FROM	product.brand
ORDER BY brand_name -- ASC


SELECT *
FROM	product.brand
ORDER BY brand_name DESC



SELECT TOP 10 *
FROM	product.brand
ORDER BY brand_id



SELECT TOP 10 *
FROM	product.brand
ORDER BY brand_id DESC


--WHERE


SELECT  brand_name
FROM	product.brand
WHERE	brand_name LIKE 'S%'



SELECT  *
FROM	product.product
WHERE	model_year BETWEEN 2019 AND 2021


SELECT  TOP 1 *
FROM	product.product
WHERE	model_year BETWEEN 2019 AND 2021
ORDER BY model_year DESC


---

SELECT *
FROM	product.product
WHERE	category_id IN (3,4,5)

--


SELECT *
FROM	product.product
WHERE	category_id = 3 OR category_id = 4 OR category_id = 5


---


SELECT	*
FROM	product.product
WHERE	category_id NOT IN (3,4,5)



SELECT	*
FROM	product.product
WHERE	category_id <> 3 AND category_id != 4 AND category_id <> 5 


-- 

SELECT	store_id, product_id, quantity
FROM	product.stock
ORDER BY 2,1



---

/* Session 3 Functions */

--Date Functions



CREATE TABLE t_date_time (
	A_time time,
	A_date date,
	A_smalldatetime smalldatetime,
	A_datetime datetime,
	A_datetime2 datetime2,
	A_datetimeoffset datetimeoffset
	)



select * from t_date_time


SELECT GETDATE() as get_date


INSERT t_date_time
VALUES ( GETDATE(), GETDATE(), GETDATE(), GETDATE(), GETDATE(), GETDATE() )



INSERT t_date_time (A_time, A_date, A_smalldatetime, A_datetime, A_datetime2, A_datetimeoffset)
VALUES 
('12:00:00', '2021-07-17', '2021-07-17','2021-07-17', '2021-07-17', '2021-07-17' )



----convert date to varchar


SELECT  GETDATE()

SELECT CONVERT(VARCHAR(10), GETDATE(), 6)


--VARCHAR TO DATE


SELECT CONVERT(DATE, '04 Jun 22' , 6)


SELECT CONVERT(DATETIME, '04 Jun 22' , 6)


---


----DATE FUNCTIONS



---Functions for return date or time parts

SELECT A_DATE
		, DAY(A_DATE) DAY_
		, MONTH(A_DATE) [MONTH]
		, DATENAME(DAYOFYEAR, A_DATE) DOY
		, DATEPART(WEEKDAY, A_date) WKD
		, DATENAME(MONTH, A_DATE) MON
FROM t_date_time




---

SELECT DATEDIFF(DAY, '2022-05-10', GETDATE())


SELECT DATEDIFF(SECOND, '2022-05-10', GETDATE())


---

--Teslimat tarihi ile kargolama/teslimat tarihi arasındaki gün farkını bulunuz.

SELECT	*, DATEDIFF(DAY, order_date, shipped_date) Diff_of_day
FROM	sale.orders
WHERE	DATEDIFF(DAY, order_date, shipped_date) > 2



SELECT	*
FROM	sale.orders
WHERE	DATEDIFF(DAY, order_date, shipped_date) > 2




---

SELECT DATEADD(DAY, 5, GETDATE())

SELECT DATEADD(MINUTE, 5, GETDATE())



SELECT EOMONTH(GETDATE())

SELECT EOMONTH(GETDATE(), 2)



--LEN, CHARINDEX, PATINDEX

SELECT LEN ('CHARACTER')


SELECT LEN ('CHARACTER ')

SELECT LEN (' CHARACTER ')

----

SELECT CHARINDEX('R', 'CHARACTER')

SELECT CHARINDEX('R', 'CHARACTER', 5)

SELECT CHARINDEX('RA', 'CHARACTER')

SELECT CHARINDEX('R', 'CHARACTER', 5) - 1


--R ile biten stringler

SELECT PATINDEX('%r', 'CHARACTER')

SELECT PATINDEX('%R', 'CHARACTER')

SELECT PATINDEX('%H%', 'CHARACTER')


SELECT PATINDEX('%A%', 'CHARACTER')

SELECT PATINDEX('__A______', 'CHARACTER')

SELECT PATINDEX('__A%', 'CHARACTER')

SELECT PATINDEX('____A%', 'CHARACTER')

SELECT PATINDEX('%A____', 'CHARACTER')


----

--LEFT, RIGHT, SUBSTRING

SELECT LEFT('CHARACTER', 3)

SELECT RIGHT('CHARACTER', 3)

SELECT SUBSTRING('CHARACTER', 3, 5)


SELECT SUBSTRING('CHARACTER', 4, 9)

---

--LOWER, UPPER, STRING_SPLIT

SELECT LOWER('CHARACTER')


SELECT UPPER('character')



SELECT value as name
FROM STRING_SPLIT('jack,martin,alain,owen', ',') 



----


---'character' kelimesinin ilk harfini büyülten bir script yazınız.


SELECT UPPER ('character')


SELECT UPPER (LEFT('character', 1))


SELECT SUBSTRING('character', 2, 9)

select LEN('character')


SELECT LOWER (SUBSTRING('character', 2, LEN('character')))


--SONUÇ
SELECT UPPER (LEFT('character', 1)) + LOWER (SUBSTRING('character', 2, LEN('character')))


SELECT CONCAT (UPPER(LEFT('character', 1)) , LOWER (SUBSTRING('character', 2, LEN('character'))))



-- TRIM -- https://docs.microsoft.com/en-us/sql/t-sql/functions/trim-transact-sql
-- LTRIM -- https://docs.microsoft.com/en-us/sql/t-sql/functions/ltrim-transact-sql
-- RTIM -- https://docs.microsoft.com/en-us/sql/t-sql/functions/rtrim-transact-sql

SELECT TRIM(' CHARACTER');

SELECT ' CHARACTER';

SELECT TRIM(' CHARACTER ')

SELECT TRIM(      '          CHAR ACTER          ')

-- Trim yapmak istediğimiz birden fazla karakter var ise bunları aşağıdaki gibi belirtebiliriz.
-- Girdiğimiz ifadenin içindeki herhangi bir karakterle karşılaştığında bu karakter silinecektir. Ta ki bu karakterler dışında başka bir karakterle kaşılaşana kadar.
SELECT TRIM('ABC' FROM 'CCCCBBBAAAFRHGKDFKSLDFJKSDFACBBCACABACABCA')


SELECT	TRIM('X' FROM 'ABCXXDE')

SELECT	TRIM('x' FROM 'XXXXXXXXABCXXDEXXXXXXXX')

SELECT LTRIM ('     CHARACTER ')

SELECT RTRIM ('     CHARACTER ')


-- REPLACE -- https://docs.microsoft.com/en-us/sql/t-sql/functions/replace-transact-sql
-- STR -- https://docs.microsoft.com/en-us/sql/t-sql/functions/str-transact-sql


SELECT REPLACE('CHA   RACTER     STR   ING', ' ', '/')

SELECT REPLACE('CHARACTER STRING', 'CHARACTER STRING', 'CHARACTER')

SELECT STR (5454)

SELECT STR (2135454654)

SELECT STR (133215.654645, 11, 3)

SELECT len(STR(1234567823421341241290123456))


-- CAST -- CONVERT -- https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql

SELECT CAST (12345 AS CHAR)

SELECT CAST (123.65 AS INT)


SELECT CONVERT(int, 30.60)

SELECT CONVERT (VARCHAR(10), '2020-10-10')

SELECT CONVERT (DATETIME, '2020-10-10' )

SELECT CONVERT (NVARCHAR, GETDATE(), 112 )

SELECT CAST ('20201010' AS DATE)

-- COALESCE -- https://docs.microsoft.com/en-us/sql/t-sql/language-elements/coalesce-transact-sql

SELECT COALESCE(NULL, 'Hi', 'Hello', NULL)


-- NULLIF -- https://docs.microsoft.com/en-us/sql/t-sql/language-elements/nullif-transact-sql

SELECT NULLIF (10,10)

SELECT NULLIF(10, 11)


-- ROUND -- https://docs.microsoft.com/en-us/sql/t-sql/functions/round-transact-sql
-- Üçüncü parametre sonucun aşağıya mı yukarıya mı yuvarlanacağını belirlemek için kullanılmaktadır.
-- Default olarak 0 (yani yukarıya yuvarlama) atanmıştır. Aşağı değere yuvarlamak için 1 yazılmalıdır.
SELECT ROUND (432.368, 2, 0)
SELECT ROUND (432.368, 2, 1)
SELECT ROUND (432.368, 2)

-- ISNULL -- https://docs.microsoft.com/en-us/sql/t-sql/functions/isnull-transact-sql

SELECT ISNULL(NULL, 'ABC')

SELECT ISNULL('', 'ABC')

-- ISNUMERIC -- https://docs.microsoft.com/en-us/sql/t-sql/functions/isnumeric-transact-sql


select ISNUMERIC(123)

select ISNUMERIC('ABC')

