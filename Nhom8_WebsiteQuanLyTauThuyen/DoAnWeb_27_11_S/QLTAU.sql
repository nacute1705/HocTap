create database QLTAU
go
use QLTAU
go


create table LOAINV
(
	maloai char(10) primary key,
	tenloai nvarchar(20),
	luongcoban float,
	luongngay float,
	phucap float,
)
create table TAUTHUYEN
(
	matau char(10) primary key,
	loaitau nvarchar(20),
	thuyentruong int
)

create table NHANVIEN
(
	id int identity(1,1) primary key,
	hoten nvarchar(30),
	ngaysinh date,
	diachi nvarchar(50),
	mabhxh char(12),
	maloai char(10) foreign key(maloai) REFERENCES LOAINV(maloai),
	matau char(10) foreign key(matau) REFERENCES TAUTHUYEN(matau),
	cccd char(12)
)
create table TOADOTAU
(
	matau char(10) foreign key(matau) REFERENCES TAUTHUYEN(matau),
	thoigian datetime,
	latutude char(10),
	longitude char(10),
	CONSTRAINT PK_TOADOTAU primary key(matau, thoigian)
)
create table TAIKHOAN
(
	tendangnhap varchar(20) primary key,
	matkhau varchar(20),
	id int foreign key(id) references nhanvien(id)
)

create table sanpham
(
	masp int primary key,
	tensp nvarchar(20),
	dvt char(10),
	sltong float
)


create table gia
(
	ngaycapnhat date,
	masp int FOREIGN KEY(masp) REFERENCES sanpham(masp),
	gia float
)


create table khachhang
(
	makh int identity(1,1) primary key,
	tenkh nvarchar(50),
	sdt char(11),
	masothue char(20),
	diachi nvarchar(50),
	loaikh char(10)
)


create table HOADON
(
	mahd int identity(1,1) primary key,
	makh int foreign key(makh) REFERENCES khachhang(makh),
	thanhtien float,
	ngaylap datetime,
	tinhtrang nvarchar(20)
)

create table CTHOADON
(
	mahd int foreign key(mahd) REFERENCES HOADON(mahd),
	masp int foreign key(masp) REFERENCES sanpham(masp),
	soluong float,
	gia float,
	thanhtien float,
	CONSTRAINT PK_CTHOADON primary key(mahd, masp)
)


create table HAITRINH
(
	mahaitrinh int identity(1,1) primary key,
	matau char(10) foreign key(matau) REFERENCES TAUTHUYEN(matau),
	ngaydi datetime,
	ngayve datetime,
	tongsanluong float,
	doanhthu float,
	dautieuthu float,
	giadau float
)


create table CTHAITRINH
(
	mahaitrinh int foreign key(mahaitrinh) REFERENCES HAITRINH(mahaitrinh),
	masp int foreign key(masp) REFERENCES sanpham(masp),
	soluong float,
	thanhtien float,
	CONSTRAINT PK_CTHAITRINH primary key(mahaitrinh,masp)
)


--=======================================================================================

--bang thong tin tren web

create table loaitin
(
	maloai int identity(1,1) primary key,
	tenloai nvarchar(50)
)


create table chitiettin
(
	matin int identity(1,1) primary key,
	tieude nvarchar(max), 
	noidung nvarchar(max),
	ngaydang date,
	maloai int foreign key references loaitin(maloai),
	anh nvarchar(50),
	link nvarchar(max)
)


--values
--ct hai trinh
INSERT INTO CTHAITRINH
VALUES
(1,2,100,NULL),
(2,5,1500,NULL),
(3,6,120,NULL),
(4,2,95,NULL),
(5,8,150,NULL),
(6,9,250,NULL),
(7,10,95,NULL),
(8,12,90,NULL),
(9,21,50,NULL),
(10,22,90,NULL),
(11,20,100,NULL),
(12,18,90,NULL),
(13,17,95,NULL),
(14,16,70,NULL),
(15,15,130,NULL)
create table BANGLUONG
(
	manv int foreign key(manv) REFERENCES NHANVIEN(id),
	ngaynhan date,
	songaylam int,
	thuong float,
	tongluong float,
	tinhtrang nvarchar(20),
	CONSTRAINT PK_BANGLUONG primary key(manv, ngaynhan)
)

