# Apply_selectbox

```sql
create table SPORTS_CENTER2(id int, name varchar(100), nsi_do varchar(100), nsi_gun_gu varchar(100), facility varchar(100));

create view noFacility as
select * from sports_center2
where facility = '없음';

create or replace function test() returns trigger as $$
begin
	delete from sports_center2
	where facility ='없음';
	return New;
end;
$$
language 'plpgsql';

create trigger R1
instead of delete on noFacility
for each row
execute procedure test();

delete from noFacility where facility = '없음';

select * from noFacility;
```
