

-- Create table LOCATION

 CREATE TABLE LEARNING_SQL.dbo.LOCATIONS
  (
    LOCATION_ID BIGINT NOT NULL PRIMARY KEY,
    ADDRESS     VARCHAR( 255 ) NOT NULL,
    POSTAL_CODE VARCHAR( 20 ),          
    CITY        VARCHAR( 50 ),          
    STATE       VARCHAR( 50 ),          
    COUNTRY_ID  CHAR( 2 ), 
	COUNTRY_NAME NVARCHAR(100) DEFAULT('VIETNAM') -- Gán dữ liệu cho cột với giá trị mặc đinh
  )
 
 
 -- thêm một cột table

 ALTER TABLE LEARNING_SQL.dbo.LOCATIONS
 ADD REGION NVARCHAR(50) NULL



 ALTER TABLE LEARNING_SQL.dbo.LOCATIONS
 DROP COLUMN REGION

 --  đẩy dữ liệu vào một bảng 


INSERT INTO LEARNING_SQL.dbo.REGIONS
(REGION_ID,REGION_NAME) 
VALUES(1, 'Europe')

-- đẩy dữ liệu vào tất cả các cột trong trong bảng


INSERT INTO LEARNING_SQL.dbo.REGIONS
VALUES(2,'Americas')

--  đẩy dữ liệu vào bảng LOCATIONS 

INSERT INTO LEARNING_SQL.dbo.LOCATIONS
(LOCATION_ID, ADDRESS,POSTAL_CODE,CITY,STATE,COUNTRY_ID)
VALUES (1,'1297 Via Cola di Rie','00989','Roma', null,'IT')


INSERT INTO LEARNING_SQL.dbo.LOCATIONS
(LOCATION_ID,ADDRESS,POSTAL_CODE,CITY,STATE,COUNTRY_ID, COUNTRY_NAME) 
VALUES (3,'2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP', 'JAPAN')

-- Sửa định dạng dữ liệu của một cột trong bảng

ALTER TABLE LEARNING_SQL.dbo.LOCATIONS
ALTER COLUMN COUNTRY_NAME NVARCHAR(15)

-- Xóa bản ghi trong bảng

DELETE LEARNING_SQL.dbo.LOCATIONS
WHERE LOCATION_ID = 3

-- Cập nhật dữ liệu trong 1 table

UPDATE LEARNING_SQL.dbo.LOCATIONS
SET CITY = 'Hanoi'
WHERE LOCATION_ID = 1 
OR COUNTRY_NAME = 'VIETNAM'





--  lấy tên 3 cột Location, Region, Number of Households (in 1000) trong bảng [applestaging].[dbo].[CatsAndDogs], đặt tên mới lần lượt là Tên Bang, Vùng, Số lượng Hộ gia đình
-- Và sắp xếp từ A-Z theo Tên Bang

SELECT [Location] AS N'Tên Bang'
		, Region AS N'Vùng'
		, [Number of Households (in 1000)] N'Số lượng hộ gia đình'
FROM applestaging.dbo.CatsAndDogs AS CAD
ORDER BY [Location] DESC 

-- Sắp xếp theo thứ tự hộ gia đình giảm dần

SELECT [Location] AS N'Tên Bang'
		, Region AS N'Vùng'
		, [Number of Households (in 1000)] N'Số lượng hộ gia đình'
FROM applestaging.dbo.CatsAndDogs AS CAD
ORDER BY [Number of Households (in 1000)] DESC 
