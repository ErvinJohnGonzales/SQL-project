CREATE SCHEMA `ervin's portfolio`;
use `ervin's portfolio`;

CREATE Table Campus (
	Campus_id int(9) not null AUTO_INCREMENT,
    Campus_name varchar(30) not null, 
    Campus_address varchar(30) not null,
    Campus_country varchar(30) not null,
    primary key (Campus_id)
    );

CREATE TABLE Program_Director (
    Director_id int(9) not null UNIQUE AUTO_INCREMENT,
    Director_name varchar(30) not null,
    Director_contact int not null,
    Campus_id int(9) not null,
    primary key (Director_id),
    foreign key (Campus_id)
    references Campus (Campus_id)
    );

CREATE TABLE Student_Enrolment_Officer (
    Officer_id int(9) not null UNIQUE AUTO_INCREMENT,
    Officer_name varchar(30) not null,
    Officer_contact int not null,
    Campus_id int(9) not null,
    primary key (Officer_id),
    foreign key (Campus_id)
    references Campus (Campus_id)
    );

CREATE TABLE Course (
    Course_id int(9) not null UNIQUE AUTO_INCREMENT,
    Course_name varchar(60) not null,
    Course_building varchar(30) not null,
    Director_id int(9) not null,
    primary key (Course_id),
    foreign key (Director_id)
    references Program_Director (Director_id)
    );

CREATE TABLE `Subject` (
    Subject_id int(9) not null UNIQUE AUTO_INCREMENT,
    Subject_name varchar(60) not null,
    Subject_cost int not null,
    Course_id int(9) not null,
    primary key (Subject_id),
    foreign key (Course_id)
    references Course (Course_id)
    );

CREATE TABLE Class (
    Class_id int(9) not null UNIQUE AUTO_INCREMENT,
    Class_room varchar(30) not null,
    Campus_id int(9) not null,
    Subject_id int(9) not null,
    primary key (Class_id),
    foreign key (Campus_id)
    references Campus (Campus_id),
    foreign key (Subject_id)
    references Subject (Subject_id)
    );

CREATE TABLE Student (
    Student_id int(10) not null UNIQUE AUTO_INCREMENT,
    Student_name varchar(100) not null,
    Student_contact int not null,
    Student_email varchar(60) not null,
    Officer_id int(9) not null,
    Class_id int(9) not null,
    primary key (Student_id),
    foreign key (Officer_id)
    references Student_Enrolment_Officer (Officer_id),
    foreign key (Class_id)
    references Class (Class_id)
    );

CREATE TABLE `Password` (
    Password_id int(9) not null UNIQUE AUTO_INCREMENT,
    Password_pass varchar(9) not null,
    Student_id int(9) not null,
    primary key(Password_id),
    foreign key (Student_id)
    references Student (Student_id)
    );

