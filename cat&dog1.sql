

--  Tao table


CREATE TABLE  dbo.REGIONS
(
REGION_ID INT NOT NULL PRIMARY KEY
, REGION_NAME VARCHAR(50) NOT NULL
)


CREATE TABLE LEARNING_SQL.dbo.COUNTRIES 
  (
    COUNTRY_ID			CHAR(2) NOT NULL PRIMARY KEY
    , COUNTRY_NAME		VARCHAR(40) NOT NULL
    , REGION_ID			INT
    CONSTRAINT fk_countries_regions FOREIGN KEY(REGION_ID)
      REFERENCES LEARNING_SQL.dbo.REGIONS(REGION_ID) 
  )




--  TRONG BANG CatsAndDogs co bao nhieu Region
SELECT DISTINCT Region 
FROM applestaging.dbo.CatsAndDogs
WHERE Region IS NOT NULL 



--  Dogs > 1000 va sap xep theo thu tu tang dan cua so luong Dogs tang dan

SELECT [Location]
       , [Dog Population (in 1000)]
FROM applestaging.dbo.CatsAndDogs
WHERE [Dog Population (in 1000)] > 1000
ORDER BY [Dog Population (in 1000)]


--  Dogs > 1000 HOAC Cats > 1000 (Vung nay rat yeu thu vat) va sap xep vung mien theo thu tu giam dan cua vung mien

SELECT [Location]
      , [Dog Population (in 1000)]
	  , [Cat Population]
FROM applestaging.dbo.CatsAndDogs
WHERE [Dog Population (in 1000)] > 1000
OR [Cat Population] > 1000
ORDER BY [Location] DESC



--  tong so luong vat nuoi theo vung mien ma co so luong cho > 1000 hoac meo > 1000 va sap xep theo thu tu tong vat nuoi giam dan

SELECT [Location]
   , [Dog Population (in 1000)]
   , [Cat Population]
   , [Dog Population (in 1000)] + [Cat Population] AS TOTAL_PETS
FROM applestaging.dbo.CatsAndDogs
WHERE [Dog Population (in 1000)] > 1000
OR [Cat Population] > 1000
GROUP BY [Location], [Dog Population (in 1000)], [Cat Population]
ORDER BY TOTAL_PETS DESC

-- lay 10 location co so luong vat nuoi it nhat

SELECT TOP 10 Location
   , [Dog Population (in 1000)] + [Cat Population] AS TOTAL_PETS
FROM applestaging.dbo.CatsAndDogs
WHERE ([Dog Population (in 1000)] + [Cat Population]) IS NOT NULL -- Trong truong hop can dieu kien theo cot moi thi phai dung chinh cong thuc cua cot do de truy van
GROUP BY Location, [Dog Population (in 1000)], [Cat Population]
ORDER BY TOTAL_PETS
