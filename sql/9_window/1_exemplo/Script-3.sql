use sqlnotes;


CREATE TABLE sql_table3 (
    Dia DATE ,
    Revenue float
);



INSERT INTO sql_table3  VALUES 
( '2023-01-01',  100),
( '2023-01-02',  150),
( '2023-01-03',  200),
( '2023-01-04',  120)

select * from sql_table3

SELECT
  Dia,
  Revenue,
  SUM(Revenue) OVER (ORDER BY Dia) AS RunningTotal,
  AVG(Revenue) OVER (ORDER BY Dia) AS MovingAverage
FROM sql_table3;


SELECT
  Dia,
  Revenue,
  LEAD(Revenue, 1) OVER (ORDER BY Dia) AS NextDayRevenue,
  LAG(Revenue, 1) OVER (ORDER BY Dia) AS PreviousDayRevenue
FROM sql_table3;


SELECT
  Dia,
  Revenue,
  AVG(Revenue) OVER (ORDER BY Dia ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS SevenDayMovingAvg
FROM sql_table3;



SELECT
  Dia,
  Revenue,
  SUM(Revenue) OVER (ORDER BY Dia) AS RunningTotal,
  max(Revenue) OVER()  AS MaxRunningTotal
  #,
  #MaxRunningTotal / RunningTotal
FROM sql_table3;


