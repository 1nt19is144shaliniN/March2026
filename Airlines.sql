CREATE TABLE airlines (
    airline_id INT PRIMARY KEY,
    airline_name VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE flights (
    flight_id INT PRIMARY KEY,
    airline_id INT,
    source VARCHAR2(50),
    destination VARCHAR2(50),
    departure_time DATE,
    arrival_time DATE,
    price NUMBER(10,2),
    FOREIGN KEY (airline_id) REFERENCES airlines(airline_id)
);
INSERT INTO airlines VALUES
(1, 'Air India', 'India'),
(2, 'IndiGo', 'India'),
(3, 'Emirates', 'UAE'),
(4, 'Qatar Airways', 'Qatar');


INSERT INTO flights (flight_id, airline_id, source, destination, departure_time, arrival_time, price)
SELECT 101, 1, 'Delhi', 'Mumbai', TO_DATE('2026-04-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 600 FROM DUAL UNION ALL
SELECT 102, 1, 'Mumbai', 'Bangalore', TO_DATE('2026-04-02 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-02 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 750 FROM DUAL UNION ALL
SELECT 103, 2, 'Delhi', 'Bangalore', TO_DATE('2026-04-01 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 500 FROM DUAL UNION ALL
SELECT 104, 2, 'Bangalore', 'Chennai', TO_DATE('2026-04-03 06:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-03 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), 300 FROM DUAL UNION ALL
SELECT 105, 3, 'Dubai', 'Delhi', TO_DATE('2026-04-01 02:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-01 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1200 FROM DUAL UNION ALL
SELECT 106, 3, 'Delhi', 'Dubai', TO_DATE('2026-04-02 03:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1100 FROM DUAL UNION ALL
SELECT 107, 4, 'Doha', 'Mumbai', TO_DATE('2026-04-01 04:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1300 FROM DUAL UNION ALL
SELECT 108, 4, 'Mumbai', 'Doha', TO_DATE('2026-04-02 05:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-02 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1250 FROM DUAL UNION ALL
SELECT 110, 2, 'Delhi', 'Bangalore', TO_DATE('2026-04-04 07:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-04-04 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 550 FROM DUAL;

COMMIT;

-- WITH expensive_flights AS (
--     SELECT * FROM flights
--     WHERE price > 500
-- )
-- SELECT * FROM expensive_flights;

-- WITH flight_details AS (
--     SELECT a.airline_name, f.source, f.destination, f.price
--     FROM airlines a
--     JOIN flights f ON a.airline_id = f.airline_id
-- )
-- SELECT * FROM flight_details;

-- WITH avg_prices AS (
--     SELECT airline_id, AVG(price) as average_price
--     FROM flights
--     GROUP BY airline_id
-- )
-- SELECT * FROM avg_prices;

-- WITH high_value_airlines AS (
--     SELECT a.airline_name, AVG(f.price) as avg_price
--     FROM airlines a
--     JOIN flights f ON a.airline_id = f.airline_id
--     GROUP BY a.airline_name
-- )
-- SELECT * FROM high_value_airlines 
-- WHERE avg_price > 700;

-- WITH ranked_flights AS (
--     SELECT airline_id, flight_id, price,
--            RANK() OVER (PARTITION BY airline_id ORDER BY price DESC) as price_rank
--     FROM flights
-- )
-- SELECT * FROM ranked_flights;

-- WITH top_flights AS (
--     SELECT airline_id, flight_id, price,
--            ROW_NUMBER() OVER (PARTITION BY airline_id ORDER BY price DESC) as rn
--     FROM flights
-- )
-- SELECT * FROM top_flights 
-- WHERE rn = 1;

-- WITH flight_paths (source, destination, hops, path) AS (
--     -- Anchor member
--     SELECT source, destination, 1, source || ' -> ' || destination
--     FROM flights
--     WHERE source = 'Delhi'
--     UNION ALL
--     -- Recursive member
--     SELECT p.source, f.destination, p.hops + 1, p.path || ' -> ' || f.destination
--     FROM flight_paths p
--     JOIN flights f ON p.destination = f.source
--     WHERE p.hops < 3
-- )
-- SELECT * FROM flight_paths;

-- WITH duplicates AS (
--     SELECT flight_id, source, destination, departure_time,
--            COUNT(*) OVER (PARTITION BY source, destination, departure_time) as cnt
--     FROM flights
-- )
-- SELECT * FROM duplicates 
-- WHERE cnt > 1;
-- WITH running_totals AS (
--     SELECT airline_id, departure_time, price,
--            SUM(price) OVER (PARTITION BY airline_id ORDER BY departure_time) as running_total
--     FROM flights
-- )
-- SELECT * FROM running_totals;

-- WITH flight_counts AS (
--     SELECT airline_id, COUNT(*) as total_flights
--     FROM flights
--     GROUP BY airline_id
-- ),
-- flight_averages AS (
--     SELECT airline_id, AVG(price) as avg_price
--     FROM flights
--     GROUP BY airline_id
-- )
-- SELECT a.airline_name, c.total_flights, v.avg_price
-- FROM airlines a
-- JOIN flight_counts c ON a.airline_id = c.airline_id
-- JOIN flight_averages v ON a.airline_id = v.airline_id;