create database  QUANLYDIEMTHI;
use  QUANLYDIEMTHI;

create table student(
	studentId varchar(4) primary key not null,
    studentName varchar(100) not null,
    birthday date not null,
    gender bit(1) not null, 
    address text not null,
    phoneNumber varchar(45)
); 

create table subject(
	subjectId varchar(4) primary key not null,
    subjectName varchar(45),
    priority int not null
);

create table mark (
	subjectId varchar(4),
    foreign key (subjectId) references subject(subjectId),
    studentId varchar(4),
    foreign key (studentId) references student(studentId),
    point double not null,
    primary key (subjectId,studentId)
);

INSERT INTO student (studentId, studentName, birthday, gender, address, phoneNumber) VALUES
('S001', 'Nguyễn Thế Anh', '1999-01-11', 1, 'Hà Nội', '984678082'),
('S002', 'Đặng Bảo Trâm', '1998-12-22', 0, 'Lào Cai', '904982654'),
('S003', 'Trần Hà Phương', '2000-05-05', 0, 'Nghệ An', '947645363'),
('S004', 'Đỗ Tiến Mạnh', '1999-03-26', 1, 'Hà Nội', '983665353'),
('S005', 'Phạm Duy Nhất', '1998-10-04', 1, 'Tuyên Quang', '987242678'),
('S006', 'Mai Văn Thái', '2002-06-22', 1, 'Nam Định', '982654268'),
('S007', 'Giang Gia Hân', '1996-11-10', 0, 'Phú Thọ', '982364753'),
('S008', 'Nguyễn Ngọc Bảo My', '1999-01-22', 0, 'Hà Nam', '927867453'),
('S009', 'Nguyễn Tiến Đạt', '1998-08-07', 1, 'Tuyên Quang', '989274678'),
('S010', 'Nguyễn Thiều Quang', '2000-09-18', 1, 'Hà Nội', '984378291');

INSERT INTO subject (subjectId, subjectName, priority) VALUES
('MH01', 'Toán', 2),
('MH02', 'Vật Lý', 2),
('MH03', 'Hoá Học', 1),
('MH04', 'Ngữ Văn', 1),
('MH05', 'Tiếng Anh', 2);

INSERT INTO mark (subjectId, studentId, point) VALUES
-- Marks for Nguyễn Thế Anh (S001)
('MH01', 'S001', 8.5),
('MH02', 'S001', 7),
('MH03', 'S001', 9),
('MH04', 'S001', 9),
('MH05', 'S001', 5),

-- Marks for Đặng Bảo Trâm (S002)
('MH01', 'S002', 9),
('MH02', 'S002', 8),
('MH03', 'S002', 6.5),
('MH04', 'S002', 8),
('MH05', 'S002', 6),

-- Marks for Trần Hà Phương (S003)
('MH01', 'S003', 7.5),
('MH02', 'S003', 8),
('MH03', 'S003', 8),
('MH04', 'S003', 7),
('MH05', 'S003', 7.5),

-- Marks for Đỗ Tiến Mạnh (S004)
('MH01', 'S004', 6),
('MH02', 'S004', 7),
('MH03', 'S004', 6.5),
('MH04', 'S004', 6.5),
('MH05', 'S004', 8),

-- Marks for Phạm Duy Nhất (S005)
('MH01', 'S005', 5.5),
('MH02', 'S005', 6),
('MH03', 'S005', 8),
('MH04', 'S005', 7.5),
('MH05', 'S005', 5),

-- Marks for Mai Văn Thái (S006)
('MH01', 'S006', 8),
('MH02', 'S006', 10),
('MH03', 'S006', 9),
('MH04', 'S006', 7.5),
('MH05', 'S006', 6.5),

-- Marks for Giang Gia Hân (S007)
('MH01', 'S007', 9.5),
('MH02', 'S007', 9),
('MH03', 'S007', 8.5),
('MH04', 'S007', 9),
('MH05', 'S007', 9),

-- Marks for Nguyễn Ngọc Bảo My (S008)
('MH01', 'S008', 8),
('MH02', 'S008', 8),
('MH03', 'S008', 8.5),
('MH04', 'S008', 9.5),
('MH05', 'S008', 9.5),

-- Marks for Nguyễn Tiến Đạt (S009)
('MH01', 'S009', 7.5),
('MH02', 'S009', 9),
('MH03', 'S009', 6),
('MH04', 'S009', 8),
('MH05', 'S009', 10),

-- Marks for Nguyễn Thiều Quang (S010)
('MH01', 'S010', 6.5),
('MH02', 'S010', 8),
('MH03', 'S010', 5.5),
('MH04', 'S010', 4),
('MH05', 'S010', 7);

