﻿CREATE DATABASE quanlibenhvien
GO

USE quanlibenhvien
GO

CREATE TABLE NHANVIEN
(
	MaNV CHAR(10),
	HotenNV NVARCHAR(50),
	ChucDanh NVARCHAR(50),
	TenKhoa CHAR(20),  --FK
	MaChuyennganh CHAR(10), -- FK 
	PRIMARY KEY (MaNV)
)
GO

CREATE TABLE BENHNHAN
(
	MaBN CHAR(10),
	HotenBN NVARCHAR(50),
	GioiTinh CHAR(10),
	NgaySinh DATETIME,  
	Tuoi INT,
	NgheNghiep NVARCHAR(50),
	DiaChi NVARCHAR(50),
	DanToc NVARCHAR(20),
	NoiLamViec NVARCHAR(50),
--	MaDT CHAR(10),-- FK ma doi tuong  
	PRIMARY KEY (MaBN)
)
GO

CREATE TABLE BENHLY
(
	MaBenh CHAR(10),
	TenBenh NVARCHAR(50),
	PRIMARY KEY (MaBenh)
)
GO

CREATE TABLE THUOC
(
	MaThuoc CHAR(10),
	TenBenh NVARCHAR(50),
	DonViTinh CHAR(10),
	XuatXu NVARCHAR(30),
	PRIMARY KEY (MaThuoc)
)
GO

CREATE TABLE DICHVU
(
	MaDV CHAR(10),
	TenDV NVARCHAR(50),
	PRIMARY KEY (MaDV)
)
GO

CREATE TABLE KHOA
(
	TenKhoa CHAR(20),
	PRIMARY KEY (TenKhoa)
)
GO

CREATE TABLE GIUONGBENH
(
	SoGiuongBenh INT,
	SoPhongBenh CHAR(10),
	TenKhoa CHAR(20), --- FK
	PRIMARY KEY (SoGiuongBenh)
)
GO

-- MACSYT
CREATE TABLE PHONGKHAM
(
	TenPhongKham INT,
	PRIMARY KEY (TenPhongKham)
)
GO

CREATE TABLE CHUYENNGANH
(
	MaChuyenNganh CHAR(10),
	TenChuyenNganh NVARCHAR(50),
	PRIMARY KEY (MaChuyenNganh)
)
GO
-- TenMucKHam

/*CREATE TABLE BHYT
(
	SoTheBHYT CHAR(10),
	PRIMARY KEY (SoTheBHYT)
)
GO

CREATE TABLE LOAIPHAUTHUAT
(
	MaPT CHAR(10),
	tenPT NVARCHAR(50),
	MucDo NVARCHAR (20),
	PRIMARY KEY (MaPT)
)
GO

-- DoiTuongXNCC
CREATE TABLE LOAIBENHAN
(
	MaLoaiBA CHAR(10),
	TenDoiTuong NVARCHAR(50),
	PRIMARY KEY (MaLoaiBA)
)
GO

CREATE TABLE SOBENHAN
(
	SoSoBA CHAR(10),
	MaLoaiBA CHAR(10), --FK
	PRIMARY KEY (SoSoBA)
)
GO

*/

CREATE TABLE PHIEUKHAM
(
	MaPhieuKham CHAR(10),
	MaBN CHAR(10),  -- FK
	MaNV CHAR(10),  -- FK
	SoPhongKham INT , -- FK
	SoTT INT IDENTITY(1,1) ,
	NgayKham DATE,
	DeNghiKham NVARCHAR(50),
	KetLuan NVARCHAR(50),
	HuongDieuTri NVARCHAR(50),
	PRIMARY KEY (MaPhieuKham)
)
GO


CREATE TABLE DONTHUOC
(
	SoDon CHAR(10),
	SoLuong INT,
	CachDung NVARCHAR(50),
	NgayKeDon DATE,
	MaThuoc CHAR(10), -- FK
	MaNV CHAR(10), --FK
	MaBN CHAR(10), --FK
	PRIMARY KEY (SoDon)
)
GO

