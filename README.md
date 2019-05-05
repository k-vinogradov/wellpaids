# wellpaids

This repo contains the solution of the SQL challenge by [Ostrovok](https://github.com/ostrovok-team). The original problem description can be found [here](https://github.com/ostrovok-team/code-challenge/tree/master/python). 

**The only purpose of the project is improving of my Python developer skills**

## Solution

```sql
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
```

## Test with Docker

Requirements:

* Docker
* docker-compose

Run the following command:

    docker-compose up --abort-on-container-exit --build

Query result can be found in the `./output` directory.

## Original Problem

>Вам дана таблица в postgres, которая представляет из себя список сотрудников с их зарплатами и отделами.
>
>Необходимо написать запрос, который будет выбирать человека с максимальной зарплатой из каждого отдела. В качестве тестовых данных можете использовать [дамп таблицы](employee.sql), пример схемы:
>
>```
>postgres=# \d employee
>       Table "public.employee"
>Column   |         Type          | Modifiers
>------------+-----------------------+-----------
>id         | integer               | not null
>name       | character varying(30) |
>department | character varying(30) |
>salary     | integer               |
>Indexes:
>"employee_pkey" PRIMARY KEY, btree (id)
>​```
>```
