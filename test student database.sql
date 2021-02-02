use `ervin's portfolio`

CREATE TABLE Campus_id int(9) not null AUTO_INCREMENT,
    Campus_name varchar(30) not null, 
    Campus_address varchar(30) not null,
    Campus_country varchar(30) not null,
    primary key (Campus_id)
    );

CREATE TABLE Program_Director (
    Director_id int(9) not null AUTO_INCREMENT,
    Director_name varchar(30) not null,
    Director_contact int not null,
    Campus_id int(9) not null UNIQUE AUTO_INCREMENT,
    primary key (Director_id),
    foreign key (Campus_id)
    references Campus (Campus_id)
    );

CREATE TABLE Student_Enrolment_Officer (
    Officer_id int(9) not null AUTO_INCREMENT,
    Officer_name varchar(30) not null,
    Officer_contact int not null,
    Campus_id int(9) not null UNIQUE AUTO_INCREMENT,
    primary key (Officer_id),
    foreign key (Campus_id)
    references Campus (Campus_id)
    );

CREATE TABLE Course (
    Course_id int(9) not null AUTO_INCREMENT,
    Course_name varchar(60) not null,
    Course_building varchar(30) not null,
    Director_id int(9) not null UNIQUE AUTO_INCREMENT,
    primary key (Course_id),
    foreign key (Director_id)
    references Program_Director (Director_id)
    );

CREATE TABLE Subject (
    Subject_id int(9) not null AUTO_INCREMENT,
    Subject_name varchar(60) not null,
    Subject_cost int not null,
    Course_id int(9) not null UNIQUE AUTO_INCREMENT,
    primary key (Subject_id),
    foreign key (Course_id)
    references Course (Course_id)
    );

CREATE TABLE Class (
    Class_id int(9) not null AUTO_INCREMENT,
    Class_room varchar(30) not null,
    Campus_id int(9) not null UNIQUE AUTO_INCREMENT,
    Subject_id int(9) not null UNIQUE AUTO_INCREMENT,
    primary key (Class_id),
    foreign key (Campus_id)
    references Campus (Campus_id),
    foreign key (Subject_id)
    references Subject (Subject_id)
    );

CREATE TABLE Student (
    Student_id int(9) not null AUTO_INCREMENT,
    Student_name varchar(30) not null,
    Student_contact int not null,
    Student_email varchar(60) not null,
    Student_address varchar(100) not null,
    Officer_id int(9) not null UNIQUE AUTO_INCREMENT,
    Class_id int(9) not null UNIQUE AUTO_INCREMENT,
    primary key (Student_id),
    foreign key (Officer_id)
    references Student_Enrolment_Officer (Officer_id),
    foreign key (Class_id)
    references Class (Class_id)
    );

CREATE TABLE Password (
    Password_id int(9) not null AUTO_INCREMENT,
    Password varchar(9) not null,
    Student_id int(9) not null AUTO_INCREMENT,
    primary key(Password_id),
    foreign key (Student_id)
    references Student (Student_id)
    );