CREATE TABLE PHIEUXETNGHIEM
(
	SoPhieuXN CHAR(10),
	NgayYeuCauXN DATE,
	NgayThucHienXN DATE,
	KetQuaXN NVARCHAR(50),
	MaNV CHAR(10), --FK
	MaBN CHAR(10), --FK
	PRIMARY KEY (SoPhieuXN)
)
GO

CREATE TABLE NGUOINHABENHNHAN
(
	MaNN CHAR(10),
	HoTenNN NVARCHAR(50),
	DiaChiNN NVARCHAR(50),
	DienThoaiNN NVARCHAR(20),
	MaBN CHAR(10), --FK
	PRIMARY KEY (MaNN)
)
GO


CREATE TABLE TheBHYT
(
	SoTheBHYT CHAR(10),
	MaBN CHAR(10),--FK
	NgayCap DATE,
	NgayHetHan DATE,
	PRIMARY KEY (SoTheBHYT)
)
GO

CREATE TABLE PHIEUDICHVU
(
	SoPhieuDV CHAR(10),
	NgayBatDau DATE,
	NgayKetThuc DATE,
	SoLuong INT,
	MaDV CHAR(10), --FK
	MaNV CHAR(10), --FK
	MaBN CHAR(10), --FK
	PRIMARY KEY (SoPhieuDV)
)
GO

CREATE TABLE PHIEUTHEODOI
(
	SoPhieuTD INT IDENTITY(1,1) PRIMARY KEY,
	NgayTheoDoi DATE,
	ChiSoCanNang CHAR(20),
	ChiSoHuyetAp CHAR(20),
	ChiSoNhipTho CHAR(20),
	Ylenh NVARCHAR(50),
	NgayThucHienYlenh DATE,
	ThucHienYlenh NVARCHAR(50),
	MaBenh CHAR(10), --FK
	MaNV CHAR(10), --FK
	MaBN CHAR(10), --FK
)
GO

CREATE TABLE PHIEUTKTHUOC
(
	SoPhieuTK CHAR(10),
	NgayDung DATE,
	SoLuong INT,
	MaThuoc CHAR(10), --FK
	MaNV CHAR(10), --FK
	MaBN CHAR(10), --FK
	PRIMARY KEY (SoPhieuTK)
)
GO


CREATE TABLE GIAYRAVIEN
(
	SoGiayRaVien CHAR(10),
	NgayVao DATE,
	NgayRa DATE,
	PhuongPhapDT NVARCHAR(20),
	KetQuaDT NVARCHAR(20),
	LoiKhuyenCuaBS NVARCHAR(20),
	MaBenh CHAR(10), -- FK
	TenKhoa CHAR(20), --FK
	MaNV CHAR(10), --FK
	MaBN CHAR(10), --FK
	PRIMARY KEY (SoGiayRaVien)
)
GO


-- tạo khóa ngoại
-- NHAN VIEN
ALTER TABLE NHANVIEN
	ADD CONSTRAINT FK_NHANVIEN
	FOREIGN KEY(TenKhoa)
	REFERENCES KHOA(TenKhoa)
	GO

ALTER TABLE NHANVIEN
	ADD CONSTRAINT FK_NHANVIEN1
	FOREIGN KEY(MaChuyennganh)
	REFERENCES CHUYENNGANH(MaChuyennganh)
	GO
--GIUONG BENH
ALTER TABLE GIUONGBENH
	ADD CONSTRAINT FK_GIUONGBENH
	FOREIGN KEY(TenKhoa)
	REFERENCES KHOA(TenKhoa)
	GO
--PHIEU KHAM
ALTER TABLE PHIEUKHAM
	ADD CONSTRAINT FK_PHIEUKHAM
	FOREIGN KEY(MaBN)
	REFERENCES BENHNHAN(MaBN)
	GO
