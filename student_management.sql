create database studentmanegementDB;
use studentmanegementDB ;

create table students(
student_id int primary key auto_increment,
student_name varchar(50),
student_gender enum('M','F'),
student_contact varchar (30),
student_email varchar (50)
);

create table sujects(
subject_id int primary key auto_increment,
subject_name varchar(50)
);

create table marks (
mark_id int primary key auto_increment,
student_id int,
subject_id int , 
marks int,
	foreign key (student_id) references students(student_id),
    foreign key (subject_id) references sujects(subject_id)
);
DELIMITER $$
create procedure addstudent(
student_name varchar(50),
student_gender enum('M','F'),
student_contact varchar (50),
student_email varchar (50)
)
begin
	insert into students(student_name,student_gender,student_contact,student_email)
    values 
    (student_name,student_gender,student_contact,student_email);

end $$
DELIMITER ;

CALL addstudent('sanawar','M','+919322688863','sanawaraheman893@gmail.com');


select* from students;

insert into sujects (subject_name)
values
("ENG"),("Math"),("Urdu");


insert into marks (student_id,subject_id,marks)
values
(1,1,70),(1,3,60),(1,4,100);


insert into marks (student_id,subject_id,marks)
values
(2,1,100),(2,3,100),(2,4,100);

select m.mark_id,m.marks,s.subject_name,st.student_name from marks m
join sujects s  

on m.subject_id = s.subject_id

join students st 
on m.student_id = st.student_id
order by mark_id desc;


select 
s.student_id,
s.student_name,
sum(m.marks) as sum ,avg(m.marks) as avgvalue ,COUNT(*) AS total_students
from students s join marks m on s.student_id = m.student_id
group by s.student_id,s.student_name
order by sum desc
limit 1;
