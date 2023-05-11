CREATE DATABASE DANGKIKHAMCHUABENH
USE DANGKIKHAMCHUABENH

--tạo tài khoản
CREATE TABLE TAIKHOAN
(
	TENDN	NVARCHAR (50)
	CONSTRAINT PK_TAIKHOAN PRIMARY KEY(TENDN),
	MATKHAU VARCHAR (20),
)
---Bệnh nhân
CREATE TABLE BENHNHAN
(
	MABN		NVARCHAR (6)
	CONSTRAINT PK_BENHNHAN PRIMARY KEY(MABN),
	HOTENBN     NVARCHAR(50),
	CMND        NVARCHAR(12),	
	GIOITINH	NVARCHAR (10) CONSTRAINT CK_GIOITINH_BENHNHAN CHECK (GIOITINH IN (N'Nam', N'Nữ', N'Khác')),
	NGAYSINH	DATETIME ,
	DIACHI		NVARCHAR(100) ,
	SDT		NVARCHAR(11)	
)

--khoa
CREATE TABLE KHOA
(
	MAKHOA		NVARCHAR (6),
	TENKHOA		NVARCHAR (20),
	CONSTRAINT PK_KHOA PRIMARY KEY(MAKHOA)
)

---Nhân viên
CREATE TABLE NHANVIEN
(
	MANV		NVARCHAR (6)
	CONSTRAINT PK_NHANVIEN PRIMARY KEY(MANV),
	MAKHOA	NVARCHAR (6)
	CONSTRAINT FK_NHANVIEN_KHOA FOREIGN KEY(MAKHOA) REFERENCES KHOA (MAKHOA),
	HOTENNV		NVARCHAR (50),
	CMNDNV		NVARCHAR(12),	
	DIACHINV		NVARCHAR(100) ,
	NGAYSINHNV	DATETIME ,
	SDTNV	NVARCHAR(11),
)

---BÁC SĨ
CREATE TABLE BACSI
(
	MABS		NVARCHAR (6)
	CONSTRAINT PK_BACSI PRIMARY KEY(MABS),
	MAKHOA	NVARCHAR (6)
	CONSTRAINT FK_BACSI_KHOA FOREIGN KEY(MAKHOA) REFERENCES KHOA(MAKHOA),
	HOTENBS	NVARCHAR (50),
	CMNDBS		NVARCHAR(12),	
	DIACHIBS		NVARCHAR(100) ,
	NGAYSINHBS	DATETIME ,
	SDTBS		NVARCHAR(11),
)

---Y TÁ
CREATE TABLE YTA
(
	MAYT		NVARCHAR (6)
	CONSTRAINT PK_YTA PRIMARY KEY(MAYT),
	MAKHOA	NVARCHAR (6)
	CONSTRAINT FK_YTA_KHOA FOREIGN KEY(MAKHOA) REFERENCES KHOA (MAKHOA),
	HOTENYT	NVARCHAR (50),
	CMNDYT		NVARCHAR(12),	
	DIACHIYT		NVARCHAR(100) ,
	NGAYSINHYT	DATETIME ,
	SDTYT		NVARCHAR(11),
)

--Hồ Sơ Bệnh Lý
CREATE TABLE HOSOBENHLY
(
	MAHS		NVARCHAR (6)
	CONSTRAINT  PK_HOSOBENHLY PRIMARY KEY(MAHS),
	MABN		NVARCHAR (6)
	CONSTRAINT FK_HOSOBENHLY_MABN FOREIGN KEY(MABN) REFERENCES BENHNHAN (MABN),
	MAKHOA		NVARCHAR(6)
	CONSTRAINT FK_HOSOBENHLY_MAKHOA FOREIGN KEY(MAKHOA) REFERENCES KHOA (MAKHOA),
	NGAYVAOVIEN DATETIME,
	NGAYDUDOANXUATVIEN DATETIME,
	CAXETNGHIEM NVARCHAR(50),
	CAKHAMBENH NVARCHAR(50),
	PHUONGPHAPDIEUTRI NVARCHAR(100),
	PHANUNGPHU NVARCHAR(50),
	KETQUA NVARCHAR(50)
)

