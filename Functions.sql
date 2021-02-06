
---------------------------------------------------------------------------------------
-- Read & Write access

drop function geq
create or replace function geq(f char(3), s char(3))
returns boolean
as $$
begin 
	if f = 'TS' then 
		return 1;
	elseif f = 'S' and s <> 'TS' then
		return 1;
	elseif f = 'C' and s <> 'TS' and s <> 'S' then 
		return 1;
	elseif f = 'U' and s = 'U' then 
		return 1;
	else 
		return 0;
	end if;
end
$$ LANGUAGE plpgsql;

select * from nurses n where n.object_id in (select * from write_access(3))
update Nurses set age = 25 where age < 25 and subject_id in (select * from write_access(3))

create function write_access(id int)
returns table(object_id int)
as $$
begin
	return query
		select o.object_id from objects o
		where geq((select asl from subjects s2 where subject_id = id) , o.csl)
		and geq(o.asl, (select wsl from subjects s2 where subject_id = id))
		and (select section_id from object_category oc where oc.object_id = o.object_id) 
			in (select section_id from subject_category sc where sc.subject_id = id);
end
$$ LANGUAGE plpgsql;	

create function read_access(id int)
returns table(object_id int)
as $$
begin
	return query
		select o.object_id from objects o
		where geq(o.msl, (select asl from subjects s2 where subject_id = id))
		and geq((select rsl from subjects s2 where subject_id = id), o.asl)
		and (select section_id from object_category oc where oc.object_id = o.object_id) 
			in (select section_id from subject_category sc where sc.subject_id = id);
end
$$ LANGUAGE plpgsql;	

-------------------------------------------------------------------------------------------------
-- Report

--drop procedure add_report 
create or replace procedure add_report(subj_id integer, obj_id integer, detail varchar(255))
as $$
begin 
	insert into objects (asl, csl, msl)
	select asl, csl, msl from objects o where o.object_id  = obj_id;

	insert into object_category (object_id, section_id)
	select max(object_id), 201 from objects;		-- 201 is the report section id, change it in the cotext
	
	insert into reports (reporter_id, object_id, detail)
	select subj_id, max(object_id), detail from objects;
end
$$ LANGUAGE plpgsql;


-------------------------------------------------------------------------------------------------
-- Patient

create or replace procedure register_patient(registeration_id INT, f_name varchar(255), l_name varchar(255),
	national_id INT, age INT, sex char(10), illness VARCHAR (255), section_id INT, drugs VARCHAR (255), 
	doctor_id INT, nurse_id int, id int)
as $$
declare 
	o int;
begin 	
	insert into objects (asl, csl, msl) values ('C', 'S', 'S');
	select max(object_id) into o from objects;

	insert into object_category (object_id, section_id) values (o, section_id);

	update subjects set "role" = 'patient'
	where subject_id = id;
	insert into subject_category (subject_id, section_id) values (id, section_id);
	
	insert into patients values (registeration_id, id, o, f_name, l_name, national_id,
	"age", sex, illness, section_id, drugs, doctor_id, nurse_id);
end
$$ LANGUAGE plpgsql;

--call register_patient (123, 'name', 'lname', 129, 18, 'Male', 'nothing', 101, 'nothing', 3, 2, 'p1','passp1')











