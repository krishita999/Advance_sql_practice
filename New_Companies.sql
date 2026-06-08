-- Task - Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.
-- Note:
-- The tables may contain duplicate records.
-- The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.

SELECT c.company_code,c.founder,COUNT(DISTINCT lm.lead_manager_code),COUNT(DISTINCT sm.senior_manager_code),COUNT(DISTINCT m.manager_code),COUNT(DISTINCT e.employee_code)
FROM Company c
JOIN Lead_Manager lm
    ON c.company_code = lm.company_code
JOIN Senior_Manager sm
    ON lm.lead_manager_code = sm.lead_manager_code
JOIN Manager m
    ON sm.senior_manager_code = m.senior_manager_code
JOIN Employee e
    ON  m.manager_code = e.manager_code
GROUP BY c.company_code,c.founder
ORDER BY c.company_code;