CREATE TABLE Course_Subject_Student (
    Student_id int(9) not null,
    Course_id int(9) not null,
    Subject_id int(9) not null,
    foreign key (Student_id)
    references Student (Student_id),
    foreign key (Course_id)
    references Course (Course_id),
    foreign key (Subject_id)
    references Subject (Subject_id)
    );
    
    insert into `Campus` values(13,'Adelaide Campus','Wakefield st. Adelaide','Australia');
    insert into `Campus` values(14,'Sydney Campus','Mountain st. Sydney','Australia');
    
    insert into `Program_Director` values('009191','Ervin Gonzales','0449112424','14');
    insert into `Program_Director` values('009182','Md Rakibul Islam','0449272424','14');
    insert into `Program_Director` values('009173','Gurpreet Singh Aulakh','0449116824','13');
    
    insert into `Student_Enrolment_Officer` values('034191','Meg Hernandez','0415628916','14');
    insert into `Student_Enrolment_Officer` values('034282','Mia Deborja','0418358916','14');
    insert into `Student_Enrolment_Officer` values('034253','Yasmin Geronimo','0413628266','14');
    insert into `Student_Enrolment_Officer` values('034154','Toni Sarcida','0411428916','13');
    insert into `Student_Enrolment_Officer` values('034155','Noelle Espiritu','0415148916','13');
    
    insert into `Course` values('123',"Master's of Information Systems",'Wakefield Building','009191');
    insert into `Course` values('124',"Master's of Professional Accousys_confignting",'Wakefield Building','009182');
    insert into `Course` values('125','Global Project Management','Ultimo Building','009173');
    insert into `Course` values('126',"Bachelor's Sports Management",'Ultimo Building','009173');
    
    insert into `Subject` values('605','Systems Analysis and Design','3200','123');
    insert into `Subject` values('607','Cybersecurity','3200','123');
    insert into `Subject` values('501','Foundation of Information Systems','3200','123');
    insert into `Subject` values('602','Database Modelling and Design','3200','123');
    insert into `Subject` values('604','Taxation and Income Accounting','3200','124');
    insert into `Subject` values('600','Corporate Accounting','3200','124');
    insert into `Subject` values('603','Sole Proprietorship and Partnerships','3200','124');
    insert into `Subject` values('204','Project Execution and Control','3200','125');
    insert into `Subject` values('103','Project Communication Planning','3200','125');
    insert into `Subject` values('403','Coaching and Training','3200','126');
    insert into `Subject` values('405','Team Building and Management','3200','126');
    
    insert into `Class` values('01','G1','14','605');
    insert into `Class` values('11','G2','13','103');
    insert into `Class` values('13','G3','13','204');
    insert into `Class` values('54','M7','14','607');
    insert into `Class` values('32','M8','13','204');
    insert into `Class` values('56','M9','14','605');
    insert into `Class` values('61','M10','14','607');
    insert into `Class` values('71','M11','14','603');
    insert into `Class` values('41','M12','14','603');
    insert into `Class` values('75','M13','14','501');
    insert into `Class` values('74','M14','14','602');
    insert into `Class` values('38','M15','13','403');
    insert into `Class` values('78','M16','13','405');
    insert into `Class` values('99','A1','13','103');
    insert into `Class` values('07','A2','13','405');
    insert into `Class` values('34','A3','13','204');
    insert into `Class` values('08','A4','13','403');
    insert into `Class` values('76','A5','14','501');
    insert into `Class` values('09','A6','14','605');
    insert into `Class` values('23','A7','14','607');
    
    insert into `Student` values('0288838','Dias Yasmin','0449128919','dias.yasmin@gmail.com','034191','01');
    insert into `Student` values('0273712','Nicole Flores','0412465091','nicoleflores@hotmail.com','034282','11');
    insert into `Student` values('0114209','Annie Espiritu','0489451623','annie_espiritu@yahoo.com','034253','13');
    insert into `Student` values('0346209','Jacob Torres','0489413512','JacobTorres@gmail.com','034154','54');
    insert into `Student` values('0156209','Andrew Munar','0489451262','andrew.munar@gmail.com','034155','32');
    insert into `Student` values('0114669','Wilfrid Sanluis','0489153162','wilfrid.sanluis@hotmail.com','034191','56');
    insert into `Student` values('0134209','Matthew Bitalac','0489575623','matthew_bitalac@yahoo.com','034282','61');
    insert into `Student` values('0514209','John Sanluis','0489451315','john.sanluis@gmail.com','034253','71');
    insert into `Student` values('0116109','Stephanie Infante','0414151153','stephanie_infante@gmail.com','034154','41');
    insert into `Student` values('0113509','Triston Adamson','0488698031','Triston_adam@yahoo.com','034155','75');
    insert into `Student` values('0118609','Moen Roldan','0486236723','Rolda.moen@gmail.com','034191','74');
    insert into `Student` values('0197509','Christian Quintero','0481415703','QuinteroCC@hotmail.com','034282','38');
    insert into `Student` values('0336219','Tenebris Martel','0489252625','DarknessMartel@gmail.com','034253','78');
    insert into `Student` values('0163463','Aldwyn Gonzales','0425891957','aldwyn.jan.gonzales@yahoo.com','034154','99');
    insert into `Student` values('0254209','Alyssa Asumpsion','0413589185','AlyA@hotmail.com','034155','07');
    
use `ervin's portfolio`;
SELECT `Officer_name`
FROM `Student`
join `Student_Enrolment_Officer`
	on Student.Officer_id = Student_Enrolment_Officer.Officer_id
group by Officer_contact;
    
SELECT * FROM `ervin's portfolio`.student;
 
use `ervin's portfolio`;
SELECT `Student_name`
FROM `Student`;

use `ervin's portfolio`;
SELECT `Student_name`,`Student_email`
FROM `Student`;

UPDATE `ervin's portfolio`.student 
SET `Student_contact` = '411531153' 
WHERE (`Student_id` = '00336219');