--Phiếu Khám Tổng Quát
CREATE TABLE PHIEUKHAMTONGQUAT
(
	MAPK		NVARCHAR (6)
	CONSTRAINT PK_PHIEUKHAMTONGQUAT PRIMARY KEY(MAPK),
	MABN		NVARCHAR (6)
	CONSTRAINT FK_PHIEUKHAMTONGQUAT_MABN FOREIGN KEY(MABN) REFERENCES BENHNHAN (MABN),	
	NGAYKHAM	DATETIME,
	DIENBIENBENH	NTEXT,
	KETQUAKHAM		NTEXT
)

--Hóa Đơn Viện Phí
CREATE TABLE HOADONVIENPHI
(
	MAHD		NVARCHAR (6)
	CONSTRAINT PK_HOADONVIENPHI PRIMARY KEY(MAHD),
	MAHS NVARCHAR(6),
	CONSTRAINT FK_HOADONVIENPHI_MAHS FOREIGN KEY(MAHS) REFERENCES HOSOBENHLY (MAHS),
	MABN		NVARCHAR (6)
	CONSTRAINT FK_HOADONVIENPHI_MABN FOREIGN KEY(MABN) REFERENCES BENHNHAN (MABN),
	NGAYKHAM DATETIME,
	TONGTIEN		FLOAT,
	HOTRO NVARCHAR(100),
	HINHTHUCTHANHTOAN NVARCHAR(30),
	THANHTIEN FLOAT
)

---Tiền Sử Bệnh
CREATE TABLE TIENSUBENH
(
MATS NVARCHAR(6)
CONSTRAINT PK_TIENSUBENH PRIMARY KEY(MATS),
MABN NVARCHAR(6)
CONSTRAINT FK_TIENSUBENH_MABN FOREIGN KEY(MABN) REFERENCES BENHNHAN (MABN),
TIENSUBANTHAN NVARCHAR(100),
TIENSUGIADINH NVARCHAR(100),
THONGTIENLIENQUAN NVARCHAR(100)
)

---Giấy Xuất Viện
CREATE TABLE GIAYXUATVIEN
(
MAGXV NVARCHAR(6),
CONSTRAINT PK_GIAYXUATVIEN PRIMARY KEY(MAGXV),
MABN NVARCHAR(6),
CONSTRAINT FK_GIAYXUATVIEN_MABN FOREIGN KEY(MABN) REFERENCES BENHNHAN (MABN),
NGAYVAOVIEN DATETIME,
NGAYXUATVIEN DATETIME,
MABHYT NVARCHAR(15),
CHANDOAN NTEXT,
PHUONGPHAPDIEUTRI NTEXT,
GHICHU NTEXT
)

INSERT INTO TAIKHOAN 
VALUES ('ahsiu1234','123456'),
('jasmint','123456'),
('lavender','123456'),
('kendall','123456'),
('lily','123456')

INSERT INTO KHOA
VALUES ('KPS',N'Khoa Phụ Sản'),
('KN',N'Khoa Nhi'),
('KCC',N'Khoa Cấp Cứu'),
('KXN',N'Khoa Xét Nghiệm'),
('KPCN',N'Phòng Chức Năng')


INSERT INTO NHANVIEN
VALUES 
('NV0001','KPCN',N'Lê Ngô Tường Vy','193420583',N'67 Số 30,Phường 7,Gò Vấp,TP.HCM',Convert(date,'1998/05/05'),'0113112393'),
('NV0002','KPCN',N'Vũ Tường Nguyên','128823451',N'792/26 Kha Vạn Cân,Phường Linh Đông,Quận Thủ Đức,TP.HCM',Convert(date,'1998/03/12'),'0365703403'),
('NV0003','KPCN',N'Mai Tấn Văn','800034511',N'436 Lê Văn Việt,Hiệp Phú,Quận 9,TP.HCM',Convert(date,'1994/07/14'),'0151654323'),
('NV0004','KCC',N'Phạm Thị Tuyết Mai','618823451',N'33 Mã Lò,phường Bình Trị Đông A,quận Bình Tân,TP.HCM',Convert(date,'1993/06/26'),'0915131565'),
('NV0005','KN',N'Phan Đỗ Bảo Nhi','138823451',N'219 Nguyễn Thị Định,Phường Bình Trưng Tây,Quận 2,TP.HCM',Convert(date,'1989/09/11'),'0223062393')