alter table TAUTHUYEN
add constraint FK_TT_NV foreign key(thuyentruong) references nhanvien(id)
------------nhap du lieu--------------------
--loai NV
INSERT INTO LOAINV
VALUES
(N'TT',N'Thuyền trưởng',NULL,NULL,NULL),
(N'TV',N'Thuyền viên',NULL,NULL,NULL),
(N'QL',N'Quản lí',NULL,NULL,NULL),
(N'NVVP',N'Nhân viên văn phòng',NULL,NULL,NULL)
--Tau thuyen
INSERT INTO TAUTHUYEN
VALUES
('ND001',N'Thuyền xa bờ',NULL),
('ND002',N'Thuyền gần bờ',NULL),
('ND003',N'Thuyền xa bờ',NULL),
('ND004',N'Thuyền gần bờ',NULL),
('ND005',N'Thuyền gần bờ',NULL),
('ND006',N'Thuyền xa bờ',NULL),
('ND007',N'Thuyền gần bờ',NULL),
('ND008',N'Thuyền xa bờ',NULL),
('ND009',N'Thuyền gần bờ',NULL),
('ND010',N'Thuyền gần bờ',NULL),
('ND011',N'Thuyền xa bờ',NULL),
('ND012',N'Thuyền gần bờ',NULL),
('ND013',N'Thuyền xa bờ',NULL),
('ND014',N'Thuyền xa bờ',NULL),
('ND015',N'Thuyền xa bờ',NULL)
--tai khoan
INSERT INTO TAIKHOAN
VALUES
('QUANLY','123',NULL),
('THUYENTRUONG','123',NULL),
('NVVP','123',NULL)
insert into taikhoan values('THUYENVIEN','123',2)
--san pham
INSERT INTO sanpham
VALUES
('001',N'Tôm tít','kg',0),
('002',N'Tôm càng xanh','kg',0),
('003',N'Tôm sú','kg',0),
('004',N'Tôm thẻ','kg',0),
('005',N'Cá ngừ','kg',0),
('006',N'Cá hồi','kg',0),
('007',N'Cá chim','kg',0),
('008',N'Cá thu','kg',0),
('009',N'Cá bạc má','kg',0),
('010',N'Cá saba','kg',0),
('011',N'Cá cam','kg',0),
('012',N'Cá nục','kg',0),
('013',N'Cá đuối','kg',0),
('014',N'Mực lá','kg',0),
('015',N'Mực nang','kg',0),
('016',N'Mực trứng','kg',0),
('017',N'Ốc hương','kg',0),
('018',N'Ốc cà na','kg',0),
('019',N'Ốc móng tay','kg',0),
('020',N'Ốc len','kg',0),
('021',N'Ốc mỡ','kg',0),
('022',N'Cua thịt','kg',0),
('023',N'Cua gạch','kg',0),
('024',N'Cua xanh','kg',0)
--gia
INSERT INTO gia
values
('01/11/2021',001,850000),
('01/11/2021',002,780000),
('01/11/2021',003,220000),
('01/11/2021',004,85000),
('01/11/2021',005,400000),
('01/11/2021',006,190000),
('01/11/2021',007,240000),
('01/11/2021',008,300000),
('01/11/2021',009,230000),
('01/11/2021',010,170000),
('01/11/2021',011,360000),
('01/11/2021',012,350000),
('01/11/2021',013,250000),
('01/11/2021',014,150000),
('01/11/2021',015,200000),
('01/11/2021',016,180000),
('01/11/2021',017,400000),
('01/11/2021',018,300000),
('01/11/2021',019,350000),
('01/11/2021',020,200000),
('01/11/2021',021,150000),
('01/11/2021',022,400000),
('01/11/2021',023,500000),
('01/11/2021',024,550000)
--nhan vien
SET DATEFORMAT DMY
INSERT INTO NHANVIEN
VALUES
--tau ND001
(N'Trần Văn Dương','20/01/1990',N'Nam Định','0789672547','TT','ND001','07931005598'),
(N'Mai Văn Đẩu','01/11/1993',N'Hải Phòng','0789659547','TV','ND001','0791055980'),
(N'Lê Văn Phi','10/09/1995',N'Bình Thuận','0789732557','TV','ND001','07931005531'),
(N'Vũ Văn Huy','30/08/1992',N'Nam Định','0789636547','TV','ND001','07930007508'),
--tau ND002
(N'Vũ Văn Huỳnh','20/01/1989',N'Nam Định','0789532547','TT','ND002','07930105573'),
(N'Lê Văn Viên','20/02/1986',N'TP HCM','0789632468','TV','ND002','07930105567'),
(N'Phạm Văn Chỉnh','16/01/1990',N'Hà Nội','0789625474','TV','ND002','07931005501'),
(N'Nguyễn Văn Tuấn','11/05/1990',N'Hải Phòng','0789634731','TV','ND002','0793005538'),
--tau ND003
(N'Nguyễn Văn Tuấn','20/01/1980',N'Vĩnh Long','0789541347','TT','ND003','07930105473'),
(N'Vũ Văn Hiệu','02/02/1987',N'Cà Mau','0789632769','TV','ND003','07930105579'),
(N'Đặng Văn Thao','12/01/1991',N'Hà Nội','0989725774','TV','ND003','08930105532'),
(N'Vũ Văn Tùng','01/05/1992',N'Hải Phòng','0779634533','TV','ND003','07930075539'),
--tau ND004
(N'Nguyễn Văn Vịnh','10/01/1984',N'Nam Định','0789541635','TT','ND004','07935005456'),
(N'Hoàng Văn Pha','26/02/1987',N'Cà Mau','0789632772','TV','ND004','07930150578'),
(N'Nguyễn Văn Hiền','12/05/1990',N'Gia Lai','0789785774','TV','ND004','08931905547'),
(N'Lê Văn Chính','01/06/1992',N'Hải Phòng','0779634932','TV','ND004','07930275539'),
--tau ND005
(N'Lê Văn Tuyển','15/02/1985',N'Cần Thơ','0789536735','TT','ND005','07930745612'),
(N'Vũ Văn Khánh','27/06/1987',N'Bạc Liêu','0789782727','TV','ND005','07930157805'),
(N'Hoàng Văn Sông','21/05/1991',N'Gia Lai','0789785754','TV','ND005','08931905535'),
(N'Vũ Văn Chương','11/06/1993',N'An Giang','0779644921','TV','ND005','07932753922'),
--tau ND006
(N'Lê Văn Sinh','05/12/1983',N'Phú Yên','0789456715','TT','ND006','07930747812'),
(N'Lương Văn Triều','07/01/1985',N'Nha Trang','0789782736','TV','ND006','07930157785'),
(N'Nguyễn Văn Đốc','26/05/1991',N'An Giang','0785585754','TV','ND006','08930195536'),
(N'Lương Văn Tư','19/06/1989',N'Bình Thuận','0779644957','TV','ND006','07932753921'),
--tau ND007
(N'Trần Văn Phiên','15/10/1988',N'Phú Yên','0789456205','TT','ND007','07838747362'),
(N'Trần Văn Hiệu','17/01/1990',N'Nam Định','0789782711','TV','ND007','07970857721'),
(N'Trần Văn Yến','21/05/1991',N'Bắc Giang','0785580354','TV','ND007','07931905736'),
(N'Nguyễn Thế Lưu','19/07/1989',N'Ninh Thuận','0779674917','TV','ND007','07932853912'),
--tau ND008
(N'Trần Văn Măng','05/11/1985',N'Nam Định','0789456278','TT','ND008','07838757353'),
(N'Trần Văn Tam','27/12/1996',N'Lào Cai','0789784774','TV','ND008','07970185747'),
(N'Trần Văn Đệ','16/07/1990',N'Hải Phòng','0785580389','TV','ND008','079301053236'),
(N'Vũ Văn Bằng','09/08/1995',N'Ninh Thuận','0779675932','TV','ND008','0793785110'),
--tau ND009
(N'Trần Văn Tăng','03/11/1985',N'Nam Định','0789456273','TT','ND009','07838547378'),
(N'Đỗ Văn Nguyễn','07/12/1996',N'Hải Phòng','0789778702','TV','ND009','07971857417'),
(N'Trần Văn Âu','16/07/1990',N'Hải Phòng','0785580374','TV','ND009','079301053016'),
(N'Lương Văn Trí','09/05/1995',N'Bình Thuận','0779675102','TV','ND009','0792781210'),
--tau ND010
(N'Nguyễn Văn Điều','03/01/1985',N'Nam Định','0789456251','TT','ND010','07838547377'),
(N'Trần Văn Hiển','05/12/1996',N'Hải Phòng','0789778732','TV','ND010','07970857455'),
(N'Nguyễn Văn Bồn','17/07/1990',N'Hải Phòng','0785580311','TV','ND010','079309053045'),
(N'Phạm Ngọc Bá','08/05/1995',N'Hải Phòng','0779675114','TV','ND010','0793281212'),
--tau ND011
(N'Phạm Văn Thìn','07/01/1985',N'Nha Trang','0789456021','TT','ND011','07838754377'),
(N'Roãn Văn Xiêm','08/02/1995',N'Nam Định','0789748732','TV','ND011','07970182401'),
(N'Roãn Văn Đại','15/07/1991',N'Nam Định','0785584341','TV','ND011','079301979036'),
(N'LRoãn Văn Đô','09/04/1992',N'Nam Định','0779671109','TV','ND011','0793271298'),
--tau ND012
(N'Mai Văn Lương','05/10/1985',N'Nam Định','0789456223','TT','ND012','07835547379'),
(N'Trần Văn Tú','06/12/1996',N'Bình Thuận','0789328701','TV','ND012','07971857411'),
(N'Phạm Văn Hiên','06/05/1992',N'Hải Phòng','0785580396','TV','ND012','079309053045'),
(N'Phạm Văn Chuyên','09/03/1994',N'Bình Thuận','0779675102','TV','ND012','0793781212'),
--tau ND013
(N'Nguyễn Văn Đủ','03/11/1982',N'Nam Định','0789456278','TT','ND013','07838757377'),
(N'Nguyễn Văn Khánh','07/11/1995',N'Hải Phòng','0789778709','TV','ND013','07901541756'),
(N'Nguyễn Văn Hiền','16/05/1990',N'am Định','0785580375','TT','ND013','079301053198'),
(N'Phạm Văn Ngọc','09/05/1994',N'Bình Thuận','0789675103','TV','ND013','0793781025'),
--tau ND014
(N'Trần Văn Đốc','03/10/1985',N'Nam Định','0789456298','TT','ND014','07837847378'),
(N'Trần Văn Đề','11/02/1996',N'Hải Phòng','0789718723','TV','ND014','07970367417'),
(N'Mai Văn Công','19/07/1990',N'Gia Lai','0785570377','TV','ND014','079301793016'),
(N'Vũ Văn Sỹ','29/05/1995',N'Bình Thuận','0779675005','TV','ND014','0793281890'),
--tau ND015
(N'Nguyễn Văn Phước','09/01/1985',N'Nam Định','0778456273','TT','ND015','07836547128'),
(N'Trần Văn Đoán','08/11/1994',N'Hải Phòng','07897787782','TV','ND015','07979857417'),
(N'Vũ Mạnh Cường','17/07/1992',N'TP HCM','0785580964','TV','ND015','079301908016'),
(N'Mai Văn Trình','10/05/1994',N'Bình Thuận','0773675102','TV','ND015','0792781236'),
--quan ly
(N'Trần Ngọc Hiểu','20/04/1997',N'Nam Định','0785589864','QL',NULL,'079301078077'),
(N'Hoàng Văn Tuyến','10/06/1994',N'Bình Thuận','0773675785','NVVP',NULL,'0792786355'),
(N'Trần Văn Đề','11/05/1594',N'Bình Thuận','07736756625','NVVP',NULL,'0793286302'),
(N'Vũ Văn Xuyên','19/05/1994',N'Bình Thuận','0773675536','NVVP',NULL,'0793786456')
--toa do tau
SET DATEFORMAT DMY
INSERT INTO TOADOTAU
VALUES
('ND001','20/01/2021',NULL,NULL),
('ND002','20/02/2021',NULL,NULL),
('ND003','20/03/2021',NULL,NULL),
('ND004','20/04/2021',NULL,NULL),
('ND005','20/05/2021',NULL,NULL),
('ND006','20/06/2021',NULL,NULL),
('ND007','20/09/2021',NULL,NULL),
('ND008','20/09/2021',NULL,NULL),
('ND009','20/10/2021',NULL,NULL),
('ND010','20/11/2021',NULL,NULL),
('ND011','20/02/2021',NULL,NULL),
('ND012','20/05/2021',NULL,NULL),
('ND013','20/06/2021',NULL,NULL),
('ND014','20/01/2021',NULL,NULL),
('ND015','20/05/2021',NULL,NULL)
--khach hang 
INSERT INTO khachhang
VALUES
(N'Nguyễn Văn Tiến','0902411653','ST001',N'TP HCM',NULL),
(N'Nguyễn Văn Bình','0902419643','ST002',N'Hà Nội',NULL),
(N'Trần Văn Kiên','0902471203','ST003',N'Hải Phòng',NULL),
(N'Nguyễn Văn Linh','0907411643','ST004',N'An Giang',NULL),
(N'Lê Văn Hùng','0902411696','ST005',N'TP HCM',NULL),
(N'Lê Huỳnh Tiến','0902471603','ST006',N'Cần Thơ',NULL),
(N'Nguyễn Huỳnh Nhât Văn','0902411653','ST007',N'Vĩnh Long',NULL),
(N'Trần Ái My','0902915603','ST008',N'Sóc Trăn',NULL),
(N'Nguyễn Thị Linh','0902361635','ST009',N'Nam Định',NULL),
(N'Võ Văn Cường','0902321637','ST010',N'Tiền Giang',NULL)
--hai trinh
INSERT INTO HAITRINH
VALUES
('ND001','20/10/2021','25/10/2021',NULL,NULL,NULL,19000),
('ND002','15/10/2021','25/10/2021',NULL,NULL,NULL,19000),
('ND003','17/08/2021','25/09/2021',NULL,NULL,NULL,19000),
('ND004','18/11/2021','26/11/2021',NULL,NULL,NULL,19000),
('ND005','15/09/2021','10/10/2021',NULL,NULL,NULL,19000),
('ND006','05/10/2021','17/10/2021',NULL,NULL,NULL,19000),
('ND007','08/10/2021','14/10/2021',NULL,NULL,NULL,19000),
('ND008','10/11/2021','12/11/2021',NULL,NULL,NULL,19000),
('ND009','30/08/2021','25/09/2021',NULL,NULL,NULL,19000),
('ND010','10/11/2021','15/11/2021',NULL,NULL,NULL,19000),
('ND011','15/10/2021','20/10/2021',NULL,NULL,NULL,19000),
('ND012','22/07/2021','25/07/2021',NULL,NULL,NULL,19000),
('ND013','17/06/2021','25/06/2021',NULL,NULL,NULL,19000),
('ND014','18/11/2021','24/11/2021',NULL,NULL,NULL,19000),
('ND015','19/10/2021','25/10/2021',NULL,NULL,NULL,19000)
--bang luong
SET DATEFORMAT DMY
INSERT INTO BANGLUONG
VALUES
(1,'20/07/2020',30,NULL,NULL,N'DANHAN'),
(2,'20/07/2020',30,NULL,NULL,N'DANHAN'),
(3,'20/07/2020',20,NULL,NULL,N'DANHAN'),
(4,'20/07/2020',30,NULL,NULL,N'DANHAN'),
(5,'20/07/2020',10,NULL,NULL,N'DANHAN'),
(6,'20/07/2020',20,NULL,NULL,N'DANHAN'),
(7,'20/07/2020',25,NULL,NULL,N'DANHAN'),
(8,'20/07/2020',30,NULL,NULL,N'DANHAN'),
(9,'20/07/2020',15,NULL,NULL,N'DANHAN'),
(10,'20/07/2020',25,NULL,NULL,N'DANHAN'),
(11,'20/07/2020',20,NULL,NULL,N'DANHAN'),
(12,'20/07/2020',20,NULL,NULL,N'DANHAN'),
(13,'20/07/2020',25,NULL,NULL,N'DANHAN'),
(14,'20/07/2020',18,NULL,NULL,N'DANHAN'),
(15,'20/07/2020',28,NULL,NULL,N'DANHAN'),
(16,'20/07/2020',27,NULL,NULL,N'DANHAN'),
(17,'20/07/2020',26,NULL,NULL,N'DANHAN'),
(18,'20/07/2020',25,NULL,NULL,N'DANHAN'),
(19,'20/07/2020',24,NULL,NULL,N'DANHAN'),
(20,'20/07/2020',22,NULL,NULL,N'DANHAN'),
(21,'20/07/2020',30,NULL,NULL,N'DANHAN'),
(22,'20/07/2020',20,NULL,NULL,N'DANHAN'),
(23,'20/07/2020',15,NULL,NULL,N'DANHAN'),
(24,'20/07/2020',20,NULL,NULL,N'DANHAN'),
(25,'20/07/2020',19,NULL,NULL,N'DANHAN'),
(26,'20/07/2020',26,NULL,NULL,N'DANHAN'),
(27,'20/07/2020',25,NULL,NULL,N'DANHAN'),
(28,'20/07/2020',28,NULL,NULL,N'DANHAN'),
(29,'20/07/2020',27,NULL,NULL,N'DANHAN'),
(30,'20/07/2020',26,NULL,NULL,N'DANHAN'),
(31,'20/07/2020',20,NULL,NULL,N'DANHAN'),
(32,'20/07/2020',30,NULL,NULL,N'DANHAN'),
(33,'20/07/2020',20,NULL,NULL,N'DANHAN'),
(34,'20/07/2020',20,NULL,NULL,N'DANHAN'),
(35,'20/07/2020',20,NULL,NULL,N'DANHAN'),
(36,'20/07/2020',20,NULL,NULL,N'DANHAN'),
(37,'20/07/2020',30,NULL,NULL,N'DANHAN'),
(38,'20/07/2020',25,NULL,NULL,N'DANHAN'),
(39,'20/07/2020',25,NULL,NULL,N'DANHAN'),
(40,'20/07/2020',25,NULL,NULL,N'DANHAN'),
(41,'20/07/2020',15,NULL,NULL,N'DANHAN'),
(42,'20/07/2020',20,NULL,NULL,N'DANHAN'),
(43,'20/07/2020',20,NULL,NULL,N'DANHAN'),
(44,'20/07/2020',25,NULL,NULL,N'DANHAN'),
(45,'20/07/2020',25,NULL,NULL,N'DANHAN'),
(46,'20/07/2020',25,NULL,NULL,N'DANHAN'),
(47,'20/07/2020',25,NULL,NULL,N'DANHAN'),
(48,'20/07/2020',25,NULL,NULL,N'DANHAN'),
(49,'20/07/2020',25,NULL,NULL,N'DANHAN'),
(50,'20/07/2020',25,NULL,NULL,N'DANHAN'),
(51,'20/07/2020',26,NULL,NULL,N'DANHAN'),
(52,'20/07/2020',24,NULL,NULL,N'DANHAN'),
(53,'20/07/2020',23,NULL,NULL,N'DANHAN'),
(54,'20/07/2020',29,NULL,NULL,N'DANHAN'),
(55,'20/07/2020',27,NULL,NULL,N'DANHAN'),
(56,'20/07/2020',28,NULL,NULL,N'DANHAN'),
(57,'20/07/2020',26,NULL,NULL,N'DANHAN'),
(58,'20/07/2020',23,NULL,NULL,N'DANHAN'),
(59,'20/07/2020',25,NULL,NULL,N'DANHAN'),
(60,'20/07/2020',25,NULL,NULL,N'DANHAN'),
(61,'20/07/2020',30,NULL,NULL,N'DANHAN'),
(62,'20/07/2020',30,NULL,NULL,N'DANHAN'),
(63,'20/07/2020',30,NULL,NULL,N'DANHAN'),
(64,'20/07/2020',30,NULL,NULL,N'DANHAN')

