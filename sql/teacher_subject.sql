DROP TABLE teacher_subject;

--joining the teacher to each subject using foreign keys
create table teacher_subject (
	teacher_id int not null,
	subject_id int not null,
	foreign key (teacher_id) references teacher(id),
	foreign key (subject_id) references subject(id)
);

insert into teacher_subject (teacher_id, subject_id) values (1, 2);
insert into teacher_subject (teacher_id, subject_id) values (1, 4);
insert into teacher_subject (teacher_id, subject_id) values (2, 1);
insert into teacher_subject (teacher_id, subject_id) values (3, 2);
insert into teacher_subject (teacher_id, subject_id) values (4, 5);
insert into teacher_subject (teacher_id, subject_id) values (5, 6);
insert into teacher_subject (teacher_id, subject_id) values (5, 4);
insert into teacher_subject (teacher_id, subject_id) values (4, 3);
insert into teacher_subject (teacher_id, subject_id) values (4, 1);
insert into teacher_subject (teacher_id, subject_id) values (2, 3);
insert into teacher_subject (teacher_id, subject_id) values (3, 1);


--joining table teacher to the subject one to see which teacher is teaching which subject
select * from teacher
	join teacher_subject on teacher.id = teacher_subject.teacher_id
	join subject on teacher_subject.subject_id = subject.id;

--	finding all the teachers that are teaching mathematics
select
	teacher.*
from teacher
 	join teacher_subject on teacher.id = teacher_subject.teacher_id
	join subject on teacher_subject.subject_id = subject.id
where
	subject.name = 'Geography';

--	finding all the teachers that teaches more tn 3 subjects
select
   teacher.first_name, teacher.last_name, teacher.email, count(*)
from teacher
	join teacher_subject on teacher.id = teacher_subject.teacher_id
	join subject on teacher_subject.subject_id = subject.id
group by
   teacher.first_name, teacher.last_name, teacher.email
having count(*) >= 3;