INSERT INTO BACSI
VALUES 
('NV0001','KCC',N'Olivia Rodrigo','138823451',N'219 Nguyễn Thị Định,Phường Bình Trưng Tây,Quận 2,TP.HCM',Convert(date,'1989/09/11'),'0223062393'),
('BS0002','KPS',N'Kendall Jenner','606033451',N'67 bis Nguyễn Thượng Hiền, q.Bình Thạnh,Tp.HCM',Convert(date,'1991/02/01'),'0085278993'),
('BS0003','KN',N'Từ Vũ','179451351',N'219 Nguyễn Thị Định,Phường Bình Trưng Tây,Quận 2,TP.HCM',Convert(date,'1997/09/10'),'0939112293'),
('BS0004','KCC',N'Lương Công Tiến','103023419',N'49/12B Nguyễn Thị Minh Khai, Q1, Tp.HCM',Convert(date,'1996/05/11'),'0912313993'),
('BS0005','KXN',N'Trần Thị Như Ý','146453000',N'123/6 bis Lê Thánh Tôn, Q1, Tp.HCM',Convert(date,'1995/01/21'),'0339317215'),
('BS0006','KCC',N'Kylie Jenner','100004451',N'178/97 An Dương Vương',Convert(date,'1988/06/13'),'0852785457'),
('BS0007','KXN',N'Tô Văn Duy Đang','138850500',N'78/12/8 Tân Hội',Convert(date,'1984/11/11'),'0981927613'),
('BS0008','KCC',N'Đỗ Kiều Duy','179497171',N'Lô C, phòng 28, chung cư Thanh Đa',Convert(date,'1993/09/02'),'0109021213'),
('BS0009','KPS',N'Trần Thủy Tiên','503213451',N'67 Kỳ Đồng',Convert(date,'1989/11/06'),'0339852705'),
('BS0010','KN',N'Trần Ý Vy','938000451',N'51 Cao Thắng,Phường 3,Quận 3,TP.HCM',Convert(date,'1994/12/01'),'0339317215')

INSERT INTO YTA
VALUES 
('YT0001','KPS',N'Huỳnh Ngọc Yến','908823451',N'193 Cô Giang,Quận 1,TP.HCM',Convert(date,'1994/07/14'),'0915712393'),
('YT0002','KCC',N'Vũ Hoàng Quyên','78823451',N'31A/30 Nguyễn Quý Yêm,quận Bình Tân,TP.HCM',Convert(date,'1994/07/14'),'0915888893'),
('YT0003','KCC',N'Đinh Minh Thư','222319551',N'12H Nguyễn Thị Minh Khai,Đa Kao,Quận 1,TP.HCM',Convert(date,'1997/04/06'),'0981312393'),
('YT0004','KCC',N'Nguyễn Thị Hoài Thu','882345129',N'Lê Lợi,Quận 1,TP.HCM',Convert(date,'1994/07/14'),'0320712214'),
('YT0005','KPS',N'Lê Hồng Nhung','385848463',N'84 Đặng Văn Ngữ,Phường 10,Phú Nhuận,TP.HCM',Convert(date,'1988/09/13'),'0731564393')

INSERT INTO BENHNHAN(MABN,HOTENBN,NGAYSINH,GIOITINH,CMND,DIACHI,SDT)
VALUES 
('BN0001',N'Lê Hoàng Dương',Convert(date,'1989/03/04'),N'Nam','384852413',N'183/29G Tân Hoà Đông,Phường 14,Quận 6,TP.HCM','0339852705'),
('BN0002',N'Trần Xuân Hiên',Convert(date,'1999/02/16'),N'Nữ','321424858',N'99A Trần Văn Đang,P.9,Quận 3,TP.HCM','0827393993'),
('BN0003',N'Lê Nhật Tường',Convert(date,'1997/01/05'),N'Nam','471989921',N'145 Nguyễn Gia Trí,Phường 25,Quận Bình Thạnh,,TP.HCM','0339317215'),
('BN0004',N'Vũ Minh Trí',Convert(date,'1989/12/10'),N'Nam','471989921',N'C218 Xóm Chiếu,Quận 4,TP.HCM','0903393993'),
('BN0005',N'Vũ Thu Phương',Convert(date,'1999/06/20'),N'Nam','412314531',N'243/29E Tôn Đản,P.15,Quận 4,TP.HCM','0852785457'),
('BN0006',N'Đoàn Kim Anh',Convert(date,'1999/10/03'),N'Nữ','135314531',N'150 Lê Văn Sỷ,Phường 10,Phú Nhuận,TP.HCM','0939393993'),
('BN0007',N'Quách Xuân Lâm',Convert(date,'1996/05/09'),N'Nam','131314256',N'223 Trần Bình Trọng,Quận 5,TP.HCM','0930339333'),
('BN0008',N'Trần Tùng Duy',Convert(date,'2000/12/27'),N'Nam','451234423',N'346 Lê Văn Sỹ,Phường 2,Quận Tân Bình,TP.HCM','0852785457'),
('BN0009',N'Hồ Phương Anh',Convert(date,'1998/08/04'),N'Nữ','245512346',N'Hẻm 386/43B Lê Văn Sỹ,Phường 14,Quận 3,TP.HCM','0085278993'),
('BN0010',N'Mai Phương Anh',Convert(date,'1997/04/06'),N'Nữ','134535644',N'147 đường số 9,Phước Bình,Quận 9,TP.HCM','0339317215')

