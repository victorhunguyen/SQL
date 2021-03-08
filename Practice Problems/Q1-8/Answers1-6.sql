--Question 1

SELECT Product
FROM prodcoffee
WHERE product LIKE 'Caf%';

--you can retrieve any product that has caf as a string in any part of its name. 
--Here you convert product name to uppercase using upper(….))
SELECT Product
FROM prodcoffee
WHERE upper(Product) LIKE '%CAF%';

--Question 2
SELECT states.Market, states.state, count(areacode.areaid) as Area
FROM areacode, states
WHERE areacode.stateid = states.stateid
GROUP BY states.market, states.state
ORDER BY area DESC;

--Question 3
SELECT S.Market, S.State, COUNT(A.areaid) as Area
FROM areacode A, states S
WHERE A.stateid = S.stateid
GROUP BY S.Market, S.State
HAVING COUNT(A.Areaid) >= 10
ORDER BY Area DESC;

--Question 4
SELECT Product, extract(year from factdate) as SalesYear, sum(sales), sum(profit)
FROM factcoffee, prodcoffee
WHERE factcoffee.productid = prodcoffee.productid AND extract(year from factdate) = 2013
GROUP BY Product, extract(year from factdate)
ORDER BY sum(sales) DESC;

--Question 5
Select areacode.areaid, states.state, sum(profit) as TotProfits
FROM areacode, factcoffee, states
WHERE areacode.areaid = factcoffee.areaid and states.stateid = areacode.STATEID
GROUP BY areacode.AREAID, states.state
ORDER by Totprofits ASC;

--Revised Question 5
SELECT * FROM(
Select areacode.areaid, states.state, sum(profit) as TotProfits
FROM areacode, factcoffee, states
WHERE areacode.areaid = factcoffee.areaid and states.stateid = areacode.STATEID
GROUP BY areacode.AREAID, states.state
ORDER by Totprofits ASC)
WHERE ROWNUM <=5;

--Question 6

SELECT prodcoffee.type, EXTRACT(YEAR FROM factdate) as WhichYear, sum(profit), sum(sales)
FROM factcoffee, prodcoffee
WHERE factcoffee.productid = prodcoffee.PRODUCTID
GROUP BY prodcoffee.type, extract(year from factdate);