--hoa don
SET DATEFORMAT DMY
INSERT INTO HOADON
VALUES
(1,NULL,'20/08/2021',N'DATHANHTOAN'),
(2,NULL,'20/08/2021',N'CHUATHANHTOAN'),
(3,NULL,'20/08/2021',N'DATHANHTOAN'),
(4,NULL,'20/08/2021',N'CHUATHANHTOAN'),
(5,NULL,'20/07/2021',N'DATHANHTOAN'),
(6,NULL,'20/06/2021',N'CHUATHANHTOAN'),
(7,NULL,'20/05/2021',N'DATHANHTOAN'),
(8,NULL,'20/09/2021',N'DATHANHTOAN'),
(9,NULL,'20/10/2021',N'DATHANHTOAN'),
(10,NULL,'20/08/2021',N'DATHANHTOAN')
--ct hoa don
INSERT INTO CTHOADON
VALUES
(1,2,10.5,NULL,NULL),
(2,1,10,NULL,NULL),
(3,3,11,NULL,NULL),
(4,4,15,NULL,NULL),
(5,5,9.5,NULL,NULL),
(6,6,50,NULL,NULL),
(7,7,55,NULL,NULL),
(8,8,15,NULL,NULL),
(9,9,35,NULL,NULL),
(10,10,25,NULL,NULL)

