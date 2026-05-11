-- -- FUNCTIONS

-- CREATE OR REPLACE FUNCTION fn_add(a NUMBER, b NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN a + b;
-- END;
-- /

-- SELECT fn_add(10, 20) AS total FROM DUAL;

-- CREATE OR REPLACE FUNCTION fn_subtract(a NUMBER, b NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN a - b;
-- END;
-- /
-- SELECT fn_subtract(40, 20) AS result FROM DUAL;

-- CREATE OR REPLACE FUNCTION fn_multiply(a NUMBER, b NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN a * b;
-- END;
-- /
-- SELECT FN_MULTIPLY(40, 20) AS result FROM DUAL;

-- CREATE OR REPLACE FUNCTION fn_divide(a NUMBER, b NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN a / b;
-- END;
-- /
-- SELECT fn_divide(40, 20) AS result FROM DUAL;
-- CREATE OR REPLACE FUNCTION fn_square(a NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN a * a;
-- END;
-- /
-- SELECT FN_SQUARE (2) as result from dual;

-- CREATE OR REPLACE FUNCTION fn_cube(a NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN a * a * a;
-- END;
-- /
-- SELECT FN_CUBE (5) as result from dual;

-- CREATE OR REPLACE FUNCTION fn_even_odd(a NUMBER)
-- RETURN VARCHAR2
-- IS
-- BEGIN
--     IF MOD(a,2)=0 THEN
--         RETURN 'EVEN';
--     ELSE
--         RETURN 'ODD';
--     END IF;
-- END;
-- /
-- select FN_EVEN_ODD(10) as result from dual

-- CREATE OR REPLACE FUNCTION fn_max(a NUMBER, b NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     IF a > b THEN
--         RETURN a;
--     ELSE
--         RETURN b;
--     END IF;
-- END;
-- /
-- -- select FN_MAX(10,11) as result from dual

-- CREATE OR REPLACE FUNCTION fn_min(a NUMBER, b NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     IF a < b THEN
--         RETURN a;
--     ELSE
--         RETURN b;
--     END IF;
-- END;
-- /
-- select fn_min (9,7)as result from dual

-- CREATE OR REPLACE FUNCTION fn_factorial(n NUMBER)
-- RETURN NUMBER
-- IS
--     fact NUMBER := 1;
-- BEGIN
--     FOR i IN 1..n LOOP
--         fact := fact * i;
--     END LOOP;
--     RETURN fact;
-- END;
-- /
-- select fn_factorial(4) as result from dual
-- CREATE OR REPLACE FUNCTION fn_string_length(txt VARCHAR2)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN LENGTH(txt);
-- END;
-- /
-- select fn_string_length('Shalini Narayanaswamy') as result from dual

-- CREATE OR REPLACE FUNCTION fn_uppercase(txt VARCHAR2)
-- RETURN VARCHAR2
-- IS
-- BEGIN
--     RETURN UPPER(txt);
-- END;
-- /
-- select fn_uppercase ('shalini narayanswamy') as result from DUAL
-- CREATE OR REPLACE FUNCTION fn_lowercase(txt VARCHAR2)
-- RETURN VARCHAR2
-- IS
-- BEGIN
--     RETURN LOWER(txt);
-- END;

-- /
-- -- select fn_lowercase('SHALINI') as result from dual

-- CREATE OR REPLACE FUNCTION fn_reverse(txt VARCHAR2) 
-- RETURN VARCHAR2 
-- IS 
--     result VARCHAR2(4000);
-- BEGIN 
--      SELECT REVERSE(txt) INTO result FROM DUAL; 
--     RETURN result; 
-- END;
-- /
-- select FN_REVERSE('shalini') from dual

-- CREATE OR REPLACE FUNCTION fn_current_date
-- RETURN DATE
-- IS
-- BEGIN
--     RETURN SYSDATE;
-- END;
-- /
-- select FN_CURRENT_DATE from dual

-- CREATE OR REPLACE FUNCTION fn_age(dob DATE)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, dob)/12);
-- END;
-- /
-- SELECT fn_age(TO_DATE('2000-11-11', 'YYYY-MM-DD')) AS calculated_age FROM DUAL;

-- CREATE OR REPLACE FUNCTION fn_simple_interest(p NUMBER, r NUMBER, t NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN (p*r*t)/100;
-- END;
-- /
-- select fn_simple_interest(2,4,5) from dual

-- CREATE OR REPLACE FUNCTION fn_circle_area(radius NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN 3.14 * radius * radius;
-- END;
-- /
-- select fn_circle_area(8)from dual

-- CREATE OR REPLACE FUNCTION fn_palindrome(txt VARCHAR2)
-- RETURN VARCHAR2
-- IS
--     rev_txt VARCHAR2(4000);
-- BEGIN
--     SELECT REVERSE(txt) INTO rev_txt FROM DUAL;
    
-- --     IF txt = rev_txt THEN
-- --         RETURN 'PALINDROME';
-- --     ELSE
-- --         RETURN 'NOT PALINDROME';
-- --     END IF;
-- -- END;
-- -- /
-- -- SELECT fn_palindrome('madam') AS result FROM DUAL;

-- CREATE OR REPLACE FUNCTION fn_palindrome(txt VARCHAR2)
-- RETURN VARCHAR2
-- IS
--     rev_txt VARCHAR2(4000);
-- BEGIN
--     SELECT REVERSE(txt) INTO rev_txt FROM DUAL;
    
--     IF txt = rev_txt THEN
--         RETURN 'PALINDROME';
--     ELSE
--         RETURN 'NOT PALINDROME';
--     END IF;
-- END;
-- /
-- SELECT fn_palindrome('shalini') AS result FROM DUAL;

-- CREATE OR REPLACE FUNCTION fn_salary_hike(salary NUMBER, percent NUMBER)
-- RETURN NUMBER
-- IS
-- BEGIN
--     RETURN salary + (salary * percent/100);
-- END;
-- /
-- select fn_salary_hike(2000,10) from DUAL

-- ========================
-- PROCEDURE
-- ========================

-- CREATE OR REPLACE PROCEDURE pr_hello
-- IS
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('HELLO WORLD');
-- END;
-- /
-- BEGIN
--     pr_hello;
-- -- END;
-- CREATE OR REPLACE PROCEDURE pr_print_number(n NUMBER)
-- IS
-- BEGIN
--     DBMS_OUTPUT.PUT_LINE('NUMBER: ' || n);
-- END;
-- /
-- BEGIN
--     pr_print_number(100);
-- END;
-- /
CREATE OR REPLACE PROCEDURE pr_add(a NUMBER, b NUMBER)
IS
    c NUMBER;
BEGIN
    c := a + b;
    DBMS_OUTPUT.PUT_LINE('SUM: ' || c);
END;
/
BEGIN
    pr_ADD(10,11);
    END;