ALTER TABLE PHIEUKHAM
	ADD CONSTRAINT FK_PHIEUKHAM1
	FOREIGN KEY(MaNV)
	REFERENCES NHANVIEN(MaNV)
	GO
ALTER TABLE PHIEUKHAM
	ADD CONSTRAINT FK_PHIEUKHAM2
	FOREIGN KEY(SoPhongKham)
	REFERENCES PHONGKHAM(TenPhongKham)
	GO

--THE BHYT
ALTER TABLE TheBHYT
	ADD CONSTRAINT FK_TheBHYT
	FOREIGN KEY(MaBN)
	REFERENCES BENHNHAN(MaBN)
	GO
/*
--BENH AN
ALTER TABLE SOBENHAN
	ADD CONSTRAINT FK_SOBENHAN
	FOREIGN KEY(MaLoaiBA)
	REFERENCES LOAIBENHAN(MaLoaiBA)
	GO
*/
--DON THUOC
ALTER TABLE DONTHUOC
	ADD CONSTRAINT FK_DONTHUOC
	FOREIGN KEY(MaThuoc)
	REFERENCES THUOC(MaThuoc)
	GO
ALTER TABLE DONTHUOC
	ADD CONSTRAINT FK_DONTHUOC1
	FOREIGN KEY(MaNV)
	REFERENCES NHANVIEN(MaNV)
	GO

ALTER TABLE DONTHUOC
	ADD CONSTRAINT FK_DONTHUOC2
	FOREIGN KEY(MaBN)
	REFERENCES BENHNHAN(MaBN)
	GO

-- PHIEU XET NGHIEM
ALTER TABLE PHIEUXETNGHIEM
	ADD CONSTRAINT FK_PHIEUXETNGHIEM
	FOREIGN KEY(MaNV)
	REFERENCES NHANVIEN(MaNV)
	GO

ALTER TABLE PHIEUXETNGHIEM
	ADD CONSTRAINT FK_PHIEUXETNGHIEM1
	FOREIGN KEY(MaBN)
	REFERENCES BENHNHAN(MaBN)
	GO

--NGUOI NHA BENH NHAN
ALTER TABLE NGUOINHABENHNHAN
	ADD CONSTRAINT FK_NGUOINHABENHNHAN
	FOREIGN KEY(MaBN)
	REFERENCES BENHNHAN(MaBN)
	GO

-- PHIEU DICH VU
ALTER TABLE PHIEUDICHVU
	ADD CONSTRAINT FK_PHIEUDICHVU
	FOREIGN KEY(MaBN)
	REFERENCES BENHNHAN(MaBN)
	GO
ALTER TABLE PHIEUDICHVU
	ADD CONSTRAINT FK_PHIEUDICHVU1
	FOREIGN KEY(MaNV)
	REFERENCES NHANVIEN(MaNV)
	GO
ALTER TABLE PHIEUDICHVU
	ADD CONSTRAINT FK_PHIEUDICHVU2
	FOREIGN KEY(MaDV)
	REFERENCES DICHVU(MaDV)
	GO

-- PHIEU THEO DOI
ALTER TABLE PHIEUTHEODOI
	ADD CONSTRAINT FK_PHIEUTHEODOI
	FOREIGN KEY(MaBenh)
	REFERENCES BENHLY(MaBenh)
	GO
ALTER TABLE PHIEUTHEODOI
	ADD CONSTRAINT FK_PHIEUTHEODOI1
	FOREIGN KEY(MaNV)
	REFERENCES NHANVIEN(MaNV)
	GO
ALTER TABLE PHIEUTHEODOI
	ADD CONSTRAINT FK_PHIEUTHEODOI2
	FOREIGN KEY(MaBN)
	REFERENCES BENHNHAN(MaBN)
	GO