SET IDENTITY_INSERT loaitin OFF
insert into loaitin
--(maloai,tenloai)
values
(N'Tin Hoạt Động'),
(N'Tin Tổng Hợp'),
(N'Các Đơn Vị Trong Ngành Hàng Hải'),
(N'Bài Viết Tham Khảo')

set dateformat dmy;
SET IDENTITY_INSERT chitiettin ON
insert into chitiettin
(matin,tieude,noidung,ngaydang,maloai,anh,link)
values
(1,N'Kiện toàn Ban Chấp hành Đoàn TNCS Hồ Chí Minh Cục Hàng hải Việt Nam khóa VIII, nhiệm kỳ 2017 - 2022',N'Chiều nay (ngày 03/11), Ban Chấp hành Đoàn Thanh niên Cục Hàng hải Việt Nam đã tổ chức thành công Hội nghị lần thứ năm Ban chấp hành Đoàn TNCS Hồ Chí Minh Hàng hải Việt Nam khóa VIII, nhiệm kỳ 2017...','12-4-2019',1,'HD1.jpg','https://www.vinamarine.gov.vn/vi/tin-tuc/kien-toan-ban-chap-hanh-doan-tncs-ho-chi-minh-cuc-hang-hai-viet-nam-khoa-viii-nhiem-ky-2017'),
(2,N'Thứ trưởng Nguyễn Xuân Sang làm việc tại Cảng vụ Hàng hải Hải Phòng',N'Ngày 21/10, Thứ trưởng Bộ GTVT Nguyễn Xuân Sang đã đến thăm và làm việc tại Cảng vụ Hàng hải Hải Phòng. Cùng đi, có Chủ tịch Công đoàn GTVT Việt Nam Đỗ Nga Việt, Phó Cục trưởng Cục Hàng hải Việt Nam...','25-6-2020',1,'HD2.jpg','https://www.vinamarine.gov.vn/vi/tin-tuc/thu-truong-nguyen-xuan-sang-lam-viec-tai-cang-vu-hang-hai-hai-phong'),
(3,N'Công bố Quy hoạch tổng thể hệ thống cảng biển Việt Nam thời kỳ 2021 - 2030, tầm nhìn đến năm 2050',N'Ngày 07/10/2021, tại Hà Hội, Bộ Giao thông vận tải (Bộ GTVT) tổ chức Hội nghị trực tuyến công bố “Quy hoạch tổng thể phát triển hệ thống cảng biển Việt Nam thời kỳ 2021 - 2030, tầm nhìn đến năm 2050...','25-6-2020',1,'HD3.jfif','https://vinamarine.gov.vn/vi/tin-tuc/cong-bo-quy-hoach-tong-he-thong-cang-bien-viet-nam-thoi-ky-2021-2030-tam-nhin-den-nam-2050'),
(4,N'Tin hoạt động đối ngoại',N'Tại Trụ sở Tổ chức Hàng hải quốc tế (International Maritime Organization - IMO) ở London, Tổng Thư ký IMO Kitack Lim đã tiếp thân mật Đại sứ Nguyễn Hoàng Long đến chào và cập nhật thông...','11-1-2021',2,'TH01.jpg','https://vov.vn/the-gioi/viet-nam-tang-cuong-hop-tac-voi-to-chuc-hang-hai-quoc-te-907074.vov'),
(5,N'Hơn 28.000 lao động hàng hải được tiêm vắc xin phòng Covid-19 tại TP.HCM',N'Cảng vụ hàng hải TP.HCM cùng các doanh nghiệp đề xuất tiêm vắc xin cho hơn 28.000 lao động liên quan đến hoạt động cảng biển khu vực.Hình ảnh minh họaÔng Nguyễn Hải Nam, Giám đốc cảng vụ hàng hải TP....','20-4-2021',2,'TH02.jpg','http://www.tapchigiaothong.vn/phan-dau-khoi-cong-du-an-luong-song-hau-2-vao-cuoi-nam-d93088.html'),
(6,N'Thứ trưởng Bộ GTVT khảo sát, kiểm tra dự án luồng tàu biển sông Hậu',N'Ngày 01/11, Thứ trưởng Bộ GTVT Nguyễn Xuân Sang đã có buổi khảo sát, kiểm tra tình hình thực hiện dự án Đầu tư Xây dựng luồng cho tàu biển tải trọng lớn vào sông Hậu (giai đoạn 2). Đây là 1 trong...','14-12-2021',3,'DV01.jpg','https://mt.gov.vn/vn/tin-tuc/76842/thu-truong-bo-gtvt-khao-sat--kiem-tra-du-an-luong-tau-bien-song-hau.aspx'),
(7,N'Cảng vụ Hàng hải Vũng Tàu triển khai phòng, chống Covid-19 hiệu quả gắn với làm tốt công tác xã hội tại địa phương',N'Trong thời gian qua, Cảng vụ Hàng hải Vũng Tàu đã và đang nỗ lực phối hợp với các cơ quan chuyên ngành khác tại cảng biển trong việc quản lý, chỉ đạo, giám sát doanh nghiệp thực hiện các yêu cầu...','26-1-2020',3,'DV02.jpg','https://www.vinamarine.gov.vn/vi/tin-tuc/cang-vu-hang-hai-vung-tau-trien-khai-phong-chong-covid-19-hieu-qua-gan-voi-lam-tot-cong-tac'),
(8,N'Đón cơ hội khi 3 cảng Việt Nam lọt Top 50 thế giới',N'Việc lọt vào bảng xếp hạng cao sẽ giúp cảng biển Việt Nam có vị thế và thu hút sự quan tâm của các hãng tàu lớn nhiều hơn.Hình ảnh minh họa Tân Cảng Cái MépBa cảng biển của Việt Nam lọt Top 50 cảng...','05-6-2021',4,'TK01.jpg','https://vinamarine.gov.vn/vi/tin-tuc/don-co-hoi-khi-3-cang-viet-nam-lot-top-50-gioi'),
(9,N'Nghị định số 67/2021/NĐ-CP và công tác sắp xếp cơ sở nhà, đất của các đơn vị hành chính, sự nghiệp trực thuộc Cục Hàng hải Việt Nam',N'Vừa qua, Chính phủ đã ban hành Nghị định số 67/2021/NĐ-CP ngày 15/7/2021 để sửa đổi, bổ sung một số điều của Nghị định số 167/2017/NĐ-CP ngày 31/12/2017 quy định việc sắp xếp lại, xử lý tài sản công...','25-11-2021',4,'TK02.jpg','https://www.vinamarine.gov.vn/vi/tin-tuc/nghi-dinh-so-672021nd-cp-va-cong-tac-sap-xep-co-so-nha-dat-cua-cac-don-vi-hanh-chinh-su')


