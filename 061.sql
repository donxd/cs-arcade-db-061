/*Please add ; after each select statement*/
CREATE PROCEDURE recentHires()
BEGIN
    SET @n = 0;

    SELECT 
        dataResult.name as names
    FROM (
        ( 
            SELECT 
            (@n := @n + 1) as ind,
            -- data1Order.name as names
            data1Order.name
            FROM (
                SELECT 
                name
                FROM (
                    SELECT
                    name
                    FROM pr_department 
                    ORDER BY date_joined DESC -- ; 
                    LIMIT 5-- ; 
                ) data1
                ORDER BY data1.name ASC 
            ) data1Order
         )
        -- / * 
        UNION -- ALL 
        ( 
            SELECT 
            (@n := @n + 1) as ind,
            -- data2Order.name as names 
            data2Order.name
            FROM (
                SELECT 
                name
                FROM (
                    SELECT
                    name
                    FROM it_department 
                    ORDER BY date_joined DESC -- ; 
                    LIMIT 5
                ) data2
                ORDER BY data2.name ASC 
            ) data2Order
        ) -- ;
        UNION -- ALL 
        ( 
            SELECT 
            (@n := @n + 1) as ind,
            -- data3Order.name as names 
            data3Order.name
            FROM (
                SELECT 
                name
                FROM (
                    SELECT
                    name
                    FROM sales_department 
                    ORDER BY date_joined DESC -- ; 
                    LIMIT 5
                ) data3
                ORDER BY data3.name ASC 
            ) data3Order
        )
    ) dataResult;
END