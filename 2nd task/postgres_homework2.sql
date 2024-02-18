CREATE TABLE homework2.customer (
  customer_id SERIAL PRIMARY KEY, 
  first_name TEXT, 
  last_name TEXT, 
  gender TEXT, 
  DOB TEXT, 
  job_title TEXT, 
  job_industry_category TEXT,
  wealth_segment TEXT,
  deceased_indicator TEXT,
  owns_car TEXT,
  address TEXT,
  postcode TEXT,
  state TEXT,
  country TEXT,
  property_valuation INTEGER
);


CREATE TABLE homework2.transaction (
  transaction_id SERIAL PRIMARY KEY, 
  product_id integer, 
  customer_id integer, 
  transaction_date TEXT, 
  online_order TEXT, 
  order_status TEXT,
  brand TEXT,
  product_line TEXT,
  product_class TEXT,
  product_size TEXT,
  list_price float4,
  standard_cost float4
);


select 
	distinct brand
from 
	homework2.transaction
where 
	standard_cost>1500
	
select 
	*
from 
	homework2.transaction
where 
	order_status = 'Approved'
	and to_date(transaction_date,'DD.MM.YYYY') between '2017-04-01' and '2017-04-09'

	
select 
	*
from 
	homework2.transaction
where 
	order_status = 'Approved'
	and to_date(transaction_date,'DD.MM.YYYY') between '2017-04-01' and '2017-04-09'
	
	
select 
	*
from 
	homework2.customer
where 
	(job_industry_category = 'IT' or job_industry_category = 'Financial Services')
	and starts_with(job_title, 'Senior')


select 
	*
from 
	homework2.customer
where 
	(job_industry_category = 'Financial Services')
	and customer_id in 
	(select
		customer_id
	from 
		homework2.transaction
	where 
		brand in  ('Giant Bicycles', 'Norco Bicycles', 'Trek Bicycles')
		)
		
		
select 
	*
from 
	homework2.customer
where 
	customer_id not in 
	(select
		customer_id
	from 
		homework2.transaction
		)
		
		
select 
	*
from 
	homework2.customer
where 
	job_industry_category = 'IT'
	and customer_id in 
	(select
		customer_id
	from 
		homework2.transaction
	where 
		standard_cost = (
	    SELECT 
	      MAX (standard_cost) 
	    FROM 
	      homework2.transaction
	  )
	)
	
	
select 
	*
from 
	homework2.customer
where 
	job_industry_category in ('IT', 'Health')
	and customer_id in 
	(select
		customer_id
	from 
		homework2.transaction
	where 
		order_status = 'Approved'
		and to_date(transaction_date,'DD.MM.YYYY') between '2017-07-07' and '2017-07-17'
		)