--=======================================
--CAC PROC
--PROC LAY TEN TAI KHOAN, MAT KHAU
go
create proc prc_getLogin @usn varchar(20), @pwd varchar(20)
as
begin
	select count(*) from TAIKHOAN where tendangnhap=@usn and matkhau=@pwd
end
exec prc_getLogin @usn='quanly' , @pwd='1234'
delete 
--proc hien thi bang nhan vien

create proc prc_displayNV
as
begin 
	select id, hoten, ngaysinh, diachi, mabhxh, tenloai, matau, cccd
	from NHANVIEN nv, LOAINV lnv
	where nv.loainv=lnv.maloai
end

exec prc_displayNV

--proc tim kiem nhan vien

go
alter proc prc_findNV @text nvarchar(20)
as
begin
	select  hoten, ngaysinh, diachi, mabhxh, tenloai, matau, cccd
	from NHANVIEN nv, LOAINV lnv
	where 
		nv.loainv=lnv.maloai and
		hoten like '%'+@text+'%'
		or ngaysinh like '%'+@text+'%' 
		or diachi like '%'+@text+'%'
		or mabhxh like '%'+@text+'%'
		or tenloai like '%'+@text+'%'
		or matau like '%'+@text+'%' 
		or cccd like '%'+@text+'%'