CREATE TABLE Course_Subject_Student (
    Student_id int(9) not null AUTO_INCREMENT,
    Course_id int(9) not null AUTO_INCREMENT,
    Subject_id int(9) not null AUTO_INCREMENT,
    foreign key (Student_id)
    references Student (Student_id),
    foreign key (Course_id)
    references Course (Course_id),
    foreign key (Subject_id)
    references Subject (Subject_id)
    );
    
    insert into `Campus` values(13,'Adelaide Campus','Wakefield st. Adelaide','Australia');
    insert into `Campus` values(14,'Sydney Campus','Mountain st. Sydney','Australia');
    
    insert into `Program Director` values('00919A','Ervin Gonzales','0449112424','14');
    insert into `Program Director` values('00918B','Md Rakibul Islam','0449272424','14');
    insert into `Program Director` values('00917C','Gurpreet Singh Aulakh','0449116824','13');
    
    insert into `Student Enrolment Officer` values('03419A','Meg Hernandez','0415628916','14');
    insert into `Student Enrolment Officer` values('03428B','Mia Deborja','0418358916','14');
    insert into `Student Enrolment Officer` values('03425C','Yasmin Geronimo','0413628266','14');
    insert into `Student Enrolment Officer` values('03415D','Toni Sarcida','0411428916','13');
    insert into `Student Enrolment Officer` values('03415E','Noelle Espiritu','0415148916','13');
    
    insert into `Course` values('MIS',"Master's of Information Systems",'Wakefield Building','00919A');
    insert into `Course` values('MPA',"Master's of Professional Accousys_confignting",'Wakefield Building','00918B');
    insert into `Course` values('GPM','Global Project Management','Ultimo Building','00917C');
    insert into `Course` values('BSM',"Bachelor's Sports Management",'Ultimo Building','00917C');
    
    insert into `Subject` values('MIS605','Systems Analysis and Design','3200','MIS');
    insert into `Subject` values('MIS607','Cybersecurity','3200','MIS');
    insert into `Subject` values('FIS501','Foundation of Information Systems','3200','MIS');
    insert into `Subject` values('MIS602','Database Modelling and Design','3200','MIS');
    insert into `Subject` values('MPA607','Taxation and Income Accounting','3200','MPA');
    insert into `Subject` values('MPA605','Corporate Accounting','3200','MPA');
    insert into `Subject` values('MPA603','Sole Proprietorship and Partnerships','3200','MPA');
    insert into `Subject` values('GPM204','Project Execution and Control','3200','GPM');
    insert into `Subject` values('GPM103','Project Communication Planning','3200','GPM');
    insert into `Subject` values('BSM403','Coaching and Training','3200','BSM');
    insert into `Subject` values('BSM405','Team Building and Management','3200','BSM');
    
    insert into `Class` values('01','G1','14','MIS605');
    insert into `Class` values('11','G2','13','GPM103');
    insert into `Class` values('13','G3','13','GPM204');
    insert into `Class` values('54','M7','14','MIS607');
    insert into `Class` values('32','M8','13','GPM204');
    insert into `Class` values('56','M9','14','MPA605');
    insert into `Class` values('61','M10','14','MPA607');
    insert into `Class` values('71','M11','14','MPA603');
    insert into `Class` values('41','M12','14','MPA603');
    insert into `Class` values('75','M13','14','FIS501');
    insert into `Class` values('74','M14','14','MIS602');
    insert into `Class` values('38','M15','13','BSM403');
    insert into `Class` values('78','M16','13','BSM405');
    insert into `Class` values('99','A1','13','GPM103');
    insert into `Class` values('07','A2','13','BSM405');
    insert into `Class` values('34','A3','13','GPM204');
    insert into `Class` values('08','A4','13','BSM403');
    insert into `Class` values('76','A5','14','FIS501');
    insert into `Class` values('09','A6','14','MIS605');
    insert into `Class` values('23','A7','14','MIS607');
    
    insert into `Student` values('00288838T','Dias Yasmin','0449128919','dias.yasmin@gmail.com','03419A','01');
    insert into `Student` values('00273712T','Nicole Flores','0412465091','nicoleflores@hotmail.com','03428B','11');
    insert into `Student` values('00114209T','Annie Espiritu','0489451623','annie_espiritu@yahoo.com','03425C','13');
    insert into `Student` values('00346209T','Jacob Torres','0489413512','JacobTorres@gmail.com','03415D','54');
    insert into `Student` values('00156209T','Andrew Munar','0489451262','andrew.munar@gmail.com','03415E','32');
    insert into `Student` values('00114669T','Wilfrid Sanluis','0489153162','wilfrid.sanluis@hotmail.com','03419A','56');
    insert into `Student` values('00134209T','Matthew Bitalac','0489575623','matthew_bitalac@yahoo.com','03428B','61');
    insert into `Student` values('00514209T','John Sanluis','0489451315','john.sanluis@gmail.com','03425C','71');
    insert into `Student` values('00116109T','Stephanie Infante','0414151153','stephanie_infante@gmail.com','03415D','41');
    insert into `Student` values('00113509T','Triston Adamson','0488698031','Triston_adam@yahoo.com','03415E','75');
    insert into `Student` values('00118609T','Moen Roldan','0486236723','Rolda.moen@gmail.com','03419A','74');
    insert into `Student` values('00197509T','Christian Quintero','0481415703','QuinteroCC@hotmail.com','03428B','38');
    insert into `Student` values('00336219T','Tenebris Martel','0489252625','DarknessMartel@gmail.com','03425C','78');
    insert into `Student` values('00163463T','Aldwyn Gonzales','0425891957','aldwyn.jan.gonzales@yahoo.com','03415D','99');
    insert into `Student` values('00254209T','Alyssa Asumpsion','0413589185','AlyA@hotmail.com','03415E','07');
    
use `ervin's portfolio`;
SELECT `Officer_name`
FROM `student`
join `student enrolment officer`
	on student.Officer_id = `student enrolment officer`.Officer_id
group by Officer_contact;
    
SELECT * FROM `ervin's portfolio`.student;
 
use `ervin's portfolio`;
SELECT `Student_name`
FROM `student`;

use `ervin's portfolio`;
SELECT `Student_name`,`Student_email`
FROM `student`;

UPDATE `ervin's portfolio`.student 
SET `student_contact` = '411531153' 
WHERE (`Student_id` = '00336219T');
