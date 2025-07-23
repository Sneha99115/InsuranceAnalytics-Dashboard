create database Insurance_Analytics;
USE Insurance_Analytics;

/* 1-No of Invoice by Account Exec */
select * from invoice;
select Account_Executive,count(*) as invoice_number from invoice group by Account_Executive order by invoice_number desc;

/* 2-Yearly Meeting Count */
select * from meeting;
select year(meeting_date) as Year,count(*) as Meeting_Count from meeting group by year(meeting_date) order by Meeting_Count;


/* 4. Stage Funnel by Revenue */
select * from opportunity;
select stage, sum(revenue_amount) as total_amount from opportunity group by stage order by 
case when stage='Qualify Opportunity' then 1
when stage='Propose Solution' then 2
when stage='Negotiate' then 3
else 4
end;

/* 5. No of meeting By Account Exe */
select * from meeting;
select Account_Exe_ID,Account_Executive,count(*) as No_of_Meeting from meeting group by Account_Executive,Account_Exe_ID order by No_of_Meeting desc;

/* 6- Top Open Opportunity */

select * from opportunity;
select opportunity_name,revenue_amount,stage,closing_date from opportunity 
where stage in ('Propose Solution','Qualify Opportunity','Negotiate') -- Open stages 
order by revenue_amount desc limit 10;