end

exec prc_findNV N'test'
--lay sanh sach nhan vien
go
create proc prc_showNV
as
begin
	select id, hoten, ngaysinh, diachi, mabhxh, tenloai, matau, cccd
	from NHANVIEN nv, LOAINV lnv
	where nv.loainv=lnv.maloai 
end

--lay danh sach loai nhan vien
go
create proc prc_getLoaiNV
as
begin
	select  *
	from LOAINV
end
--them nhan vien
go
create proc prc_addNV @ten nvarchar(30), @ngaysinh date, @diachi nvarchar(50), @mabhxh char(12), @loainv char(10), @cccd char(12)
as
begin
	insert into nhanvien values (@ten,@ngaysinh,@diachi,@mabhxh,@loainv,null,@cccd)
end
--sua nhan vien
go
alter proc prc_changeNV @id int, @ten nvarchar(30), @ngaysinh date, @diachi nvarchar(50), @mabhxh char(12), @loainv char(10), @cccd char(12)
as
begin
	update nhanvien set hoten=@ten, ngaysinh=@ngaysinh, diachi=@diachi, mabhxh=@mabhxh, loainv=@loainv
	where id=@id
end
--xoa nhan vien
go
create proc prc_deleteNV @id int
as
begin
	delete from nhanvien where id=@id