INSERT INTO TIENSUBENH
VALUES 
('TS0001','BN0001',N'Tim bẩm sinh',N'Cha mắc bệnh tim',N'Không dùng những chất kích thích'),
('TS0002','BN0002',N'Sinh hoạt bình thường',N'Không',N'Không'),
('TS0003','BN0003',N'Sinh hoạt bình thường',N'Không',N'Không'),
('TS0004','BN0004',N'Sức khỏe từ nhỏ đã yếu',N'Không',N'Không'),						
('TS0005','BN0005',N'Sinh hoạt bình thường',N'Không',N'Không'),
('TS0006','BN0006',N'Sinh hoạt bình thường',N'Không',N'Không'),
('TS0007','BN0007',N'Sinh hoạt bình thường',N'Không',N'Không'),
('TS0008','BN0008',N'Sinh hoạt không lành mạnh',N'Không',N'Có dùng thuốc lá'),						
('TS0009','BN0009',N'Sinh hoạt bình thường',N'Không',N'Không'),
('TS0010','BN0010',N'Sinh hoạt bình thường',N'Không',N'Không')

INSERT INTO PHIEUKHAMTONGQUAT
VALUES 
('TS0001','BN0001',Convert(date,'2022/04/01'),N'Sức khỏe yếu, không làm được việc nặng',N'Có vấn đề Tim, Phải nhập viện'),
('TS0002','BN0002',Convert(date,'2022/04/01'),N'Ho nhiều',N'Có vấn đề Phổi, Phải xét nghiệm'),
('TS0003','BN0003',Convert(date,'2022/04/01'),N'Thường xuyên đau đầu',N'Có vấn đề hệ Thần Kinh, Phải xét nghiệm'),
('TS0004','BN0004',Convert(date,'2022/04/01'),N'Đau cột sống',N'Có vấn đề Xương Khớp, Phải xét nghiệm'),
('TS0005','BN0005',Convert(date,'2022/04/01'),N'Thường xuyên chóng mặt',N'Có vấn đề hệ Thần Kinh, Phải xét nghiệm'),
('TS0006','BN0006',Convert(date,'2022/04/02'),N'Thường xuyên đau đầu',N'Có vấn đề hệ Thần Kinh, Phải xét nghiệm'),
('TS0007','BN0007',Convert(date,'2022/04/02'),N'Nhức mỏi xương khớp',N'Có vấn đề Xương Khớp, Phải nhập viện'),
('TS0008','BN0008',Convert(date,'2022/04/02'),N'Ho nhiều, sức khỏe suy nhược',N'Có vấn đề Phổi, Phải nhập viện'),
('TS0009','BN0009',Convert(date,'2022/04/02'),N'Đau xương khớp nặng, không thể đi lại',N'Có vấn đề Xương Khớp, Phải nhập viện'),
('TS0010','BN0010',Convert(date,'2022/04/02'),N'Chóng mặt, đau đầu nặng',N'Có vấn đề hệ Thần Kinh, Phải nhập viện')

