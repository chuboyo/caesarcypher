SELECT CONCAT('Chubiyojo', 'Akoji');

SELECT SUBSTRING('Professor', 3, 4);

SELECT CURDATE();

SELECT CURTIME();

SELECT * FROM employees;

SELECT COUNT(*) FROM employees;
SELECT COUNT(em_name) FROM employees;

SELECT COUNT(DISTINCT gender) FROM employees;

SELECT ROUND(AVG(salary), 2) FROM employees;

SELECT AVG(mentee_id) FROM mentorships;

SELECT MAX(salary) FROM employees;
SELECT MIN(salary) FROM employees;

SELECT SUM(salary) FROM employees;

SELECT gender, MAX(salary) FROM employees GROUP BY gender; 
SELECT gender, MAX(salary) FROM employees GROUP BY gender HAVING MAX(salary) > 10000;


CREATE TRIGGER update_ex_employees BEFORE DELETE ON employees FOR
EACH ROW
BEGIN
    INSERT INTO ex_employees (em_id, em_name, gender) VALUES
(OLD.id, OLD.em_name, OLD.gender);
END $$


CREATE PROCEDURE select_employeee(IN p_em_id INT)
BEGIN 
    SELECT * from employees WHERE id = p_em_id;
    SELECT * from mentorships WHERE mentor_id = p_em_id;
END $$

SELECT * FROM mentorships;
SELECT * FROM employees;
CALL select_info();

CREATE PROCEDURE employe_name_gender(IN p_em_id INT, OUT p_name VARCHAR(255),
OUT p_gender CHAR(1))
BEGIN 
    SELECT em_name, gender INTO p_name, p_gender FROM employees
    WHERE id = p_em_id;
END $$

CREATE PROCEDURE get_mentor(INOUT p_em_id INT, IN p_project VARCHAR(255))
BEGIN
    SELECT mentor_id INTO p_em_id FROM mentorships
        WHERE mentee_id = @v_id AND project = p_project;
END $$

CREATE FUNCTION calculate_bonussss(p_salary DECIMAL, p_multiple DECIMAL)
RETURNS DECIMAL DETERMINISTIC
BEGIN
    DECLARE bonus DECIMAL(5, 2);
    SET bonus = p_salary * p_multiple;
    RETURN bonus;
END $$