end
exec prc_deleteNV 1004

--hien thi danh sach tau thuyen
go
alter proc prc_showTT
as
begin
	select tt.matau, loaitau, hoten from TAUTHUYEN tt, NHANVIEN nv
	where tt.thuyentruong=nv.id
end
exec prc_showTT 
--hien thi danh sach thuyen vien theo tau
go
alter proc prc_showNVbyTT @matau char(10)
as
begin
	select id,hoten,cccd from NHANVIEN where matau=@matau
end	
select * from NHANVIEN where loainv='tt'

--lay danh sach thuyen vien chua co thuyen
go
alter proc prc_getNVFree
as
begin
	select id, hoten, cccd from NHANVIEN where  loainv='TV' and matau is null
end

--lay danh sach thuyen truong chua co thuyen
go
create proc prc_getTTFree
as
begin
	select id, hoten, cccd from NHANVIEN where  loainv='TT' and matau is null
end

--lay so luong thuyen vien cua thuyen
go
create proc prc_countTV @matau char(10)
as
begin
	select count(*) from NHANVIEN where matau=@matau
end

--proc doi thuyen truong
go
alter proc prc_changeTT @matau char(10),  @ttmoi int
as
begin
	--set ma tau thuyen cua thuyen truong cu ve null
	update nhanvien set matau=null where matau=@matau and loainv='TT'
	--set ma thuyen truong moi vao tau moi
	update TAUTHUYEN set thuyentruong=@ttmoi where matau=@matau
end

--select * from NHANVIEN where id=1002

--cap nhat thuyen cho thuyen vien
go
create proc prc_updateTTNV @manv int, @matau char(10)
as
begin
	update NHANVIEN set matau=@matau where id=@manv
end

