create table tabla1 (id serial ,num integer,name varchar(50));
create table tabla2 (id serial ,numtotal integer,name varchar(50));

insert into tabla1 (num,name) values (12,'chuy');
insert into tabla1 (num,name) values (12,'abril');
insert into tabla1 (num,name) values (12,'pepe');
insert into  tabla1 (num,name) values (12,'ana');
insert into  tabla1 (num,name) values (100,'alan');



insert into tabla2 (numtotal,name) values (0,'chuy');
insert into tabla2 (numtotal,name) values (0,'abril');
insert into tabla2 (numtotal,name) values (0,'pepe');
insert into  tabla2 (numtotal,name) values (0,'ana');


select* from tabla2;
select* from tabla1;

---drop function sumart(valorentrante integer);

CREATE OR REPLACE FUNCTION sumart(valorentrante integer)
returns integer
as $$
DECLARE
zz bigint;
BEGIN
 zz:= (select sum(num) as valor from tabla1);
 UPDATE tabla2 as a SET numtotal = zz
FROM tabla2 
WHERE a.id = valorentrante; 
return zz; 
 END
$$

  LANGUAGE plpgsql VOLATILE;



SELECT sumart(3)