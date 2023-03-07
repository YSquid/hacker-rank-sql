    SELECT company.company_code, company.founder, 
    --count distinct as duplicate rows will be inserted from each joined table
    -- e.g. for company with 1 founder, 2 senior, 3 manager, 5 employee
    -- will have 5 rows - one for each employee. Will have founder duplicated 5 times, senior 2 and 3 times, and manager 1 2 and 2 times (could be other dupes based on data)
    --therefore we want the distinct values for each code
    COUNT(DISTINCT(lead_manager.lead_manager_code)), 
    COUNT(DISTINCT(senior_manager.senior_manager_code)),
    COUNT(DISTINCT(manager.manager_code)),
    COUNT(DISTINCT(employee.employee_code))

    --join all the tables using company_code
    FROM company INNER JOIN lead_manager ON company.company_code = lead_manager.company_code
    INNER JOIN senior_manager ON company.company_code = senior_manager.company_code
    INNER JOIN manager ON company.company_code = manager.company_code
    INNER JOIN employee ON company.company_code = employee.employee_code
    --group by company code and founder - the two columns that we arent using aggregate functions for
    GROUP BY company.company_code, company.founder;