


CREATE DATABASE Assignment;

Use Assignment;

create table Actions (
				[Visitor_ID] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
				[Adv_table] [nvarchar] (1) NOT NULL,
				[Action] [nvarchar] (10) NOT NULL,
				);

INSERT INTO Actions(Adv_table, [Action])
VALUES ('A', 'Left'),
		('A', 'Order'),
		('B', 'Left'),
		('A', 'Order'),
		('A', 'Review'),
		('A', 'Left'),
		('B', 'Left'),
		('B', 'Order'),
		('B', 'Review'),
		('A', 'Review')


select *
from Actions

---A reklam tipininin toplam say�s�
select count(*)
from Actions
where Adv_table= 'A' 

---A reklam tipindeki sipari� say�s�
select count(*)
from Actions
where Adv_table= 'A' and Action='Order'

---B reklam tipininin toplam say�s�
select count(*)
from Actions
where Adv_table= 'B' 

---B reklam tipindeki sipari� say�s�
select count(*)
from Actions
where Adv_table= 'B' and Action='Order'




---A n�n sipari� olma oran�
select (select count(*)
		from Actions
		where Adv_table= 'A' and Action='Order') *1.0 / (select count(*)
		from Actions
		where Adv_table= 'A') *1.0


---B nin sipari� olma oran�
select (select count(*)
		from Actions
		where Adv_table= 'B' and Action='Order') *1.0 / (select count(*)
		from Actions
		where Adv_table= 'B') *1.0

----A ve B olas�l�klar�

CREATE TABLE #An (
					[Adv_Type] [nvarchar](10) NOT NULL,
					[Conversion_Rate] Float NOT NULL
				 )

INSERT #An (Adv_Type,Conversion_Rate)
VALUES ( 'A',(select (select count(*)
										from Actions
										where Adv_table = 'A' and [Action] = 'Order') *1.0 / (select Count(*)
										from Actions
										where Adv_table = 'A') *1.0 )), 
						   ('B', (select (select count(*)
										from Actions
										where Adv_table = 'B' and [Action] = 'Order') *1.0 / (select Count(*)
										from Actions
										where Adv_table = 'B') *1.0))

select * 
from #An