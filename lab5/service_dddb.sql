CREATE SCHEMA service;
CREATE TABLE service.users (id SERIAL NOT NULL, full_name VARCHAR NOT
NULL, login VARCHAR NOT NULL UNIQUE, password VARCHAR NOT NULL);
INSERT INTO service.users (full_name, login, password) VALUES
('Ivanov Ivan','ivanov', '123456'),
('Sergeev Sergey','sergeev', '789012'),
('Maklen Diana','maklen', '573820'),
('Federico Victor','federiko', '239348'),
('Konfetkina Mary','konfetkina', '24u532'),
('Miheev Dima','miheev', '4526jd'),
('Sharova Katya','sharova', 'gjsk34'),
('Domichev Borya','domichev', '5294fh'),
('Grachev Sacha','grachev', 'fwnjh3'),
('Loginova Sonya','loginiva', '2fjwj3');