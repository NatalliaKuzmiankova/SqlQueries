select s.fname, s.Lname, s.patronus from hogwarts.characters s where s.patronus <> 'Unknown' and s.patronus is not null;
select s.Lname from hogwarts.characters s where s.Lname like '%e';
select sum(age) from hogwarts.characters;
select s.fname, s.Lname, s.age from hogwarts.characters s order by age desc;
select s.fname, s.age from hogwarts.characters s where s.age between 50 and 100;
select distinct s.age from hogwarts.characters s;
select * from hogwarts.characters s where s.faculty = 'gryffindor' and s.age > 30;
select distinct s.faculty from hogwarts.characters s limit 3;
select s.fname from hogwarts.characters s where s.fname like 'H____' or s.fname like 'L%';
select avg(age) from hogwarts.characters;
delete from hogwarts.characters s where s. char_id = 11;
select s.Lname from hogwarts.characters s where s.Lname like '%a%';
select s.fname as Half_Blood_Prince from hogwarts.characters s where s. char_id = 10;
select s. char_id, s.patronus from hogwarts.characters s where s. char_id and s.patronus <> 'Unknown' and s. char_id is not null and s.patronus is not null order by s.patronus;
select fname, lname from hogwarts.characters where lname in ('Crabbe', 'Granger', 'Diggory');
select min(age) from hogwarts.characters;
select fname as fname_and_bookname from hogwarts.characters
union
select book_name as fname_and_bookname from hogwarts.library;

select count(char_id) as count_of_characters, faculty
from hogwarts.characters
group by faculty
having count(char_id) > 1;

select fname, lname,
case
	when faculty = 'Gryffindor' then 'Godric'
	when faculty = 'Slytherin' then 'Salazar'
    when faculty = 'Ravenclaw' then 'Rowena'
    when faculty = 'Hufflepuff' then 'Helga'
    else 'Muggle'
end as Founders
from hogwarts.characters;

select lname
from hogwarts.characters
where lname
not regexp '^[LHS]';

select fname, lname, book_name
from hogwarts.characters c
inner join hogwarts.library l
on c.book_id = l.book_id;

select fname, lname, book_name
from hogwarts.characters c
right join hogwarts.library l
on c.book_id = l.book_id;

select book_name, patronus
from hogwarts.library l
left join hogwarts.characters c
on l.book_id = c.book_id;

select fname, lname, age, book_name
from hogwarts.characters c
inner join hogwarts.library l
on c.book_id = l.book_id
where age > 15;

/* Уточнить что значит неизвестен */
select fname, book_name, start_date, end_date
from hogwarts.characters c
inner join hogwarts.library l
on c.book_id = l.book_id
where c.age < 15 and (c.patronus = 'Unknown' or c.patronus is null);

select count(*) as count_of_books
from hogwarts.library l
where l.end_date > (select end_date
					from hogwarts.library l
                    where l.book_id = (select book_id
									   from hogwarts.characters c
									   where c.fname = 'Hermione'));

select patronus
from hogwarts.characters
where age > (select age
			 from hogwarts.characters
             where patronus = 'Unknown');