INSERT INTO HOSOBENHLY
VALUES ('HS0001','BN0002','KCC',Convert(date,'2022/04/01'),Convert(date,'2022/04/06'),N'Sáng',N'Chiều',N'Đo điện tâm đồ, xét nghiệm tổng quát',N'Không dùng được chất kích thích',N'Bệnh Tim'),
('HS0002','BN0002','KXN',Convert(date,'2022/04/01'),Convert(date,'2022/04/02'),N'Sáng',N'Chiều',N'Chụp X-Quang Phổi',N'Không',N'Bình thường'),
('HS0003','BN0003','KXN',Convert(date,'2022/04/01'),Convert(date,'2022/04/02'),N'Sáng',N'Chiều',N'Chụp X-Quang Đầu',N'Không',N'Bình thường'),
('HS0004','BN0004','KXN',Convert(date,'2022/04/01'),Convert(date,'2022/04/02'),N'Chiều',N'Chiều',N'Chụp X-Quang Xương Khớp',N'Không',N'Bình thường'),
('HS0005','BN0005','KXN',Convert(date,'2022/04/01'),Convert(date,'2022/04/02'),N'Chiều',N'Chiều',N'Chụp X-Quang Đầu',N'Không',N'Bình thường'),
('HS0006','BN0006','KXN',Convert(date,'2022/04/02'),Convert(date,'2022/04/03'),N'Sáng',N'Chiều',N'Chụp X-Quang Đầu',N'Không dùng được kháng sinh',N'Bình thường'),
('HS0007','BN0007','KCC',Convert(date,'2022/04/02'),Convert(date,'2022/04/03'),N'Sáng',N'Chiều',N'Chụp X-Quang Xương Khớp, Xét nghiệm tổng quát',N'Không',N'Bệnh Gai Cột Sống'),
('HS0008','BN0008','KCC',Convert(date,'2022/04/02'),Convert(date,'2022/04/03'),N'Chiều',N'Chiều',N'Chụp X-Quang Phổi, Xét nghiệm tổng quát',N'Không',N'Bệnh Lao Phổi'),
('HS0009','BN0009','KCC',Convert(date,'2022/04/02'),Convert(date,'2022/04/03'),N'Chiều',N'Chiều',N'Chụp X-Quang Xương Khớp, Xét nghiệm tổng quát',N'Không',N'Bệnh Gai Cột Sống'),
('HS0010','BN0010','KCC',Convert(date,'2022/04/02'),Convert(date,'2022/04/03'),N'Chiều',N'Chiều',N'Chụp CT, Xét nghiệm tổng quát',N'Không dùng được kháng sinh',N'Bình thường')
 

INSERT INTO HOADONVIENPHI
VALUES ('HD0001','HS0001','BN0002',Convert(date,'2022/04/01'),'9999000','20%',N'Chuyển khoản','7999200'),
('HD0002','HS0002','BN0002',Convert(date,'2022/04/01'),'599000','0',N'Tiền mặt','599000'),
('HD0003','HS0003','BN0003',Convert(date,'2022/04/01'),'799000','0',N'Tiền mặt','799000'),
('HD0004','HS0004','BN0004',Convert(date,'2022/04/01'),'799000','0',N'Tiền mặt','790000'),
('HD0005','HS0005','BN0005',Convert(date,'2022/04/01'),'599000','0',N'Chuyển khoản','599000'),
('HD0006','HS0006','BN0006',Convert(date,'2022/04/02'),'899000','0',N'Chuyển khoản','899000'),
('HD0007','HS0007','BN0007',Convert(date,'2022/04/02'),'6999000','10%',N'Tiền mặt','6299100'),
('HD0008','HS0008','BN0008',Convert(date,'2022/04/02'),'7999000','0',N'Chuyển khoản','7999000'),
('HD0009','HS0009','BN0009',Convert(date,'2022/04/02'),'7999000','10%',N'Chuyển khoản','7199100'),
('HD0010','HS0010','BN0010',Convert(date,'2022/04/02'),'2999000','10%',N'Chuyển khoản','2699100')

