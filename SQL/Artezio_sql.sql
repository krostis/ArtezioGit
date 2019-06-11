/*создаем базу работников*/
CREATE DATABASE IF NOT EXISTS employees;
USE employees;
CREATE TABLE IF NOT EXISTS employee (
id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT primary key,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL, 
rate MEDIUMINT UNSIGNED NOT NULL,
positions_id TINYINT UNSIGNED NOT NULL
);
INSERT INTO employee ( id, first_name, last_name, rate, positions_id) VALUES ( null, 'Viktor', 'Zolotov', 120000, 4);
INSERT INTO employee ( id, first_name, last_name, rate, positions_id) VALUES ( null, 'Stanislav', 'Boiko', 80000, 3);
INSERT INTO employee ( id, first_name, last_name, rate, positions_id) VALUES ( null, 'Svetlana', 'Kraeva', 80000, 3);
INSERT INTO employee ( id, first_name, last_name, rate, positions_id) VALUES ( null, 'Sergei', 'Nikiforov', 25000, 2);
INSERT INTO employee ( id, first_name, last_name, rate, positions_id) VALUES ( null, 'Klim', 'Voroshilov', 35000, 2);
INSERT INTO employee ( id, first_name, last_name, rate, positions_id) VALUES ( null, 'Gleb', 'Krotov', 35000, 1);
INSERT INTO employee ( id, first_name, last_name, rate, positions_id) VALUES ( null, 'Elizaveta', 'Peskova', 25000, 1);
INSERT INTO employee ( id, first_name, last_name, rate, positions_id) VALUES ( null, 'Renat', 'Gullatmizinov', 20000, 1);
CREATE TABLE IF NOT EXISTS positions (
id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT primary key,
positions_name VARCHAR(30) NOT NULL
);
INSERT INTO positions ( id, positions_name) VALUES ( null, 'Programmer');
INSERT INTO positions ( id, positions_name) VALUES ( null, 'Tester');
INSERT INTO positions ( id, positions_name) VALUES ( null, 'TeamLeader');
INSERT INTO positions ( id, positions_name) VALUES ( null, 'ProjectManager');

/*запрос работников, получающих меньше 30000*/
SELECT first_name, last_name, rate, p.positions_name
FROM employee
INNER JOIN positions p ON positions_id=p.id
WHERE rate < 30000;

/*запрос программистов, получающих меньше 30000*/
SELECT first_name, last_name, rate, p.positions_name
FROM employee
INNER JOIN positions p ON positions_id=p.id
WHERE rate < 30000 AND p.id = 1;

/*создаем базу начальник-подчиненный*/
CREATE TABLE IF NOT EXISTS head_dependent (
head_id SMALLINT UNSIGNED,
dependent_id SMALLINT UNSIGNED,
PRIMARY KEY (`head_id`, `dependent_id`)
);
INSERT INTO head_dependent ( head_id, dependent_id) VALUES ( 1, 2);
INSERT INTO head_dependent ( head_id, dependent_id) VALUES ( 2, 6);
INSERT INTO head_dependent ( head_id, dependent_id) VALUES ( 2, 7);
INSERT INTO head_dependent ( head_id, dependent_id) VALUES ( 2, 5);
INSERT INTO head_dependent ( head_id, dependent_id) VALUES ( 3, 5);
INSERT INTO head_dependent ( head_id, dependent_id) VALUES ( 5, 4);

/*вызываем всех подчиненных Станислава Бойко*/
SELECT first_name, last_name
FROM employee
INNER JOIN head_dependent p ON id=p.dependent_id
WHERE p.head_id = 2;
;
