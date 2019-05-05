/*
  Only one persone from each department is required to be selected. So
  we need to aggregate data twice. 
*/
SELECT
  aggregated.department as department,
  MAX(employee.name) as name,
  aggregated.salary as salary
FROM
  (
    SELECT
      department,
      MAX(salary) as salary
    FROM
      employee
    GROUP BY
      department
  ) AS aggregated
  INNER JOIN employee ON aggregated.department = employee.department
  AND aggregated.salary = employee.salary
GROUP BY
  aggregated.department,
  aggregated.salary
ORDER BY
  department,
  name;