INSERT INTO GIAYXUATVIEN
VALUES
('XV0001','BN0001',Convert(date,'2022/04/01'),Convert(date,'2022/04/09'),'DK2651528130267','Bệnh Tim','Đo điện tâm đồ, xét nghiệm tổng quát, Kết hợp uống thuốc','Uống thuốc đều đặn, Không dùng chất kích thích'),
('XV0002','BN0002',Convert(date,'2022/04/01'),Convert(date,'2022/04/01'),'DK2103549130267','Bình Thường','Chụp X-Quang Phổi','Uống thuốc đều đặn, hạn chế làm việc nặng'),
('XV0003','BN0003',Convert(date,'2022/04/01'),Convert(date,'2022/04/01'),'DK2109451302677','Bình Thường','Chụp X-Quang Đầu','Uống thuốc đều đặn, hạn chế làm việc nặng'),
('XV0004','BN0004',Convert(date,'2022/04/01'),Convert(date,'2022/04/01'),'DK1103545130267','Bình Thường','Chụp X-Quang Xương Khớp','Uống thuốc đều đặn, hạn chế làm việc nặng'),
('XV0005','BN0005',Convert(date,'2022/04/01'),Convert(date,'2022/04/02'),'DK9103038913027','Bình Thường','Chụp X-Quang Đầu','Uống thuốc đều đặn, hạn chế làm việc nặng'),
('XV0006','BN0006',Convert(date,'2022/04/02'),Convert(date,'2022/04/02'),'DK8103214913126','Bình Thường','Chụp X-Quang Đầu','Uống thuốc đều đặn, hạn chế làm việc nặng'),
('XV0007','BN0007',Convert(date,'2022/04/02'),Convert(date,'2022/04/05'),'DK7103506413026','Bệnh Gai Cột Sống','Chụp X-Quang Xương Khớp, Xét nghiệm tổng quát, Kết hợp uống thuốc','Uống thuốc đều đặn, hạn chế làm việc nặng, nghỉ ngơi nhiều hơn'),
('XV0008','BN0008',Convert(date,'2022/04/02'),Convert(date,'2022/04/07'),'DK5035545511226','Bệnh Lao Phổi','Chụp X-Quang Phổi, Xét nghiệm tổng quát, Kết hợp uống thuốc','Uống thuốc đều đặn, Không dùng thuốc lá, chất kích thích'),
('XV0009','BN0009',Convert(date,'2022/04/02'),Convert(date,'2022/04/07'),'DK3103054913020','Bệnh Gai Cột Sống','Chụp X-Quang Xương Khớp, Xét nghiệm tổng quát, Kết hợp uống thuốc','Uống thuốc đều đặn, hạn chế làm việc nặng, Nghỉ ngơi nhiều hơn'),
('XV0010','BN0010',Convert(date,'2022/04/02'),Convert(date,'2022/04/03'),'DK1103000913026','Bình Thường','Chụp CT, Xét nghiệm tổng quát, Kết hợp uống thuốc','Uống thuốc đều đặn, hạn chế làm việc nặng')



-------------1.   Procedure------------------
--1.1  Cho biết danh sách 3 hóa đơn viện phí có thành tiền lớn nhất
CREATE PROC Proc_DanhSachTop3HoaDon
AS
BEGIN
SELECT TOP(3)*
FROM HOADONVIENPHI
ORDER BY THANHTIEN DESC
END
		--Thực Thi:
		EXEC Proc_DanhSachTop3HoaDon


--1.2  Xem thông tin hóa đơn viện phí gồm có: mã hóa đơn, mã bệnh nhân, họ tên bệnh nhân, thành tiền ngày khám với ngày khám do người dùng yêu cầu.
CREATE PROC Proc_In4HDTuNgayKham (@NgayKham datetime2)
AS
BEGIN
SELECT HD.MAHD, BN.MABN, HOTENBN, THANHTIEN
FROM HOADONVIENPHI HD JOIN BENHNHAN BN ON HD.MABN= BN.MABN
WHERE NGAYKHAM=@NgayKham
END
		--Thực thi
		EXEC Proc_In4HDTuNgayKham '2022-04-01'
		EXEC Proc_In4HDTuNgayKham '2022-01-01'


--1.3  Thêm dữ liệu vào bảng Bệnh Nhân
CREATE PROC Prinsert_BenhNhan_MaBN(@MABN nvarchar(6),@HOTENBN nvarchar(50),@CMND nvarchar(12),@GIOITINH nvarchar(10),@NGAYSINH DATETIME,@DIACHI nvarchar(100),@SDT nvarchar(11))
AS
BEGIN 
IF EXISTS(SELECT * FROM BENHNHAN where MaBN = @MABN)
BEGIN
print N'Mã Bệnh Nhân bị trùng'
END
ELSE
INSERT INTO BENHNHAN VALUES(@MABN, @HOTENBN, @CMND, @GIOITINH, @NGAYSINH, @DIACHI, @SDT)
END
		--Thực thi
		EXECUTE Prinsert_BenhNhan_MaBN 'BN0011',N'Lê Thị Cúc','354555451',N'Nữ','1989-05-04',N'Lô C, phòng 28, chung cư Thanh Đa','092987987'