-- Sửa tên sinh viên có mã `S004` thành “Đỗ Đức Mạnh”.  
update student set studentName = 'Đỗ Đức Mạnh' where studentId='S004';
-- Sửa tên và hệ số môn học có mã `MH05` thành “Ngoại Ngữ” và hệ số là 1.  
update subject set subjectName = 'Ngoại Ngữ' , priority = 1 where subjectId ='MH05';
-- Cập nhật lại điểm của học sinh có mã `S009`  thành (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6, MH05 : 9).  
update mark set point= 8.5 where studentId = 'S009' and subjectId='MH01';
update mark set point= 7   where studentId = 'S009' and subjectId='MH02';
update mark set point= 5.5 where studentId = 'S009' and subjectId='MH03';
update mark set point= 6   where studentId = 'S009' and subjectId='MH04';
update mark set point= 9   where studentId = 'S009' and subjectId='MH05';

--  Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm điểm thi ở bảng MARK và thông tin học sinh  này ở bảng STUDENT.  
delete from mark where studentId = 'S010'; 
select student.studentName ,student.studentid ,mark.point from student
join mark on mark.studentId=student.studentid;


-- 1. Lấy ra tất cả thông tin của sinh viên trong bảng Student .  
select student.* from student;
-- 2. Hiển thị tên và mã môn học của những môn có hệ số bằng 1. 
select subject.subjectId,subject.subjectname from subject
where subject.priority = 1;

-- 3. Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, 
-- tuổi (bằng năm hiện tại trừ năm sinh) ,
-- giới tính (hiển thị nam hoặc nữ) và 
-- quê quán của tất cả học sinh.  
select  student.studentId,
		student.studentName,
        year(CURDATE()) - YEAR(student.birthday) as age,
        case when gender = 1 then 'nam' else 'nữ' end as gender,
        student.address
        from student ;
        
-- 4. Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn 
-- Toán và sắp xếp theo điểm giảm dần. 

select  student.studentName, 
		subject.subjectName, 
        mark.point 
from student
join mark on mark.studentID = student.studentId
join subject on subject.subjectId= mark.subjectId
where subject.subjectName = 'Toán'
order by mark.point desc;

-- 5. Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng). 
select case when student.gender=1 then 'nam' else 'nữ' end as 'giới tính' , count(student.gender) as 'số lượng' from student
group by student.gender;

select student.gender as 'giới tính' , count(student.gender) as 'số lượng' from student
group by student.gender;

-- 6. Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh 
-- (yêu cầu sử dụng hàm để tính toán) , 
-- bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình.
select  student.studentId,
		student.studentName,
        SUM(mark.point) as 'tổng điểm',
        AVG(mark.point) as 'điểm trung bình'
from student
join mark on mark.studentId = student.studentId
group by student.studentId;


-- Bài 4:  Tạo View, Index, Procedure :  

-- 1. Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học sinh, giới tính , quê quán . 
create view STUDENT_VIEW as
select  student.studentId as 'mã học sinh', 
		student.studentName as'tên học sinh', 
		case when student.gender= 1 then 'nam' else 'nữ' end  as 'giới tính' , 
		student.address as 'quê quán' 
from student;
select * from STUDENT_VIEW;

-- 2. Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh, điểm trung bình các môn học .
create view AVERAGE_MARK_VIEW as
select student.studentId as 'mã học sinh',
		student.studentName as'tên học sinh', 
        AVG(mark.point) as'điểm trung bình các môn'
from student
join mark on mark.studentID= student.studentID
join subject on mark.subjectId = subject.subjectId
group by student.studentId;

select * from AVERAGE_MARK_VIEW;


-- 3. Đánh Index cho trường `phoneNumber` của bảng STUDENT.   
create index  indexPhoneNumber on student(phoneNumber);

-- 4. Tạo các PROCEDURE sau: 
-- Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả thông tin học sinh đó.
delimiter // 
create procedure PROC_INSERTSTUDENT (
    IN p_studentId VARCHAR(4),
    IN p_studentName VARCHAR(100),
    IN p_birthday DATE,
    IN p_gender BIT(1),
    IN p_address TEXT,
    IN p_phoneNumber VARCHAR(45)
)
begin
	INSERT INTO student (studentId, studentName, birthday, gender, address, phoneNumber)
    VALUES (p_studentId, p_studentName, p_birthday, p_gender, p_address, p_phoneNumber);
end
// delimiter ;

call PROC_INSERTSTUDENT ('S111', 'Nguyen Thi Anh', '1998-01-01', 0, 'Ha Nam', '0987654321');
select * from student;
-- Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học. 
delimiter //
create procedure PROC_UPDATESUBJECT ( in s_subjectID varchar(4), in s_subjectName varchar(45))
begin
	UPDATE subject 
    set subjectName = s_subjectName
    where subjectId = s_subjectID;
end
// delimiter ;
call PROC_UPDATESUBJECT('MH02','vật lý nâng cao');
select*from subject;

-- Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã học sinh. 
delimiter //
create procedure PROC_DELETEMARK (in s_studentID varchar(4))
	begin
		delete from mark
        where studentId = s_studentID;
	end
// delimiter ;
CALL PROC_DELETEMARK('S001');
select * from mark;



