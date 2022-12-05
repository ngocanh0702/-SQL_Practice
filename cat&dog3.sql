

-- Sum pet acc Region
SELECT DISTINCT Region
FROM applestaging.dbo.CatsAndDogs

SELECT Region, SUM([Number of Households (in 1000)]) AS TOTAL_PET
FROM applestaging.dbo.CatsAndDogs
WHERE Region IS NOT NULL
AND SUM([Number of Households (in 1000)]) > 30000
GROUP BY Region


-- Max Cat 

SELECT MAX([Cat Population])
FROM applestaging.dbo.CatsAndDogs


SELECT Location
FROM applestaging.dbo.CatsAndDogs
WHERE [Cat Population] = 7118


SELECT Location, [Cat Population]
FROM applestaging.dbo.CatsAndDogs
WHERE [Cat Population] = (SELECT MAX([Cat Population])
						FROM applestaging.dbo.CatsAndDogs)


-- Min Cat

SELECT Location, [Dog Population (in 1000)]
FROM applestaging.dbo.CatsAndDogs
WHERE [Dog Population (in 1000)] = (SELECT MIN([Dog Population (in 1000)])
									FROM applestaging.dbo.CatsAndDogs)





-- Từ bảng Sale, day du lieu cot date, county và store TOTAL_STORE ở database applereport

SELECT date, county, store
INTO applereport.dbo.[TOTAL_STORE]
FROM applestaging.dbo.Sales


-- Từ bảng Sale, Tính bình quân cửa hàng theo từng county và đẩy dữ liệu vào một bảng mới có tên là AVG_STORE ở database applereport
SELECT county, AVG(store)
INTO applereport.dbo.[TOTAL_STORE]
FROM applestaging.dbo.Sales
GROUP BY county


SELECT * 
INTO applereport.dbo.[AVG_STORE]
FROM
(SELECT DATE AS [DATE]
		, county AS COUNTY
		, AVG(CAST(store AS INT)) AS AVG_STORE
FROM applestaging.dbo.Sales
WHERE county != ''
GROUP BY county, date) AS AVGS





	