--1.4  Tạo thủ tục cho biết tổng doanh thu với ngày khám tham số truyền vào và tổng doanh thu là tham số
CREATE PROC Proc_TongDoanhThuNgay @NgayKham Datetime2, @DoanhThu int output
AS
SELECT @DoanhThu = Sum(ThanhTien)
FROM HOADONVIENPHI
WHERE NGAYKHAM = @NgayKham
		--Thực thi
		DECLARE @DOANHTHU int
		SET @DoanhThu = 0
		EXEC Proc_TongDoanhThuNgay '2022-04-02', @DoanhThu output
		Print N'Tổng doanh thu ngày 2022-04-02 là '+ cast (@DoanhThu as nvarchar(10))



-------------2.   Function------------------------
--2.1  Viết hàm cho biết số lượng bệnh nhân chữa trị ở các khoa với tham số truyền vào là mã khoa
CREATE FUNCTION F_SOLUONGBENHNHANTRONGKHOA(@MAKHOA NCHAR(6))
RETURNS int 
AS
BEGIN
DECLARE @SOBENHNHAN INT
	SELECT @SOBENHNHAN = COUNT(MAKHOA) 
	FROM HOSOBENHLY
	WHERE MAKHOA = @MAKHOA
	GROUP BY MAKHOA
RETURN @SOBENHNHAN
END
		--Thực thi :
		Print N'Số lượng bệnh nhân ở khoa Cấp Cứu là: '+ Convert(varchar, dbo.F_SOLUONGBENHNHANTRONGKHOA('KCC'))   
		Print N'Số lượng bệnh nhân ở khoa Xét Nghiệm là: '+ Convert(varchar, dbo.F_SOLUONGBENHNHANTRONGKHOA('KXN'))   

--2.2  Viết hàm xem danh sách các nhân viên theo mã khoa (trả về dạng bảng)
CREATE FUNCTION F_DSNhanVienKhoa(@MAKHOA NCHAR(6))
RETURNS Table 
AS
RETURN	
SELECT *
FROM NHANVIEN
WHERE MAKHOA = @MAKHOA
GO
		--Thực thi hàm: 
		Select * FROM F_DSNhanVienKhoa('KN')
		Select * FROM F_DSNhanVienKhoa('KCC')
		Select * FROM F_DSNhanVienKhoa('KXN')



-------------3.  Trigger------------------------
--3.1  Thành Tiền của hóa đơn viện phí phải lớn hơn hoặc bằng 0
CREATE TRIGGER TG_ThanhTien
ON HOADONVIENPHI
FOR INSERT, UPDATE
AS
IF EXISTS (SELECT * FROM INSERTED WHERE INSERTED.THANHTIEN < 0)
BEGIN
PRINT(N'THÀNH TIỀN CỦA HÓA ĐƠN VIỆN PHÍ PHẢI LỚN HƠN HOẶC BẰNG 0')
ROLLBACK TRAN
END
	--INSERT
INSERT INTO HOADONVIENPHI 
VALUES ('HD0011','HS0005','BN0005',Convert(date,'2022/04/01'),'599000','0',N'Chuyển khoản','9999000')
	---UPDATE
	UPDATE HOADONVIENPHI SET THANHTIEN = -2699100 WHERE MAHD ='HD0011'

--3.2  Ngày dự kiến XUẤT VIỆN phải NHỎ hơn HOẶC BẰNG ngày NHẬP VIỆN
CREATE TRIGGER TG_DUKIENXUATVIEN
ON HOSOBENHLY
FOR INSERT, UPDATE 
AS
IF EXISTS (SELECT * FROM INSERTED WHERE INSERTED.NGAYDUDOANXUATVIEN < NGAYVAOVIEN)
BEGIN
PRINT(N'NGÀY DỰ KIẾN XUẤT VIỆN PHẢI NHỎ HƠN HOẶC BẰNG NGÀY NHẬP VIỆN')
ROLLBACK TRAN
END
	---INSERT
INSERT INTO HOSOBENHLY 
VALUES ('HS0011','BN0010','KCC',Convert(date,'2022/12/12'),Convert(date,'2022/01/01'),N'Chiều',N'Chiều',N'Chụp CT, Xét nghiệm tổng quát',N'Không dùng được kháng sinh',N'Bình thường')
---UPDATE
UPDATE HOSOBENHLY SET NGAYDUDOANXUATVIEN= '2023-01-01' Where MAHS='HS0001'



