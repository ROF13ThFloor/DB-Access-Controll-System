
-- q8

insert into subjects values
(DEFAULT, NULL, 'U', 'U', 'U', 'user1', 'pass1'),
(DEFAULT, NULL, 'U', 'U', 'U', 'user2', 'pass1'),
(DEFAULT, NULL, 'U', 'U', 'U', 'user3', 'pass1'),
(DEFAULT, NULL, 'U', 'U', 'U', 'user4', 'pass1'),
(DEFAULT, NULL, 'U', 'U', 'U', 'user5', 'pass1'),
(DEFAULT, NULL, 'U', 'U', 'U', 'user6', 'pass1');

insert into objects values
(default, 'U', 'U', 'U'),
(default, 'U', 'U', 'U'),
(default, 'U', 'U', 'U'),
(default, 'U', 'U', 'U'),
(default, 'U', 'U', 'U'),
(default, 'U', 'U', 'U');

insert into sections values
(101, 'General'),
(102, 'Speciality'),
(103, 'Subspecialty'),
(104, 'Emergency'),
(105, 'Medical'),
(106, 'Administrative'),
(201, 'Reports');

insert into nurses values
(2, 2, 'fateme', 'Rahmani', '127', 101, now(), 25, 10, 'single');

insert into doctors values
(3, 3, 'mojtaba', 'moazen', '1271', 'general', 101, now(), 25, 10, 'single');