-- PHIEU TK THUOC
ALTER TABLE PHIEUTKTHUOC
	ADD CONSTRAINT FK_PHIEUTKTHUOC
	FOREIGN KEY(MaThuoc)
	REFERENCES THUOC(MaThuoc)
	GO
ALTER TABLE PHIEUTKTHUOC
	ADD CONSTRAINT FK_PHIEUTKTHUOC1
	FOREIGN KEY(MaNV)
	REFERENCES NHANVIEN(MaNV)
	GO
ALTER TABLE PHIEUTKTHUOC
	ADD CONSTRAINT FK_PHIEUTKTHUOC2
	FOREIGN KEY(MaBN)
	REFERENCES BENHNHAN(MaBN)
	GO

-- GIAY RA VIEN
ALTER TABLE GIAYRAVIEN
	ADD CONSTRAINT FK_GIAYRAVIEN
	FOREIGN KEY(MaBenh)
	REFERENCES BENHLY(MaBenh)
	GO
ALTER TABLE GIAYRAVIEN
	ADD CONSTRAINT FK_GIAYRAVIEN1
	FOREIGN KEY(MaNV)
	REFERENCES NHANVIEN(MaNV)
	GO
ALTER TABLE GIAYRAVIEN
	ADD CONSTRAINT FK_GIAYRAVIEN2
	FOREIGN KEY(MaBN)
	REFERENCES BENHNHAN(MaBN)
	GO
ALTER TABLE GIAYRAVIEN
	ADD CONSTRAINT FK_GIAYRAVIEN3
	FOREIGN KEY(TenKhoa)
	REFERENCES KHOA(TenKhoa)
	GO

---- INSERT DATA

INSERT INTO CHUYENNGANH VALUES ('GAYME','Gây mê',NEWID())
INSERT INTO CHUYENNGANH VALUES ('CAPCUU','Cấp cứu',NEWID())
INSERT INTO CHUYENNGANH VALUES ('NOIKHOA','Nội khoa',NEWID())
INSERT INTO CHUYENNGANH VALUES ('NHIKHOA','Nhi khoa',NEWID())
INSERT INTO CHUYENNGANH VALUES ('HOISUC','Hồi sức',NEWID())
INSERT INTO CHUYENNGANH VALUES ('TAMTHAN','Tâm thần',NEWID())
INSERT INTO CHUYENNGANH VALUES ('CHINHHINH','Chỉnh hình',NEWID())

INSERT INTO KHOA VALUES ('HOISUCTICHCUC',NEWID())
INSERT INTO KHOA VALUES ('BENHLYHOC',NEWID())
INSERT INTO KHOA VALUES ('GAYME',NEWID())
INSERT INTO KHOA VALUES ('TAMTHAN',NEWID())
INSERT INTO KHOA VALUES ('NGOAINHI',NEWID())
INSERT INTO KHOA VALUES ('TAIMUIHONG',NEWID())
INSERT INTO KHOA VALUES ('SANPHUKHOA',NEWID())
INSERT INTO KHOA VALUES ('TIETNIEU',NEWID())

INSERT INTO NHANVIEN VALUES ('CH1',N'Dương Văn Hiếu',N'Giám đốc bệnh viện','SANPHUKHOA','NOIKHOA',NEWID())
INSERT INTO NHANVIEN VALUES ('BV1',N'Trần Trung Hiếu',N'Bảo Vệ','TAMTHAN','TAMTHAN',NEWID())
INSERT INTO NHANVIEN VALUES ('LC3',N'Trịnh Quang Tin',N'Lao Công','TIETNIEU','CHINHHINH',NEWID())

DELETE FROM NHANVIEN WHERE MaNV='CH2';

select * from NHANVIEN  ORDER BY HotenNV;
select * from KHOA

UPDATE NHANVIEN
SET ChucDanh = N'Lính Thủy Đánh Bộ'
WHERE HotenNV = N'Trần Trung Hiếu';