# Apply_selectbox

```sql
create table SPORTS_CENTER(id int, name varchar(100), nsi_do varchar(100), nsi_gun_gu varchar(100), facility varchar(100));

create view noFacility4 as select * from sports_center;
delete from noFacility4 where facility = '없음';
select * from noFacility

```
## lecture selectbox 튜플 수정

```sql
DELETE FROM learning_program WHERE nsi_gun_gu = '전국';
```
```sql
DELETE FROM learning_program WHERE nsi_gun_gu = '병설유치원(원통초.기린초.귀둔초.방동초)';
```
```sql
DELETE FROM learning_program WHERE nsi_gun_gu = '해당 어린이집';
```
