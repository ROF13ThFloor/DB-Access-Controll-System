--drop table system_manager;
--drop table manager;
--drop table administrative_assistant;
--drop table medical_assistant;
--drop table login_patients;
--drop table login_personel;
--drop table reports_patients;
--drop table reports_personel;
--drop table target_assignment;
--drop table patient_targets;
--drop table section_manager;
--drop table patients;
--drop table Doctors;
--drop table Nurses;
--drop table Employees;
--drop table category;
--drop table Sections;
--drop table all_personels;

create table Sections(
	section_id INT not null PRIMARY KEY,
	section_name VARCHAR (255) UNIQUE NOT null
);

create table Subjects(
	subject_id INT primary key,
	role varchar(10) not null check (role in ('doctor', 'nurse', 'employee', 'patient')),
	ASL varchar(5) not null check (ASL in ('TS', 'S', 'C', 'U')), -- Absolute
	RSL varchar(5) not null check (RSL in ('TS', 'S', 'C', 'U')), -- Read
	WSL varchar(5) not null check (WSL in ('TS', 'S', 'C', 'U')), -- Write
	user_name varchar(255) not null,
	password varchar(255) not null
);

create table Objects(
	object_id INT not null  primary key,
	ASL varchar(5) not null check (ASL in ('TS', 'S', 'C', 'U')),
	MSL varchar(5) not null check (MSL in ('TS', 'S', 'C', 'U')),
	CSL varchar(5) not null check (CSL in ('TS', 'S', 'C', 'U'))
);

create table Subject_Category(
	subject_id INT not null references Subjects(subject_id),
	section_id INT not null references Sections(section_id),
	primary key(subject_id, section_id)
);

create table Object_Category(
	object_id INT not null references Objects(object_id),
	section_id INT not null references Sections(section_id),
	primary key(object_id, section_id)
);


CREATE TABLE Doctors(
	subject_id int not null primary key references subjects(subject_id),
	object_id int not null references Objects(object_id),
	f_name VARCHAR (255) NOT null,
	l_name VARCHAR (255) NOT null,
	national_id INT UNIQUE NOT null,
	specialty VARCHAR (255) NOT null,
	section_id INT references sections(section_id),
	employment_date DATE not null,
	age INT,
	salary INT not null,
	marital_status varchar(8) check (marital_status in ('married', 'single'))
);


CREATE TABLE Nurses(
	subject_id int not null primary key references subjects(subject_id),
	object_id int not null references Objects(object_id),
	f_name VARCHAR (255) NOT null,
	l_name VARCHAR (255) NOT null,
	national_id INT UNIQUE NOT null,
	section_id INT not null references sections(section_id),
	employment_date DATE not null,
	age INT,
	salary INT not null,
	marital_status char(8) check (marital_status in ('married', 'single'))
);


CREATE table Employees(
	subject_id int not null primary key references subjects(subject_id),
	object_id int not null references Objects(object_id),
	f_name VARCHAR (255) NOT null,
	l_name VARCHAR (255) NOT null,
	national_id INT UNIQUE NOT null,
	job VARCHAR (255) NOT null check (job in ('financial', 'official', 'other')),
	employment_date DATE not null,
	age INT,
	salary INT not null,
	marital_status char(8) check (marital_status in ('married', 'single'))
);


CREATE TABLE Patients(
	registeration_id INT not null PRIMARY key,
	subject_id int not null references subjects(subject_id),
	object_id int not null references Objects(object_id),
	f_name VARCHAR (255) UNIQUE NOT null,
	l_name VARCHAR (255) UNIQUE NOT null,
	national_id INT UNIQUE NOT null,
	age INT,
	sex char(10) check (sex in ('Male', 'Female')),
	illness VARCHAR (255),
	section_id INT not null references Sections(section_id),
	drugs VARCHAR (255),
	doctor_id INT not null references Doctors(subject_id),
	nurse_id INT not null references Nurses(subject_id)
);

create table Section_Manager(
	section_id INT not null references Sections(section_id),
	manager_id INT not null references Doctors(subject_id),
	primary key(section_id, manager_id)
);

create table Manager(
	manager_id int not null references Doctors(subject_id)
);

create table System_Manager(
	manager_id int not null references Employees(subject_id)
);

create table Administrative_assistant(
	assistant_id int not null references Doctors(subject_id)
);

create table Medical_assistant(
	assistant_id int not null references Doctors(subject_id)
);

create table Target_assignment(
	target_id serial not null primary key,
	target_type varchar(20) not null, -- check (target_type in ('')) TODO
	subject_id int not null references Subjects(subject_id)
);

create table Object_Targets(
	target_id serial not null primary key,
	target_type varchar(20) not null, -- check (target_type in ('')) TODO
	object_id int not null references Objects(object_id)
);

create table Reports(
	report_id serial not null primary key,
	reporter_id int not null references Subjects(subject_id),
	object_id int not null references Objects(object_id),
	detail varchar(255)
);


