-- Show the names of the employees who work on schedule 1, show the schedule and the position they have
USE ConstructionCompany;
SELECT employees.name_Employee as NameEmployee, workinghours.workinghours as WorkSchedule, type_employee.description as workposition
FROM employees
LEFT JOIN workinghours
ON employees.Code_Workinghours = workinghours.code_workinghours
INNER JOIN type_employee
ON employees.code_type_employee = type_employee.code_type_employee
WHERE employees.Code_Workinghours = 1;

-- Show the name and the area in which the partners who contributed more than 30,000 Bs live 
SELECT partner.name, partner.zone_address_partner as Address
FROM partner
WHERE partner.contribution_partner > 30000;

-- Show the total spent on material in the month of March 2022
SELECT SUM(materials_supplier.quantity * type_material.price_unit) as Total_Spent
FROM materials_supplier
INNER JOIN type_material
ON materials_supplier.code_material = type_material.code_material
WHERE MONTH(materials_supplier.date_purchase) = 3;

-- Show all employees who were paid for the month of March
SELECT employees.name_Employee as Name_Employee, employees.paternal_surname as Surname
FROM capital
INNER JOIN employees
ON capital.code_Employees = employees.code_Employee
WHERE MONTH(capital.Date_Payment) = 3;

-- Show the total of Contracts that are not permanents
SELECT SUM(contracts.permanent = 'No') as TotalContractsNotPermanents
FROM contracts
WHERE contracts.permanent = 'No';