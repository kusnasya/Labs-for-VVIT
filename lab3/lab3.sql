CREATE TABLE department
(
	id serial NOT NULL,
	department_name varchar(256) NOT NULL,
	deanery varchar(256) NOT NULL,
	primary key (id)
);
CREATE TABLE s_group
(
	id serial not null,
	s_group_name varchar(256) NOT NULL,
	department_id integer NOT NULL,
	primary key (id),
	foreign key (department_id) references department (id)
);
CREATE TABLE student
(
	id serial not null,
	student_name varchar(128) NOT NULL,
	student_doc integer NOT NULL,
	s_group_id integer NOT NULL,
	primary key (id),
	foreign key (s_group_id) references s_group (id)
);
insert into department (department_name, deanery) values
	('Прикладной искусственный интеллект', 'Информационные технологии'),
	('Информационная безопасность (ИБ)', 'Кибернетика и информационная безопасность');
insert into s_group (s_group_name, department_id) values
	('БВТ2201', 1),
	('БВТ2202', 1),
	('БИБ2201', 2),
	('БИБ2202', 2);
insert into student (student_name, student_doc, s_group_id) values
	('Виктор', '1504220374', 1),
	('Диана', '1534321884', 1),
	('Андрей', '1517629271', 1),
	('Михаил', '1528941025', 1),
	('Анастасия', '1214082274', 1),
	('Генадий', '1224218943', 2),
	('Елена', '1514311810', 2),
	('Дмитрий', '1511929271', 2),
	('Юрий', '1528041025', 2),
	('Георгий', '1214182274', 2),
	('Виктория', '1504220114', 3),
	('Григорий', '1534321884', 3),
	('Александр', '1517629271', 3),
	('Евгения', '1528941025', 3),
	('Степан', '1214082274', 3),
	('София', '1508020374', 4),
	('Сергей', '1512321884', 4),
	('Алексей', '1497629271', 4),
	('Оксана', '1368941025', 4),
	('Иван', '1211082274', 4);