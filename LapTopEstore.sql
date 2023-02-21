

create database LapTopEstore
go

use LapTopEstore
go


create table HangSX(
	MaHang  varchar(30) primary key,
	TenHang nvarchar(30),
	DaXoa bit
)
go


create table LoaiSP(
	MaLoai varchar(30) primary key,
	TenLoai nvarchar(30),
	DaXoa bit
)
go

create table CauHinh(
	MaCH int identity(1,1) primary key,
	DoPhanGiai varchar(30),
	DoRong nvarchar(80),
	HeDH varchar(30),
	Chip nvarchar(70),
	Pin varchar(30),
	Ram varchar(30),
	Rom varchar(30),
	DaXoa bit
)
go

create table SanPham(
	MaSP int identity(1,1) primary key,
	TenSP nvarchar(100) ,
	SoLuong int,
	DonGia float,
	MoTa nvarchar(4000),
	TrangThai bit,
	MaHang varchar(30) references HangSX(MaHang),
	MaCH int references CauHinh(MaCH),
	MaLoai varchar(30) references LoaiSP(MaLoai),
	DaXoa bit

)
go

create table HinhAnh(
	MaHinh  int identity(1,1) primary key,
	MaSP int references SanPham(MaSP),
	HinhAnh varchar(50),
	DaXoa bit
)
go

create table VaiTro(
	Id varchar(20) primary key,
	TenVaiTro nvarchar(30)
)


create table KhachHang(
	TaiKhoan varchar(20) primary key,
	MatKhau varchar(20),
	HoTen nvarchar(40),
	Email varchar(40),
	SĐT varchar(15),
	DiaChi  nvarchar(200),
	DaXoa bit,
	VaiTroKH varchar(20) references VaiTro(Id)
)
go

create table NhanVien(
	TaiKhoan varchar(20) primary key,
	MatKhau varchar(20),
	HoTen nvarchar(40),
	Email varchar(20),
	SĐT varchar(15),
	DiaChi  nvarchar(200),
	NgaySinh date,
	DaXoa bit,
	VaiTroNV varchar(20) references VaiTro(Id)
)
go


create table BinhLuan(
	MaBL  int identity(1,1) primary key,
	TaiKhoan varchar(20) references KhachHang(TaiKhoan),
	MaSP int references SanPham(MaSP),
	NoiDung nvarchar(1000),
	NgayBL date
)
go


create table DonHang(
	MaDon int identity(1,1) primary key,
	MaKH varchar(20) references KhachHang(TaiKhoan),
	MaNV varchar(20) references NhanVien(TaiKhoan),
	NgayTao date,
	TongTien float,
	GhiChu nvarchar(255),
	TrangThai nvarchar(20),
	DaXoa bit
)
go


create table ChiTietDH(
	MaCTĐH int identity(1,1) primary key,
	MaDon int references DonHang(MaDon),
	MaSP int references SanPham(MaSP),
	DonGia float, 
	SoLuong int
)
go


/* hang sx*/
INSERT INTO HangSX VALUES (N'IP', N'Dell', 0)
INSERT INTO HangSX VALUES (N'SS', N'Asus', 0)
INSERT INTO HangSX VALUES (N'XM', N'Lenovo', 0)
INSERT INTO HangSX VALUES (N'OP', N'MSI', 0)
INSERT INTO HangSX  VALUES (N'VV', N'Acer', 0)
INSERT INTO HangSX VALUES (N'TN', N'HP', 0)
INSERT INTO HangSX VALUES (N'RM', N'LG', 0)

/* loai sp*/
INSERT [dbo].[LoaiSP] VALUES (N'DT', N'LapTop', 0)
INSERT [dbo].[LoaiSP] VALUES (N'PK', N'Phụ Kiện', 0)


/* cau hinh (8) */
-- Dell (19)
INSERT [dbo].[CauHinh]  VALUES (N'1200 x 1920 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits, Anti - Glare', N'Window 11', N'
Intel, Core i5, 1240P', N'3420 mHz', N'	16 GB', N'512GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 x 1080 pixels', N'15.6 inch WVA, 60 Hz, 220 nits,', N'Window 11', N'Intel, Core i5, 1135G7', N'3200 MHz', N'8GB', N'512GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 x 1080 pixels', N'15.6 inch WVA, 120 Hz, 250 nits', N'Window 11 ', N'Intel, Core i5, 1135G7', N'1821 mHz', N'16GB', N'64GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch Chính', N'Window 11', N'
NVIDIA GeForce RTX 3050 4GB', N'3100 mHz', N'16GB', N'512GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch', N'Window 11', N'Intel, Core i5 1240P', N'1810 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch', N'Window 11', N'Intel, Core i5 1240P', N'3110 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch', N'Window 11', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'14.0 inch', N'Window 11', N'
Intel, Core i5, 1235U', N'2815 mHz', N'4GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch Chính', N'Window 11', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'Window 11', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'Window 11', N'Intel, Core i5 1240P', N'3210 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'Window 11', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'Window 11', N'Intel, Core i5 1240P', N'3210 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'Window 11', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'Window 11', N'Intel, Core i5 1240P', N'3210 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'Window 11', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'Window 11', N'Intel, Core i5 1240P', N'3210 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'Window 11', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'Window 11', N'Intel, Core i5 1240P', N'3210 mHz', N'8GB', N'128GB', 0)



-- Asus (18)
INSERT [dbo].[CauHinh]  VALUES (N'1200 x 1920 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits, Anti - Glare', N'WinDow 10', N'
Intel, Core i5, 1240P', N'3420 mHz', N'	16 GB', N'512GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 x 1080 pixels', N'15.6 inch WVA, 60 Hz, 220 nits,', N'WinDow 10', N'Intel, Core i5, 1135G7', N'3200 MHz', N'8GB', N'512GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 x 1080 pixels', N'15.6 inch WVA, 120 Hz, 250 nits', N'WinDow 10 ', N'Intel, Core i5, 1135G7', N'1821 mHz', N'16GB', N'64GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch Chính', N'WinDow 10', N'
NVIDIA GeForce RTX 3050 4GB', N'3100 mHz', N'16GB', N'512GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch', N'WinDow 10', N'Intel, Core i5 1240P', N'1810 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch', N'WinDow 10', N'Intel, Core i5 1240P', N'3110 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'14.0 inch', N'WinDow 10', N'
Intel, Core i5, 1235U', N'2815 mHz', N'4GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch Chính', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)




-- LENOVO (21)
INSERT [dbo].[CauHinh]  VALUES (N'1200 x 1920 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits, Anti - Glare', N'WinDow 10', N'
Intel, Core i5, 1240P', N'3420 mHz', N'	16 GB', N'512GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 x 1080 pixels', N'15.6 inch WVA, 60 Hz, 220 nits,', N'WinDow 10', N'Intel, Core i5, 1135G7', N'3200 MHz', N'8GB', N'512GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 x 1080 pixels', N'15.6 inch WVA, 120 Hz, 250 nits', N'WinDow 10 ', N'Intel, Core i5, 1135G7', N'1821 mHz', N'16GB', N'64GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch Chính', N'WinDow 10', N'
NVIDIA GeForce RTX 3050 4GB', N'3100 mHz', N'16GB', N'512GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch', N'WinDow 10', N'Intel, Core i5 1240P', N'1810 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch', N'WinDow 10', N'Intel, Core i5 1240P', N'3110 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'14.0 inch', N'WinDow 10', N'
Intel, Core i5, 1235U', N'2815 mHz', N'4GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch Chính', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)



-- MSI (25)
INSERT [dbo].[CauHinh]  VALUES (N'1200 x 1920 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits, Anti - Glare', N'WinDow 10', N'
Intel, Core i5, 1240P', N'3420 mHz', N'	16 GB', N'512GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 x 1080 pixels', N'15.6 inch WVA, 60 Hz, 220 nits,', N'WinDow 10', N'Intel, Core i5, 1135G7', N'3200 MHz', N'8GB', N'512GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 x 1080 pixels', N'15.6 inch WVA, 120 Hz, 250 nits', N'WinDow 10 ', N'Intel, Core i5, 1135G7', N'1821 mHz', N'16GB', N'64GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch Chính', N'WinDow 10', N'
NVIDIA GeForce RTX 3050 4GB', N'3100 mHz', N'16GB', N'512GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch', N'WinDow 10', N'Intel, Core i5 1240P', N'1810 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch', N'WinDow 10', N'Intel, Core i5 1240P', N'3110 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'14.0 inch', N'WinDow 10', N'
Intel, Core i5, 1235U', N'2815 mHz', N'4GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch Chính', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'WinDow 10', N'Intel, Core i5 1240P', N'3210 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'Window 11', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'Window 11', N'Intel, Core i5 1240P', N'3210 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'Window 11', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'Window 11', N'Intel, Core i5 1240P', N'3210 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'Window 11', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'Window 11', N'Intel, Core i5 1240P', N'3210 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'Window 11', N'Intel, Core i5 1240P', N'3210 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits', N'Window 11', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)

-- ACER (9)
INSERT [dbo].[CauHinh]  VALUES (N'1200 x 1920 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits, Anti - Glare', N'Window 11', N'
Intel, Core i5, 1240P', N'3420 mHz', N'	16 GB', N'512GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 x 1080 pixels', N'15.6 inch WVA, 60 Hz, 220 nits,', N'Window 11', N'Intel, Core i5, 1135G7', N'3200 MHz', N'8GB', N'512GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 x 1080 pixels', N'15.6 inch WVA, 120 Hz, 250 nits', N'Window 11 ', N'Intel, Core i5, 1135G7', N'1821 mHz', N'16GB', N'64GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch Chính', N'Window 11', N'
NVIDIA GeForce RTX 3050 4GB', N'3100 mHz', N'16GB', N'512GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch', N'Window 11', N'Intel, Core i5 1240P', N'1810 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch', N'Window 11', N'Intel, Core i5 1240P', N'3110 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch', N'Window 11', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'14.0 inch', N'Window 11', N'
Intel, Core i5, 1235U', N'2815 mHz', N'4GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch Chính', N'Window 11', N'Intel, Core i5 1240P', N'3210 mHz', N'16GB', N'128GB', 0)



-- HP (6)
INSERT [dbo].[CauHinh]  VALUES (N'1200 x 1920 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits, Anti - Glare', N'Window 11', N'
Intel, Core i5, 1240P', N'3420 mHz', N'	16 GB', N'512GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 x 1080 pixels', N'15.6 inch WVA, 60 Hz, 220 nits,', N'Window 11', N'Intel, Core i5, 1135G7', N'3200 MHz', N'8GB', N'512GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 x 1080 pixels', N'15.6 inch WVA, 120 Hz, 250 nits', N'Window 11 ', N'Intel, Core i5, 1135G7', N'1821 mHz', N'16GB', N'64GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch Chính', N'Window 11', N'
NVIDIA GeForce RTX 3050 4GB', N'3100 mHz', N'16GB', N'512GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch', N'Window 11', N'Intel, Core i5 1240P', N'1810 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch', N'Window 11', N'Intel, Core i5 1240P', N'3110 mHz', N'8GB', N'128GB', 0)






-- LG (12)
INSERT [dbo].[CauHinh]  VALUES (N'1200 x 1920 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits, Anti - Glare', N'Window 11', N'
Intel, Core i5, 1240P', N'3420 mHz', N'	16 GB', N'512GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 x 1080 pixels', N'15.6 inch WVA, 60 Hz, 220 nits,', N'Window 11', N'Intel, Core i5, 1135G7', N'3200 MHz', N'8GB', N'512GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 x 1080 pixels', N'15.6 inch WVA, 120 Hz, 250 nits', N'Window 11 ', N'Intel, Core i5, 1135G7', N'1821 mHz', N'16GB', N'64GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch Chính', N'Window 11', N'
NVIDIA GeForce RTX 3050 4GB', N'3100 mHz', N'16GB', N'512GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch', N'Window 11', N'Intel, Core i5 1240P', N'1810 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch', N'Window 11', N'Intel, Core i5 1240P', N'3110 mHz', N'8GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1200 x 1920 pixels', N'16.0 inch, WVA, 60 Hz", 250 nits, Anti - Glare', N'Window 11', N'
Intel, Core i5, 1240P', N'3420 mHz', N'	16 GB', N'512GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 x 1080 pixels', N'15.6 inch WVA, 60 Hz, 220 nits,', N'Window 11', N'Intel, Core i5, 1135G7', N'3200 MHz', N'8GB', N'512GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 x 1080 pixels', N'15.6 inch WVA, 120 Hz, 250 nits', N'Window 11 ', N'Intel, Core i5, 1135G7', N'1821 mHz', N'16GB', N'64GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch Chính', N'Window 11', N'
NVIDIA GeForce RTX 3050 4GB', N'3100 mHz', N'16GB', N'512GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch', N'Window 11', N'Intel, Core i5 1240P', N'1810 mHz', N'16GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1920 × 1080 pixels', N'15.6 inch', N'Window 11', N'Intel, Core i5 1240P', N'3110 mHz', N'8GB', N'128GB', 0)





-- Phu kien (25)
INSERT [dbo].[CauHinh]  VALUES (N'720 x 1600 pixels', N'6.5 inches', N'Android 8', N'Qualcomm SDM665 Snapdragon 665', N'5000 mAh', N'3GB', N'64GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'720 x 1520 pixels', N'IPS, 6.2 inch', N'Android 8.1 (Oreo)', N'Snapdragon 450 (14 nm)', N'4230 mAh', N'3GB', N'64GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'720 x 1600 pixels', N'6.52" - Tần số quét 60 Hz', N'Android 9', N'MediaTek Helio P35 8 nhân', N'4230 mAh', N'3GB', N'64GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'720 x 1600 pixels', N'6.52" - Tần số quét 60 Hz', N'Android 9', N'MediaTek Helio P35 8 nhân', N'4230 mAh', N'3GB', N'32GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'720 x 1600 pixels', N'IPS LCD 6.5 inch', N'Android 9', N'Mediatek MT6765V/CB Helio P35', N'4230 mAh', N'6GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1080 x 2400 pixels', N'6.5 inch, IPS LCD', N'Android 10', N'Snapdragon 665', N'5000 mAh', N'6GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1080 x 2400 pixels', N'6.5 inch, HD+, IPS LCD', N'Android 10', N'Snapdragon 460 (11 nm)', N'5000 mAh', N'4GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'700 x 1600 pixels', N'6.5" - Tần số quét 60 Hz', N'Android 10', N'MediaTek Helio G35 8 nhân', N'5000 mAh', N'4GB', N'64GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1080 x 2400 pixels', N'6.5 inch, IPS LCD', N'Android 10', N'Snapdragon 665', N'5000 mAh', N'4GB', N'128GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1080 x 2400 pixels', N'IPS LCD, 5.7", HD+', N'Android 10', N'Mediatek MT6763T Helio P23', N'3180 mAh', N'3GB', N'32GB', 0)
INSERT [dbo].[CauHinh]  VALUES (N'1080 x 2400 pixels', N'AMOLED, 6.4", Full HD+', N'Android 9.0 (Pie)', N'Mediatek Helio P70 (12nm)', N'4025 mAh', N'8GB', N'128GB', 0)




/* san pham*/

-- Dell (19) 
INSERT [dbo].[SanPham] VALUES ( N'Laptop Dell Inspiron 16 N5620 i5 1240P/16GB/512GB/16.0"FHD/GeForce MX570 2GB/Win 11', 100, 50000000, N' Dell Inspiron 16 5620 i5 1240P là một chiếc laptop đồ họa vô cùng mạnh mẽ với chip xử lý Intel thế hệ thứ 12 kết hợp 16GB RAM tốc độ cao và card rời GeForce MX570. Máy tính xách tay cũng có màn hình lớn, kiểu dáng mỏng nhẹ và đa dạng cổng kết nối tích hợp.
Hiện đại, tính di động cao ', 1, N'IP', 1, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Dell Vostro V3510 i5 1135G7/8GB/512GB/15.6FHD/MX350 2GB/Win 11+Office HS21', 100, 17900000, N' Dell Vostro 3510 là phiên bản laptop doanh nhân 15,6 inch mới nhất từ Dell, với thiết kế gọn gàng thanh thoát và hiện đại, đồng thời hiệu suất được nâng cấp đáng kể nhờ bộ vi xử lý Intel Core i5 thế hệ thứ 11 cùng card đồ họa rời NVIDIA MX350, giúp cho công việc của bạn luôn hoạt động hiệu quả và an toàn. ', 1, N'IP', 2, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Dell Gaming V3510 i5 1135G7/8GB/512GB/15.6FHD/MX350 2GB/Win 11+Office HS21', 100, 17900000, N' Dell Vostro 3510 là phiên bản laptop doanh nhân 15,6 inch mới nhất từ Dell, với thiết kế gọn gàng thanh thoát và hiện đại, đồng thời hiệu suất được nâng cấp đáng kể nhờ bộ vi xử lý Intel Core i5 thế hệ thứ 11 cùng card đồ họa rời NVIDIA MX350, giúp cho công việc của bạn luôn hoạt động hiệu quả và an toàn. ', 1, N'IP', 3, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Dell Vostro V5410 i5 11320H/8GB/512GB/14.0"FHD/Win 11+Office HS21', 100, 9590000, N'Mẫu laptop doanh nhân Dell Vostro 5410 phiên bản mới được nâng cấp lên bộ vi xử lý Intel Core i5 11320H cực mạnh, vẫn trong một thiết kế nhỏ gọn, cao cấp và tinh tế.', 1, N'IP', 4, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Dell Vostro V5320 i7 1260P/16GB/512GB/13.3"FHD+/Win 11', 100, 11650000, N'Dell Vostro 5320 gói gọn tốc độ và sức mạnh hàng đầu trong một chiếc laptop thời trang, kiểu dáng bắt mắt, siêu mỏng nhẹ. Mọi trải nghiệm trên Dell Vostro V5320 đều diễn ra hoàn hảo, từ hiệu năng, khả năng phản hồi, thời lượng pin cho đến màn hình tuyệt đẹp.', 1, N'IP', 5, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Dell Inspiron 14 N5420 i5 1235U/8GB/256GB/14.0" FHD/Win 11+Office HS 21', 100, 25890000, N'Dell Inspiron 14 N5420 là mẫu laptop cao cấp mới nhất thuộc dòng Inspiron với điểm nhấn từ bộ vi xử lý Intel thế hệ thứ 12 Alder Lake, màn hình tỉ lệ 16:10 rộng hơn và một thiết kế đầy sang trọng.', 1, N'IP', 6, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Dell Vostro V5620 i5 1240P/8GB/512GB/16" FHD+/GeForce MX570 2GB/Win 11', 100, 27490000, N'Với màn hình lớn tới 16 inch, bạn sẽ có thêm nhiều không gian hiển thị hơn để làm việc, giải trí trên Dell Vostro V5620. Ngoài ra chiếc laptop này còn trang bị cấu hình đáng kinh ngạc với bộ vi xử lý Intel thế hệ thứ 12 hàng đầu, card đồ họa rời và hơn thế nữa.', 1, N'IP', 7, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Dell Latitude L5420CTO i5 1135G7/8GB/256GB/14"FHD/Win 11', 100, 19690000, N'Dell Latitude L5420CTO tập hợp những ưu điểm mà người dùng yêu thích ở laptop Dell như chất lượng hoàn thiện tốt, độ bền cao, hiệu năng xuất sắc. Bên cạnh đó, chiếc máy tính này còn trang bị loạt tính năng thông minh đến từ tương lai, cho người dùng trải nghiệm vô cùng mới mẻ.', 1, N'IP', 8, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Dell Gaming G15 5511 i5 11400H/8GB/256GB/15.6"FHD/GeForce RTX 3050 4GB/Win 11/Office HS21', 100, 16690000, N'Thiết kế cá tính, cấu hình mạnh mẽ và giá bán dễ chịu, Dell Gaming G15 5511 hội tụ tất cả những điều khiến các game thủ thích thú.', 1, N'IP', 9, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Dell XPS 15 9520 i9 12900HK/16GB/512GB/15.6" OLED 3.5K Touch/GeForce RTX 3050 Ti 4GB/Win11', 100, 23890000, N'Hiệu suất hoàn hảo cho công việc chuyên nghiệp, màn hình 3.5K OLED siêu sống động và một thiết kế đẳng cấp đến từng đường nét, Dell XPS 15 9520 là chiếc laptop sinh ra để mang đến sự thành công cho bạn.', 1, N'IP', 10, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Dell XPS 13 9320 i5 1240P/16GB/512GB SSD/13.4" OLED 3.5K Touch/Win 11', 100, 36990000, N'Dell XPS 13 Plus 9320 mang trên mình vẻ đẹp mê hoặc mà bạn chưa từng thấy ở bất kỳ chiếc laptop nào trước đây. Một chiếc laptop không giới hạn với màn hình tràn viền, bàn phím tràn cạnh và hiệu suất vượt xa khỏi kỳ vọng của dòng UltraBook siêu mỏng nhẹ.', 1, N'IP', 11, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Dell Vostro 3400 i5 1135G7/8GB/512GB/2GB MX330/OfficeHS/Win11 (YX51W6)', 100, 18790000, N'Nếu bạn đang muốn sở hữu cho mình một chiếc laptop đáp ứng tốt các nhu cầu học tập và làm việc của bạn nhờ chip thế hệ 11 mạnh mẽ cùng phần mềm Office Home & Student vĩnh viễn tiện lợi với một mức giá hợp lý, laptop Dell Vostro 3400 i5 (YX51W6) sẽ là sự lựa chọn sáng giá sẵn sàng đồng hành cùng bạn.', 1, N'IP', 12, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Dell Inspiron 14 5420 i5 1235U/8GB/256GB/OfficeHS/Win11 (P157G001ASL) ', 100, 19350000, N'Laptop Dell Inspiron 14 5420 i5 (P157G001ASL) đáng để bạn cân nhắc sở hữu trong phân khúc laptop học tập - văn phòng khi sở hữu sức mạnh hiệu năng đến từ bộ vi xử lý Intel Gen 12 tân tiến cùng ngoại hình thanh lịch, phù hợp để đồng hành cùng bạn ở mọi nơi.
Hiệu năng ổn định, dễ dàng cân mọi tác vụ văn phòng
Laptop Dell Inspiron mang trong mình sức mạnh đến từ bộ vi xử lý Intel Core i5 - 1235U tân tiến cùng card tích hợp Intel UHD Graphics, có khả năng xử lý mượt mà những tác vụ văn phòng từ cơ bản đến nâng cao và chỉnh sửa hình ảnh 2D trên các ứng dụng như Photoshop, Figma, Canva,... ', 1, N'IP', 13, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Dell Inspiron 15 3511 i5 1135G7/8GB/512GB/2GB MX350/Office H&S/Win11 (70270650) ', 100, 23890000, N'Dell Inspiron 15 3511 i5 (70270650) định hướng vào phân khúc laptop tầm trung, phục vụ chủ yếu cho nhu cầu laptop học tập - văn phòng, nhưng nhờ sở hữu một cấu hình khá tốt, góp mặt của chip Intel thế hệ 11 và card rời nhà NVIDIA mang đến khả năng xử lý tốt trên cả các tác vụ đồ họa và chơi game giải trí.
Thiết kế thanh lịch, sang đẹp
Dell Inspiron 15 có lớp vỏ ngoài bằng nhựa tông màu bạc thanh lịch, hiện đại, thiết kế tinh tế, bản lề nâng lên một góc nghiêng nhẹ tăng khả năng tản nhiệt và hỗ trợ thao tác bàn phím tốt hơn. Khối lượng máy 1.73 kg, độ dày 19 mm không quá khó để mang theo trong balo, túi xách cho hành trang di chuyển làm việc, học tập thường nhật.', 1, N'IP', 14, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Dell XPS 13 Plus 9320 i7 1260P/16GB/512GB/Touch/Cáp/OfficeHS/Win11 (5CG56) ', 100, 27150000, N'Dell đã gây sốc cho một người dùng trải nghiệm nhiều loại máy tính lâu năm như mình sau khi cầm trên tay mẫu laptop Dell XPS 13 Plus 9320 i7 (5CG56) với thiết kế khác lạ, sự hiện đại áp đảo hoàn toàn những mẫu laptop cao cấp đang có mặt trên thị trường.', 1, N'IP', 15, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Dell Inspiron 15 3520 i5 1235U/8GB/512GB/120Hz/OfficeHS/Win11 (i5U085W11BLU) ', 100, 20550000, N'Laptop Dell Inspiron 16 5620 (i5P165W11SLU) - một tân binh mới trong phân khúc laptop học tập - văn phòng hứa hẹn sẽ không làm người dùng thất vọng khi sở hữu những thông số mạnh mẽ như chip Intel Gen 12, màn hình lớn cùng thiết kế thanh lịch, sang trọng. ', 1, N'IP', 16, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Dell Inspiron 16 5620 i5 1240P/16GB/512GB/OfficeHS/Win11 (i5P165W11SLU) ', 100, 24990000, N'Về thiết kế, Laptop Dell 256GB không có gì khác biệt so với LapTop được phát hành vào năm 2021. Với khung nhôm bao quanh để đảm bảo an toàn cho chiếc LapTop và có mặt  ', 1, N'IP', 17, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Dell Gaming 13 9310 i5 1135G7/8GB/512GB/Cáp/Office H&S/Win11 (70273578)', 100, 45790000, N'Laptop Dell XPS 13 9310 i5 1135G7 (70273578) sở hữu thiết kế hiện đại với màu bạc thời thượng cùng hiệu năng mạnh mẽ, xứng danh bạn đồng hành đắc lực trên mọi mặt trận.', 1, N'IP', 18, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Dell XPS 13 9310 i5 1135G7/8GB/512GB/Cáp/Office H&S/Win11 (70273578)', 100, 45790000, N'Laptop Dell XPS 13 9310 i5 1135G7 (70273578) sở hữu thiết kế hiện đại với màu bạc thời thượng cùng hiệu năng mạnh mẽ, xứng danh bạn đồng hành đắc lực trên mọi mặt trận.', 1, N'IP', 19, N'DT', 0)

-- Asus (18) 
INSERT [dbo].[SanPham] VALUES ( N'Laptop Asus TUF Gaming F15 FX506LHB i5 10300H/8GB/512GB/4GB GTX1650/144Hz/Win11 (HN188W)', 100, 6990000, N'Nếu bạn đang tìm kiếm một chiếc laptop gaming nhưng vẫn sở hữu một mức giá phải chăng thì laptop Asus TUF Gaming F15 FX506LHB i5 (HN188W) sẽ là sự lựa chọn đáng cân nhắc với card đồ họa rời NVIDIA GeForce GTX mạnh mẽ cùng phong cách thiết kế cứng cáp, độc đáo.', 1, N'SS', 20, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Asus VivoBook 15X OLED A1503ZA i5 12500H/8GB/512GB/Win11 (L1290W)', 100, 5190000, N'Laptop Asus VivoBook 15X OLED A1503ZA i5 (L1290W) là phiên bản laptop cao cấp - sang trọng không chỉ giải quyết triệt để các tác vụ học tập, văn phòng nhờ sức mạnh bùng nổ đến từ bộ vi xử lý Intel thế hệ 12 mà còn mang đến không gian giải trí trọn vẹn khi sở hữu những thông số màn hình ấn tượng. ', 1, N'SS', 21, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Asus ZenBook UX325EA i7 1165G7/16GB/512GB/Cáp/Túi/Win11 (KG658W) ', 100, 3390000, N'Chiêm ngưỡng sự đẳng cấp đến từ laptop Asus ZenBook UX325EA i7 (KG658W) với cấu hình vượt trội cùng diện mạo cao cấp, hứa hẹn mang đến những trải nghiệm độc đáo, đáp ứng mọi nhu cầu sử dụng của người dùng.', 1, N'SS', 22, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Asus Gaming TUF Dash F15 FX517ZC i5 12450H/8GB/512GB/4GB RTX3050/144Hz/Win11 (HN077W) ', 100, 3990000, N'Sở hữu ngoại hình ấn tượng thu hút mọi ánh nhìn cùng hiệu năng mạnh mẽ đến từ laptop CPU thế hệ 12 mới nhất, Asus Gaming TUF Dash F15 FX517ZC i5 (HN077W) là lựa chọn xứng tầm cho mọi nhu cầu chiến game giải trí hay đồ hoạ - kỹ thuật của người dùng.', 1, N'SS', 23, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Asus TUF Gaming F15 FX506HC i5 11400H/8GB/512GB/4GB RTX3050/144Hz/Win11 (HN144W)', 100, 2300000, N'Laptop Asus TUF Gaming F15 FX506HC i5 (HN144W) với CPU Intel dòng H và card rời RTX 30 series, thiết kế độc đáo cùng khả năng chiến tốt các tựa game hiện hành là sự lựa chọn phù hợp cho bạn. ', 1, N'SS', 24, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Asus Vivobook 15 X1502ZA i5 1240P/8GB/512GB/Win11 (EJ120W)', 100, 3990000, N'Với mức giá chưa đầy 18 triệu mà sở hữu cấu hình mạnh ngang với các dòng máy mỏng nhẹ, cao cấp? Không cần nghi ngờ hay tìm kiếm đâu xa, mình sẽ chứng minh ngay trên chiếc laptop Asus Vivobook 15 X1502ZA i5 (EJ120W) này với con chIP Gen 12 mới nhất đến từ nhà Intel.', 1, N'SS', 25, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Asus VivoBook A415EA i5 1135G7/8GB/512GB/Win11 (AM1637W)', 100, 3750000, N'Một trong những chiếc laptop mà mình đánh giá là khá phù hợp với tất cả các yêu cầu trong phân khúc laptop học tập - văn phòng chính là Asus VivoBook A415EA i5 (AM1637W) khi sở hữu con chIP Intel Gen 11 mạnh mẽ cùng một mức giá lý tưởng cho mọi đối tượng người dùng. ', 1, N'SS', 26, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Asus Gaming ROG Strix G15 G513IH R7 4800H/8GB/512GB/4GB GTX1650/144Hz/Win11 (HN015W)', 100, 5390000, N'Laptop Asus Gaming ROG Strix G15 G513IH R7 (HN015W) là một trợ thủ đắc lực cho mọi game thủ chuyên nghiệp với phong cách thiết kế vô cùng độc đáo, ấn tượng chuẩn gaming cùng bộ cấu hình đầy mạnh mẽ. ', 1, N'SS', 27, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Asus VivoBook X415EA i3 1115G4/4GB/512GB/Win11 (EK1386W) ', 100, 1190000, N'Một trong những chiếc laptop mà mình đánh giá là khá phù hợp với tất cả các yêu cầu trong phân khúc laptop học tập - văn phòng chính là Asus VivoBook A415EA i3 1115G4/4GB/512GB/Win11 (EK1386W) khi sở hữu con chIP Intel Gen 11 mạnh mẽ cùng một mức giá lý tưởng cho mọi đối tượng người dùng. ', 1, N'SS', 28, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Asus Gaming TUF Dash F15 FX517ZM i7 12650H/8GB/512GB/6GB RTX3060/144Hz/Win11 (HN480W) ', 100, 6250000, N'Laptop Asus TUF Gaming FX517ZM i7 (HN480W) sẵn sàng cùng bạn đương đầu trên mọi chiến trường khi sở hữu những thông số kỹ thuật mạnh mẽ đến từ bộ vi xử lý Intel Gen 12, card rời RTX 3060 6 GB, màn hình 144 Hz,... cùng ngoại hình hầm hố chuẩn gaming.', 1, N'SS', 29, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Asus TUF Gaming F15 FX506HM i7 11800H/8GB/512GB/6GB RTX3060/144Hz/Win11 (HN366W)', 100, 8390000, N'Laptop Asus TUF Gaming FX506HM i7 (HN366W) theo trải nghiệm của mình là một trong những chiếc laptop gaming đáng sắm nhất, sự kết hợp giữa sức mạnh bộc phá đến từ bộ vi xử lý Intel Gen 12 và card rời NVIDIA xứng danh trợ thủ đắc lực cho mọi game thủ, người dùng sáng tạo đồ hoạ - kỹ thuật.', 1, N'SS', 30, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Asus Zenbook 14 OLED UX3402ZA i7 1260P/16GB/512GB/Cáp/Win11 (KM221W)', 100, 7390000, N'Laptop Asus Zenbook 14 OLED UX3402ZA i7 (KM221W) sở hữu ngoại hình thanh lịch, màn hình OLED 2.8K tỷ lệ 16:10 và bộ vi xử lý Intel Core i7 thế hệ thứ 12 mạnh mẽ, xứng danh một chiếc laptop học tập - văn phòng cùng mình chinh chiến trong suốt quãng đường đại học. ', 1, N'SS', 31, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Asus Vivobook Pro 15 OLED K6502Z i5 12450H/16GB/512GB/4GB RTX3050/120Hz/Win11 (MA025W) ', 100, 9690000, N'Một tân binh thuộc phân khúc laptop cao cấp - sang trọng được nhà Asus cho ra mắt để phục vụ tối đa mọi tác vụ từ cơ bản đến nâng cao cho dân văn phòng hay doanh nhân khi sở hữu những thông số mạnh mẽ từ cấu hình, màn hình,... chính là chiếc laptop Asus Vivobook Pro 15 K6502Z i5 12450H (MA025W). ', 1, N'SS', 32, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Asus TUF Gaming F15 FX507ZE i7 12700H/8GB/512GB/4GB RTX3050Ti/144Hz/Win11 (HN093W) ', 100, 4690000, N'Laptop Asus TUF Gaming F15 FX507ZE i7 (HN093W) là thế hệ laptop gaming mới mang trên mình những đột phá về thiết kế cũng như hiệu năng, xứng danh trợ thủ đắc lực cho mọi game thủ, người dùng sáng tạo đồ hoạ - kỹ thuật.', 1, N'SS', 33, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Asus TUF Gaming F15 FX507ZC i7 12700H/8GB/512GB/4GB RTX3050/144Hz/Win11 (HN124W) ', 100, 18490000, N'Laptop Asus TUF Gaming F15 FX507ZC i7 (HN124W) cực chất cùng hiệu năng mạnh mẽ từ CPU Intel thế hệ 12, thiết kế thời thượng sẵn sàng thách thức chinh phục ở mọi đấu trường ảo.', 1, N'SS', 34, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Asus Gaming TUF Dash F15 FX517ZE i5 12450H/8GB/512GB/4GB RTX3050Ti/144Hz/Win11 (HN045W)', 100, 24490000, N'Laptop Asus Gaming TUF Dash F15 FX517ZE i5 (HN045W) không chỉ cùng mình chinh phục mọi đấu trường ảo nhờ bộ vi xử lý Intel Gen 12 và card đồ họa rời NVIDIA GeForce RTX 3050 Ti 4 GB mà còn là một chiếc laptop đồ họa - kỹ thuật lý tưởng, sẵn sàng hỗ trợ mình xử lý mọi công việc.', 1, N'SS', 35, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Asus Gaming ROG Strix G15 G513RC R7 6800H/8GB/512GB/4GB RTX3050/144Hz/Win11 (HN038W)', 100, 19990000, N'Laptop Asus Gaming ROG Strix G15 G513RC R7 (HN038W) là một đối thủ đáng gờm trong phân khúc laptop gaming khi trang bị cho mình bộ vi xử lý AMD Ryzen 7 mạnh mẽ cùng card rời RTX 3050 4 GB, luôn sẵn sàng cùng mình đương đầu mọi thử thách.', 1, N'SS', 36, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Asus Zenbook 14 OLED UX3402ZA i5 1240P/8GB/512GB/90Hz/Cáp/Túi/Win11 (KM220W)', 100, 32490000, N'Laptop Asus Zenbook 14 OLED UX3402ZA i5 (KM218W) sẽ chinh phục mọi người dùng từ sinh viên, dân văn phòng cho đến những doanh nhân kỹ tính. Một chiếc laptop cao cấp - sang trọng đầy mạnh mẽ, sẵn sàng cùng bạn đương đầu mọi khó khăn. ', 1, N'SS', 37, N'DT', 0)


-- LenoVo (21) 
INSERT [dbo].[SanPham] VALUES ( N'Laptop Lenovo Ideapad 3 15IAU7 i3 1215U/8GB/256GB/Win11 (82RK005LVN) ', 100, 8290000, N'Laptop Lenovo Ideapad 3 15IAU7 i3 (82RK005LVN) sẽ là một người bạn đồng hành đắc lực cho các bạn học sinh, sinh viên hay dân văn phòng với ngoại hình thanh lịch, hiện đại cùng hiệu năng mạnh mẽ đến từ con chIP Intel Gen 12 tân tiến. ', 1, N'XM', 38, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Lenovo Ideapad 3 15IAU7 i5 1235U/8GB/512GB/Win11 (82RK001PVN)', 100, 11090000, N'Laptop Lenovo Ideapad 3 15IAU7 i5 1235U (82RK001PVN) không chỉ sở hữu thiết kế đẹp mắt mà còn được trang bị thông số kỹ thuật ấn tượng như bộ vi xử lý Intel Gen 12 cho hiệu năng mạnh mẽ, đáp ứng đầy đủ mọi nhu cầu học tập và văn phòng của người dùng.', 1, N'XM', 39, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Lenovo Yoga Duet 7 13ITL6 i7 1165G7/16GB/1TB SSD/Touch/Pen/Win10 (82MA003UVN)', 100, 19990000, N'Laptop Lenovo Yoga Duet 7 13ITL6 i7 (82MA003UVN) là sự kết hợp hoàn hảo giữa một chiếc máy tính Windows và Tablet từ đó mang đến một siêu phẩm có thiết kế cơ động, nhỏ gọn cùng hiệu năng mạnh mẽ, phù hợp cho mọi tác vụ giải trí, sáng tạo nội dung với bút cảm ứng Digital Pen tặng kèm.', 1, N'XM', 40, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Lenovo Ideapad 5 15ITL05 i5 1135G7/8GB/512GB/Win11 (82FG01H7VN) ', 100, 27990000, N'Thiết kế đơn giản, cấu hình ổn định cho các tác vụ làm việc hằng ngày và màn hình đáp ứng tốt nhu cầu giải trí là những thứ mình cần khi lựa chọn một em laptop học tập - văn phòng, thật may là chiếc laptop Lenovo Ideapad 5 15ITL05 i5 (82FG01H7VN) này hoàn toàn có thể đáp ứng được điều đó.', 1, N'XM', 41, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Lenovo Ideapad 3 15ITL6 i3 1115G4/8GB/256GB/Win11 (82H8005CVN)', 100, 6990000, N'Laptop Lenovo Ideapad 3 15ITL6 i3 (82H8005CVN) sở hữu thiết kế đơn giản, thanh lịch, sức mạnh hiệu năng tốt từ chip Intel thế hệ 11, thoải mái sử dụng cho nhu cầu của một chiếc laptop học tập - văn phòng và giải trí đơn giản, một lựa chọn vừa túi tiền dành cho bạn.', 1, N'XM', 42, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Lenovo ThinkBook 14 G3 ACL R5 5500U/8GB/512GB/Win11 (21A200CPVN)', 100, 8450000, N'Laptop Lenovo ThinkBook 14 G3 ACL R5 (21A200CPVN) không chỉ có vẻ ngoài cuốn hút với thiết kế hai tông màu lạ mắt mà còn sở hữu cấu hình mạnh mẽ đáp ứng đa nhu cầu sử dụng của các bạn học sinh, sinh viên và nhân viên văn phòng.', 1, N'XM', 43, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Lenovo Ideapad Gaming 3 15IAH7 i5 12500H/8GB/512GB/4GB RTX3050/120Hz/Win11 (82S9007TVN)', 100, 2290000, N'Laptop Lenovo Ideapad Gaming 3 15IAH7 i5 (82S9007TVN) thuộc dòng laptop gaming mang vẻ đẹp ấn tượng, cuốn hút nhưng không kém phần mạnh mẽ nhờ vào CPU Intel Gen 12, sẵn sàng đồng hành cùng bạn trên mọi đấu trường game hiện nay.', 1, N'XM', 44, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Lenovo Ideapad 5 14IAL7 i5 1235U/8GB/512GB/Win11 (82SD0060VN)', 100, 2790000, N'Một chiếc laptop học tập - văn phòng mà các bạn học sinh, sinh viên hay dân văn phòng không nên bỏ qua đó là laptop Lenovo Ideapad 5 14IAL7 i5 (82SD0060VN) với ngoại hình thanh lịch, đẹp mắt cùng hiệu năng ổn định đến từ bộ vi xử lý Intel Gen 12. ', 1, N'XM', 45, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Lenovo Ideapad 3 15IAU7 i3 1215U/8GB/512GB/Win11 (82RK001MVN) ', 100, 4390000, N'Laptop Lenovo Ideapad 3 15IAU7 i3 1215U (82RK001MVN) mang phong cách thiết kế hiện đại kết hợp cùng hiệu năng mạnh mẽ từ bộ vi xử lý Intel Gen 12, hứa hẹn sẽ chinh phục mọi người dùng đặc biệt là học sinh, sinh viên và nhân viên văn phòng.', 1, N'XM', 46, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Lenovo Yoga Slim 7 Carbon 13ITL5 i7 1165G7/16GB/1TB/Win11 (82EV00AWVN)', 100, 3890000, N'Laptop Lenovo Yoga Slim 7 Carbon 13ITL5 i7 1165G7 (82EV00AWVN) là phiên bản laptop mỏng nhẹ sở hữu phong cách thiết kế tối giản, hiện đại với khối lượng chỉ vỏn vẹn 0.966 kg đi cùng cấu hình ổn định, đáp ứng đầy đủ mọi nhu cầu học tập và văn phòng của người dùng.', 1, N'XM', 47, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Lenovo Ideapad Gaming 3 15IAH7 i7 12700H/16GB/512GB/4GB RTX3050Ti/120Hz/Win11 (82S9007UVN) ', 100, 2390000, N'Laptop Lenovo Ideapad Gaming 3 15IAH7 i7 (82S9007UVN) khơi nguồn mọi cảm hứng game thủ khi sở hữu sức mạnh nổi bật đến từ chip Intel Gen 12 dòng H hiệu năng cao cùng card rời RTX 30 series mạnh mẽ, sẵn sàng cùng bạn đương đầu trên mọi chiến trường ảo.', 1, N'XM', 48, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Lenovo Legion 5 15IAH7 i5 12500H/8GB/512GB/4GB RTX3050Ti/165Hz/Win11 (82RC003WVN) ', 100, 3390000, N'Laptop Lenovo Legion 5 15IAH7 i5 12500H (82RC003WVN) gây ấn tượng bởi lối thiết kế đậm chất thể thao, mạnh mẽ với khả năng vận hành mượt mà mọi tựa game từ nhẹ đến nặng, giúp các cao thủ chiến game đầy tự tin và tận hưởng những giây phút đỉnh cao trong chiến trường ảo.', 1, N'XM', 49, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Lenovo Yoga Slim 7 Pro 14IHU5 i7 11370H/16GB/512GB/OfficeHS/Win11 (82NH00ALVN)', 100, 1990000, N'Không thể bỏ lỡ mẫu laptop Lenovo Yoga Slim 7 Pro 14IHU5 i7 (82NH00ALVN) bởi cấu hình vô cùng mạnh mẽ với Intel Core i7 11370H và vẻ ngoài sang trọng, sẽ là trợ thủ đắc lực cho những ai đang là sinh viên, dân văn phòng hay kinh doanh.', 1, N'XM', 50, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Lenovo Yoga 7 14IAL7 i5 1240P/16GB/512GB/Touch/Pen/Win11 (82QE000RVN)', 100, 6190000, N'Một chiếc laptop cao cấp phục vụ tốt cho công việc thường xuyên phải di chuyển đòi hỏi thiết kế mỏng nhẹ cùng hiệu năng mạnh mẽ, laptop Lenovo Yoga 7 14IAL7 i5 1240P (82QE000RVN) là sự lựa chọn hoàn hảo dành cho người dùng cần đáp ứng công việc mọi lúc mọi nơi. ', 1, N'XM', 51, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Lenovo IdeaPad 5 Pro 16IHU6 i5 11300H/16GB/512GB/2GB MX450/120Hz/Win11 (82L9004XVN) ', 100, 6990000, N'Mang phong cách thiết kế thanh lịch quen thuộc của dòng laptop học tập - văn phòng, laptop Lenovo IdeaPad 5 Pro 16IHU6 i5 11300H (82L9004XVN) nay còn được trang bị màn hình lên đến 16 inch hỗ trợ bạn thao tác xử lý công việc trên một màn hình tiện lợi hơn bao giờ hết. ', 1, N'XM', 52, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Lenovo ThinkPad E15 Gen 4 i7 1260P/16GB/512GB/Win11 (21E600CPVN) ', 100, 5790000, N'Laptop Lenovo ThinkPad E15 Gen 4 i7 (21E600CPVN) hướng đến người dùng doanh nhân cần một chiếc laptop cao cấp - sang trọng sở hữu thiết kế gọn nhẹ cùng những thông số cấu hình mạnh mẽ để hoàn thành công việc nhanh chóng kể cả khi đang di chuyển.', 1, N'XM', 53, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Lenovo Gaming Legion 5 15ACH6 R7 5800H/8GB/512GB/4GB RTX3050Ti/165Hz/Win11 (82JW00KMVN)', 100, 3890000, N'Lenovo Gaming Legion 5 15ACH6 R7 5800H (82JW00KMVN) là phiên bản laptop với kiểu dáng mới lạ cùng hiệu năng vượt trội, sẵn sàng cùng bạn chiến mọi trận game khó nhằn.', 1, N'XM', 54, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Lenovo Ideapad 5 Pro 14IAP7 i7 1260P/16GB/512GB/Win11(82SH002SVN)', 100, 5950000, N'Laptop Lenovo Ideapad 5 Pro 14IAP7 i7 (82SH002SVN) là chiếc laptop học tập - văn phòng dành riêng cho bạn bởi trang bị công nghệ CPU Intel thế hệ thứ 12 tiên tiến cùng ngoại hình vỏ kim loại sang trọng, độ phân giải 2.8K và các thông số mạnh mẽ khác, giúp bạn hoàn thành tốt và nhanh chóng các tác vụ được giao.', 1, N'XM', 55, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Lenovo Yoga Slim 7 Pro 14IHU5 i5 11300H/16GB/512GB/OfficeH&S/Win11 (82NH00AMVN) ', 100, 5590000, N'Laptop Lenovo Yoga Slim 7 Pro 14IHU5 i5 (82NH00AMVN) nâng tầm giải trí với chất lượng hiển thị siêu đẹp nhờ tấm nền OLED hiện đại cùng những thông số kỹ thuật mạnh mẽ, xứng tầm trở thành một trợ thủ đắc lực trong công việc của bạn.', 1, N'XM', 56, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Lenovo ThinkBook 14s G2 ITL i5 1135G7/8GB/512GBWin11 (20VA003NVN) ', 100, 16990000, N'Laptop Lenovo ThinkBook 14s G2 ITL i5 (20VA003NVN) mang thiết kế hiện đại, thanh lịch cùng bộ vi xử lý Intel Gen 11 tân tiến, hứa hẹn sẽ đáp ứng tốt mọi tác vụ văn phòng cơ bản đến đồ họa chuyên dụng và hoạt động giải trí cơ bản hàng ngày.', 1, N'XM', 57, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Lenovo Gaming Legion 5 15ACH6 R5 5600H/8GB/512GB/4GB RTX3050/165Hz/Win11 (82JW00KLVN) ', 100, 19990000, N'Với phong cách thiết kế độc đáo cùng card đồ họa NVIDIA GeForce mạnh mẽ, laptop Lenovo Gaming Legion 5 15ACH6 (82JW00KLVN) đáp ứng tốt mọi tác vụ từ học tập, văn phòng nhẹ nhàng đến đồ họa, kỹ thuật chuyên sâu. ', 1, N'XM', 58, N'DT', 0)



-- MSI (25) 
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Modern 14 B11MOU i3 1115G4/8GB/256GB/Win11 (1027VN)', 100, 3990000, N'Laptop MSI Modern 14 B11MOU i3 (1027VN) là phiên bản laptop phổ thông được nhà MSI cho ra mắt với sứ mệnh phục vụ tốt mọi tác vụ thiết yếu cơ bản hằng ngày của người dùng khi sở hữu cấu hình ổn định đến từ con chip Intel Gen 11 cùng ngoại hình trang nhã, thời thượng và mang tính di động cao.', 1, N'OP', 59, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Gaming GF63 Thin 11UD i7 11800H/8GB/512GB/4GB RTX3050Ti Max-Q/Balo/Chuột/Win11 (648VN) ', 100, 2840000, N'Sở hữu một vẻ ngoài độc đáo, mạnh mẽ phù hợp với mọi game thủ, chiếc laptop MSI Gaming GF63 Thin 11UD i7 11800H (648VN) được trang bị dòng chip Intel thế hệ 11 hiệu năng mạnh mẽ vượt trội khi đi cùng card rời RTX 30 series sẵn sàng chiến mượt bất kì tựa game phổ biến hay thiết kế đồ họa chuyên sâu.', 1, N'OP', 60, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Gaming GF63 Thin 11UD i5 11400H/8GB/512GB/4GB RTX3050Ti Max-Q/Balo/Chuột/Win11 (649VN) ', 100, 3590000, N'Với thiết kế mạnh mẽ, hầm hố cùng hiệu năng ấn tượng đáp ứng tốt các nhu cầu chiến game hạng nặng, laptop MSI Gaming GF63 Thin 11UD i5 (649VN) sẵn sàng cùng bạn chinh phục mọi đấu trường ảo. ', 1, N'OP', 61, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Modern 14 B11SBU i5 1155G7/8GB/512GB/2GB MX450/Túi/Chuột/Win10 (669VN) ', 100, 3250000, N'Laptop MSI Modern 14 B11SBU i5 (669VN) mang lối thiết kế thời thượng, hiện đại cùng những thông số kỹ thuật ổn định, sẽ là một trong những sự lựa chọn xứng đáng dành cho bạn, hứa hẹn đáp ứng tốt nhu cầu học tập, làm việc hàng ngày. ', 1, N'OP', 62, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Modern 14 B11MOU i7 1195G7/8GB/512GB/Túi/Chuột/Win11 (1032VN) ', 100, 4890000, N'Laptop MSI Modern 14 B11MOU i7 (1032VN) sẽ là một người cộng sự lý tưởng cho người dùng trong phân khúc laptop học tập - văn phòng khi sở hữu cấu hình mạnh mẽ từ CPU Intel Core i7 cùng những tính năng thiết kế nổi bật.  ', 1, N'OP', 63, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Modern 15 A11MU i5 1155G7/8GB/512GB/Túi/Chuột/Win10 (680VN)', 100, 5490000, N'Modern 15 A11MU (680VN) là phiên bản laptop học tập - văn phòng đến từ nhà MSI với xu hướng thiết kế gọn nhẹ, hiện đại cùng hiệu năng vượt trội đến từ con chip Intel Gen 11 ấn tượng, đáp ứng tối đa nhu cầu giải trí và làm việc cho người dùng.', 1, N'OP', 64, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Gaming Pulse GL66 11UDK i7 11800H/16GB/512GB/4GB RTX3050Ti/144Hz/Balo/Chuột/Win10 (816VN)', 100, 3950000, N'Laptop MSI Gaming Pulse GL66 11UDK i7 (816VN) xuất hiện với một diện mạo ấn tượng cùng CPU Intel dòng H và card rời RTX 30 series, sẵn sàng cùng mình chinh phục những tựa game hấp dẫn hay hoàn thành công việc với hiệu suất cao hơn.', 1, N'OP', 65, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Gaming Alpha 15 B5EEK R7 5800H/16GB/512GB/8GB RX6600M/144Hz/Balo/Chuột/Win11 (218VN) ', 100, 4490000, N'Một siêu phẩm xứng đáng được các game thủ mong đợi chính là chiếc laptop MSI Gaming Alpha 15 B5EEK R7 (218VN) khi sở hữu nguồn sức mạnh bộc phá đến từ bộ vi xử lý AMD 5800H cùng card đồ họa rời RX 6600M 8 GB, luôn sẵn sàng cùng mình khuấy động mọi chiến trường ảo.', 1, N'OP', 66, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Gaming Alpha 15 B5EEK R7 5800H/16GB/512GB/8GB RX6600M/144Hz/Balo/Chuột/Win11 (218VN) ', 100, 4490000, N'Một siêu phẩm xứng đáng được các game thủ mong đợi chính là chiếc laptop MSI Gaming Alpha 15 B5EEK R7 (218VN) khi sở hữu nguồn sức mạnh bộc phá đến từ bộ vi xử lý AMD 5800H cùng card đồ họa rời RX 6600M 8 GB, luôn sẵn sàng cùng mình khuấy động mọi chiến trường ảo.', 1, N'OP', 67, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Gaming Alpha 15 B5EEK R7 5800H/16GB/512GB/8GB RX6600M/144Hz/Balo/Chuột/Win11 (218VN) ', 100, 4490000, N'Một siêu phẩm xứng đáng được các game thủ mong đợi chính là chiếc laptop MSI Gaming Alpha 15 B5EEK R7 (218VN) khi sở hữu nguồn sức mạnh bộc phá đến từ bộ vi xử lý AMD 5800H cùng card đồ họa rời RX 6600M 8 GB, luôn sẵn sàng cùng mình khuấy động mọi chiến trường ảo.', 1, N'OP', 68, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Creator Z16 A12UET i7 12700H/16GB/1TB SSD/6GB RTX3060/120Hz/Túi/Chuột/Win11 (036VN) ', 100, 6490000, N'Chinh phục mọi ánh nhìn với phong cách thiết kế thời thượng, sang trọng, laptop MSI Creator Z16 A12UET i7 12700H (036VN) còn được trang bị cấu hình hoàn hảo từ CPU Gen 12 đáp ứng mọi nhu cầu của một chiếc laptop đồ hoạ - kỹ thuật chuyên nghiệp của người dùng.', 1, N'OP', 69, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Gaming GE66 Raider 11UG i7 11800H/16GB/2TB SSD/8GB RTX3070/360Hz/Balo/Chuột/Win10 (258VN)', 100, 5390000, N'Vươn lên tầm cao mới cùng laptop MSI Gaming GE66 Raider 11UG i7 11800H (258VN) với thiết kế độc lạ, đem đến vô vàn tính năng cao, chinh phục mọi công việc khó nhằn hay chiến đấu cực đỉnh trên mọi chiến trường game. ', 1, N'OP', 70, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Gaming GE66 Raider 11UG i7 11800H/16GB/2TB SSD/8GB RTX3070/360Hz/Balo/Chuột/Win10 (258VN)', 100, 5390000, N'Vươn lên tầm cao mới cùng laptop MSI Gaming GE66 Raider 11UG i7 11800H (258VN) với thiết kế độc lạ, đem đến vô vàn tính năng cao, chinh phục mọi công việc khó nhằn hay chiến đấu cực đỉnh trên mọi chiến trường game. ', 1, N'OP', 71, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Gaming GE66 Raider 11UG i7 11800H/16GB/2TB SSD/8GB RTX3070/360Hz/Balo/Chuột/Win10 (258VN)', 100, 5390000, N'Vươn lên tầm cao mới cùng laptop MSI Gaming GE66 Raider 11UG i7 11800H (258VN) với thiết kế độc lạ, đem đến vô vàn tính năng cao, chinh phục mọi công việc khó nhằn hay chiến đấu cực đỉnh trên mọi chiến trường game. ', 1, N'OP', 72, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Gaming GE66 Raider 11UG i7 11800H/16GB/2TB SSD/8GB RTX3070/360Hz/Balo/Chuột/Win10 (258VN)', 100, 5390000, N'Vươn lên tầm cao mới cùng laptop MSI Gaming GE66 Raider 11UG i7 11800H (258VN) với thiết kế độc lạ, đem đến vô vàn tính năng cao, chinh phục mọi công việc khó nhằn hay chiến đấu cực đỉnh trên mọi chiến trường game. ', 1, N'OP', 73, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Gaming GF65 Thin 10UE i5 10500H/16GB/512GB/6GB RTX3060 Max-Q/144Hz/Balo/Win10 (286VN)', 100, 2490000, N'Tối ưu hóa cho mọi hoạt động từ đồ họa đến chiến game, laptop MSI GF65 Thin 10UE i5 (286VN) sẽ là người cộng sự đắc lực với thiết kế độc đáo và cấu hình mạnh mẽ, cùng bạn xông pha trên mọi chiến trường ảo.', 1, N'OP', 74, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Gaming GF63 Thin 11UC i5 11400H/8GB/512GB/4GB RTX3050/Balo/Chuột/Win10 (445VN) ', 100, 6290000, N'Laptop MSI Gaming GF63 Thin 11UC (445VN) khơi nguồn mọi cảm hứng cho game thủ bởi ngoại hình hầm hố, năng động cùng những thông số kỹ thuật ấn tượng. ', 1, N'OP', 75, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Gaming Bravo 15 B5DD R7 5800H/8GB/512GB/4GB RX5500M/Balo/Chuột/Win11 (278VN) ', 100, 9990000, N'Kiểu dáng đậm chất gaming cùng những chi tiết nổi bật, laptop MSI Gaming Bravo 15 B5DD R7 5800H (278VN) mang trong mình sức mạnh hiệu năng vượt bậc, đánh bại mọi đối thủ, đưa bạn đến gần hơn với sự thành công.', 1, N'OP', 76, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Modern 14 B11MOU i7 1195G7/8GB/512GB/Túi/Chuột/Win10 (618VN)', 100, 6390000, N' MSI Modern 14 B11MOU (618VN) thu hút mọi ánh nhìn của những người xung quanh với lối thiết kế mỏng nhẹ - thời trang cùng những thông số kỹ thuật mạnh mẽ nhưng lại sở hữu mức giá tầm trung ấn tượng, xứng đáng trở thành sự lựa chọn hoàn hảo đáp ứng mọi nhu cầu học tập và làm việc của khách hàng.', 1, N'OP', 77, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Modern 14 B11MOU i7 1195G7/8GB/512GB/Túi/Chuột/Win10 (847VN) ', 100, 7090000, N'MSI Modern 14 B11MOU i7 (847VN) là một chiếc laptop học tập - văn phòng ở mức giá tầm trung nhưng sở hữu sức mạnh hiệu năng vượt trội đến từ con chip Intel thế hệ 11 hiện đại cùng vẻ ngoài sang trọng, cao cấp, hứa hẹn đáp ứng tốt cho công việc cũng như giải trí hoàn hảo. ', 1, N'OP', 78, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Modern 15 A5M R7 5700U/8GB/512GB/Túi/Chuột/Win11 (237VN) ', 100, 5990000, N'Nếu bạn đang tìm kiếm một chiếc laptop có thể đáp ứng đầy đủ mọi nhu cầu làm việc hay giải trí từ cơ bản đến nâng cao nhưng vẫn sở hữu một phong cách thiết kế sang chảnh, thời thượng, sức mạnh đa năng cùng mức giá hoàn toàn hợp lý, Laptop MSI Modern 15 A5M R7 (237VN) hứa hẹn sẽ mang đến những trải nghiệm trên cả tuyệt vời.', 1, N'OP', 79, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Gaming GF63 Thin 10SC i5 10500H/8GB/512GB/4GB GTX1650 Max-Q/Win10 (805VN)', 100, 11490000, N'Mang một hiệu năng ấn tượng, laptop MSI GF63 Thin 10SC i5 (805VN) là dòng laptop gaming đáng để bạn lựa chọn, sẵn sàng là cộng sự đắc lực cho bạn trên mọi chiến trường ảo.', 1, N'OP', 80, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Modern 14 B5M R5 5500U/8GB/512GB/Túi/Chuột/Win11 (203VN) ', 100, 8190000, N'Laptop MSI Modern 14 B5M R5 5500U (203VN) sở hữu kiểu dáng thanh lịch với thiết kế màn hình viền mỏng cùng cấu hình ổn định, sẵn sàng đồng hành cùng bạn trong mọi tác vụ xử lý công việc hay giải trí.', 1, N'OP', 81, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Modern 15 A5M R5 5500U/8GB/512GB/Túi/Chuột/Win11 (236VN) ', 100, 9990000, N'MSI Modern 15 A5M (236VN) gây ấn tượng với người dùng bởi phong cách thiết kế thời trang, thanh lịch cùng những thông số kỹ thuật ấn tượng nhưng lại sở hữu mức giá vô cùng hợp lý, sẽ là một sự lựa chọn đúng đắn đáp ứng mọi nhu cầu laptop học tập - văn phòng đa dạng.', 1, N'OP', 82, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop MSI Modern 14 B11MOU i3 1115G4/8GB/256GB/Win11 (1027VN) ', 100, 11990000, N'Laptop MSI Modern 14 B11MOU i3 (1027VN) là phiên bản laptop phổ thông được nhà MSI cho ra mắt với sứ mệnh phục vụ tốt mọi tác vụ thiết yếu cơ bản hằng ngày của người dùng khi sở hữu cấu hình ổn định đến từ con chip Intel Gen 11 cùng ngoại hình trang nhã, thời thượng và mang tính di động cao.', 1, N'OP', 83, N'DT', 0)


-- Acer (9) 
INSERT [dbo].[SanPham] VALUES ( N'Laptop Acer TravelMate B3 TMB311 31 C2HB N4020/4GB/128GB/Win11 (NX.VNFSV.006)', 100, 5490000, N'Laptop Acer TravelMate B3 TMB311 31 C2HB (NX.VNFSV.006) nhắm đến phân khúc laptop học tập - văn phòng, phục vụ cho các nhu cầu cơ bản trên laptop, với kích thước nhỏ gọn và hiệu năng đủ dùng, là sự lựa chọn tốt cho học sinh, sinh viên.', 1, N'VV', 84, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Acer Aspire 7 Gaming A715 42G R4XX R5 5500U/8GB/256GB/4GB GTX1650/Win11 (NH.QAYSV.008)', 100, 5790000, N'Laptop Aspire 7 Gaming A715 42G R4XX R5 (NH.QAYSV.008) sở hữu hiệu năng khoẻ cùng thiết kế mạnh mẽ, là bạn đồng hành lý tưởng trong mọi cuộc hành trình.', 1, N'VV', 85, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H/8GB/512GB/144Hz/4GB GTX1650/Win11 (NH.QBMSV.006)', 100, 9990000, N'Phá cách với diện mạo mạnh mẽ đến từ laptop Acer Nitro 5 Gaming AN515 45 R6EV R5 5600H (NH.QBMSV.006) mang đến cho người dùng hiệu năng ổn định, hỗ trợ bạn trong mọi tác vụ hằng ngày hay chiến những trận game cực căng một cách mượt mà.', 1, N'VV', 86, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Acer Aspire 7 Gaming A715 43G R8GA R5 5625U/8GB/512GB/4GB RTX3050/144Hz/Win11 (NH.QHDSV.002)', 100, 9590000, N'Một chiếc laptop gaming mà mình tin rằng các game thủ có thể dễ dàng bị chinh phục nhờ sở hữu mức giá lý tưởng nhưng lại trang bị những thông số kỹ thuật ấn tượng, em laptop Acer Aspire 7 Gaming A715 43G R8GA R5 (NH.QHDSV.002) hứa hẹn cùng bạn chinh phục mọi chiến trường.', 1, N'VV', 87, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Acer Aspire 3 A315 58 52KT i5 1135G7/8GB/512GB/Win11 (NX.AM0SV.006) ', 100, 11650000, N'Laptop Acer Aspire 3 A315 58 52KT i5 (NX.AM0SV.006) có cấu hình khỏe, thiết kế cao cấp, màn hình lớn đủ để phục vụ các nhu cầu làm việc văn phòng và giải trí cơ bản của mọi người dùng.', 1, N'VV', 88, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Acer Nitro 5 Gaming AN515 57 553E i5 11400H/8GB/512GB/4GB RTX3050/144Hz/Win11 (NH.QENSV.006) ', 100, 25890000, N'Laptop Acer Nitro 5 Gaming AN515 57 553E (NH.QENSV.006) là sự cân bằng hoàn hảo của diện mạo hầm hố chuẩn laptop gaming cùng hiệu năng của chip Intel thế hệ 11 mạnh mẽ kết hợp với card rời RTX 30 series sẵn sàng cùng bạn chinh phục trên mọi đấu trường ảo.', 1, N'VV', 89, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Acer Aspire A514 54 511G i5 1135G7/8GB/1TB SSD/Win11 (NX.A28SV.009) ', 100, 27490000, N'Một sự lựa chọn mới mẻ nằm trong phân khúc tầm trung dành cho mọi đối tượng đặc biệt là học sinh, sinh viên hay dân văn phòng chính là chiếc laptop Acer Aspire A514 54 511G i5 (NX.A28SV.009) với hiệu năng mạnh mẽ đến từ con chip Intel thế hệ 11 cùng ổ cứng SSD lên đến 1 TB.', 1, N'VV', 90, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Acer Aspire A315 56 32TP i3 1005G1/4GB/256GB/Win11 (NX.HS5SV.00K) ', 100, 19690000, N'Laptop Acer Aspire A315 56 32TP i3 1005G1 (NX.HS5SV.00K) là sản phẩm laptop laptop mỏng nhẹ, có cấu hình ổn định phù hợp với các nhu cầu sử dụng Office hay lướt web, xem phim giải trí,... của các bạn học sinh, sinh viên.', 1, N'VV', 91, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop Acer Nitro 5 Tiger AN515 58 773Y i7 12700H/8GB/512GB/4GB RTX3050Ti/144Hz/Win11 (NH.QFKSV.001)', 100, 16690000, N'Đánh bật nhiều đối thủ trong cùng phân khúc laptop gaming với sự xuất hiện của con chip Intel Gen 12 đầy mạnh mẽ, laptop Acer Nitro 5 Tiger AN515 58 773Y i7 (NH.QFKSV.001) hứa hẹn sẽ là cánh tay phải đắc lực cho các game thủ oanh tạc trên mọi chiến trường.', 1, N'VV', 92, N'DT', 0)


-- HP (6) 
INSERT [dbo].[SanPham] VALUES ( N'Laptop HP 240 G8 i3 1005G1/4GB/512GB/Win11 (617K6PA) ', 100, 3990000, N'Sẵn sàng đồng hành cùng bạn đến trường học cùng laptop HP 240 G8 i3 (617K6PA) với thiết kế gọn nhẹ, cấu hình tốt trong tầm giá, khả năng xử lý các tác vụ học tập lẫn công việc, hứa hẹn sẽ là một chiếc laptop học tập - văn phòng mà các bạn không thể bỏ qua.', 1, N'TN', 93, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop HP 15s fq2662TU i3 1115G4/4GB/256GB/Win11 (6K795PA) ', 100, 2840000, N'Laptop HP 15s fq2662TU i3 (6K795PA) sẽ là sự lựa chọn phù hợp cho học sinh, sinh viên muốn tìm kiếm một chiếc laptop học tập - văn phòng sở hữu cấu hình ổn định, đáp ứng tốt mọi nhu cầu cơ bản cùng một mức giá lý tưởng, dễ dàng tiếp cận.', 1, N'TN', 94, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop HP 15s fq5078TU i5 1235U/8GB/512GB/Win11 (6K798PA) ', 100, 3590000, N'Thiết kế thanh lịch, tao nhã tạo nên vẻ đẹp quyến rũ của chiếc laptop HP 15s fq5078TTU i5 (6K798PA), sở hữu dòng chip Intel thế hệ 12 sẵn sàng cân đối mọi tác vụ của laptop học tập - văn phòng phù hợp với sinh viên, học sinh, nhân viên văn phòng.', 1, N'TN', 95, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop HP Pavilion 15 eg2056TU i5 1240P/8GB/512GB/Win11 (6K786PA) ', 100, 1650000, N'Laptop HP Pavilion 15 eg2056TU i5 (6K786PA) là phiên bản laptop học tập - văn phòng sở hữu hiệu năng vượt trội đến từ con chip Gen 12 mạnh mẽ cùng phong cách thiết kế đơn giản, sang trọng, đáp ứng tốt mọi nhu cầu sử dụng thiết yếu hằng ngày. ', 1, N'TN', 96, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop HP 15s fq5077TU i7 1255U/8GB/512GB/Win11 (6K797PA)', 100, 4890000, N'Nếu bạn đang tìm kiếm một chiếc laptop học tập - văn phòng sở hữu cấu hình mạnh mẽ cùng ngoại hình tối giản, thanh tao, laptop HP 15s fq5077TU i7 (6K797PA) sẽ là một sự lựa chọn sáng giá hứa hẹn mang đến những trải nghiệm học tập, làm việc và giải trí trọn vẹn. ', 1, N'TN', 97, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop HP 240 G9 i5 1235U/8GB/512GB/Win11 (6L1Y2PA) ', 100, 5490000, N'Laptop HP 240 G9 i5 (6L1Y2PA) sẽ là chiếc laptop học tập - văn phòng khó lòng chối từ nếu bạn là sinh viên hoặc dân văn phòng bởi trang bị bộ vi xử lý Intel Gen 12 tân tiến cùng những thông số kỹ thuật ấn tượng.', 1, N'TN', 98, N'DT', 0)




-- LG (12) 
INSERT [dbo].[SanPham] VALUES ( N'Laptop LG gram 2022 i7 1260P/16GB/1TB/Win11 (17Z90Q-G.AH78A5) ', 100, 8290000, N'Laptop LG gram 2022 i7 1260P (17Z90Q-G.AX78A5) sẽ là một siêu phẩm laptop cao cấp - sang trọng đáng để bạn sở hữu bởi ngoại hình mỏng nhẹ, thời thượng cùng hiệu năng vượt bậc từ con chip Intel Gen 12, hứa hẹn mang đến những trải nghiệm làm việc và giải trí trọn vẹn nhất cho người dùng là sinh viên, nhân viên hay doanh nhân.', 1, N'RM', 99, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop LG gram 2022 i7 1260P/16GB/1TB/Win11 (16Z90Q-G.AH78A5) ', 100, 1100000, N'Laptop LG gram 2022 i7 1260P (16Z90Q-G.AH78A5) là một tân binh laptop cao cấp - sang trọng được nhà LG cho ra mắt nhằm hỗ trợ tối đa các tác vụ hằng ngày từ cơ bản đến nâng cao của sinh viên, nhân viên hay các doanh nhân kỹ tính khi sở hữu thiết kế sang trọng cùng hiệu năng vượt trội. ', 1, N'RM', 100, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop LG gram 2022 i7 1260P/16GB/512GB/Win11 (16Z90Q-G.AH76A5) ', 100, 19990000, N'Laptop LG gram 2022 i7 1260P (16Z90Q-G.AH76A5) là thế hệ laptop cao cấp - sang trọng mới được LG cho ra mắt với lối thiết kế hiện đại cùng hiệu năng mạnh mẽ, xứng danh trợ thủ đắc lực cho mọi đối tượng người dùng.', 1, N'RM', 101, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop LG gram 2022 i7 1260P/16GB/512GB/Win11 (14Z90Q-G.AH75A5) ', 100, 27990000, N'Laptop LG gram 2022 i7 1260P (14Z90Q-G.AH75A5) xứng danh một chiếc laptop cao cấp - sang trọng khi có ngoại hình mỏng nhẹ thu hút mọi ánh nhìn cùng hiệu năng mạnh mẽ hỗ trợ bạn hoàn thành mọi tác vụ công việc.', 1, N'RM', 102, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop LG gram 2022 i3 1220P/8GB/256GB/Win11 (14Z90Q-G.AJ32A5) ', 100, 6990000, N'Laptop LG gram 2022 i3 1220P (14Z90Q-G.AJ32A5) mang đến cho bạn một phiên bản laptop cao cấp - sang trọng vừa thời trang vừa di động mà còn sở hữu hiệu năng mạnh mẽ, sẵn sàng đồng hành cùng bạn đến bất kỳ đâu.', 1, N'RM', 103, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop LG gram 2022 i3 1220P/8GB/256GB/Win11 (14Z90Q-G.AJ32A5)', 100, 8450000, N'Laptop LG gram 2022 i3 1220P (14Z90Q-G.AJ32A5) mang đến cho bạn một phiên bản laptop cao cấp - sang trọng vừa thời trang vừa di động mà còn sở hữu hiệu năng mạnh mẽ, sẵn sàng đồng hành cùng bạn đến bất kỳ đâu.', 1, N'RM', 104, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop LG gram 2022 i7 1260P/16GB/1TB/Win11 (17Z90Q-G.AH78A5) ', 100, 8290000, N'Laptop LG gram 2022 i7 1260P (17Z90Q-G.AX78A5) sẽ là một siêu phẩm laptop cao cấp - sang trọng đáng để bạn sở hữu bởi ngoại hình mỏng nhẹ, thời thượng cùng hiệu năng vượt bậc từ con chip Intel Gen 12, hứa hẹn mang đến những trải nghiệm làm việc và giải trí trọn vẹn nhất cho người dùng là sinh viên, nhân viên hay doanh nhân.', 1, N'RM', 105, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop LG gram 2022 i7 1260P/16GB/1TB/Win11 (16Z90Q-G.AH78A5) ', 100, 1100000, N'Laptop LG gram 2022 i7 1260P (16Z90Q-G.AH78A5) là một tân binh laptop cao cấp - sang trọng được nhà LG cho ra mắt nhằm hỗ trợ tối đa các tác vụ hằng ngày từ cơ bản đến nâng cao của sinh viên, nhân viên hay các doanh nhân kỹ tính khi sở hữu thiết kế sang trọng cùng hiệu năng vượt trội. ', 1, N'RM', 106, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop LG gram 2022 i7 1260P/16GB/512GB/Win11 (16Z90Q-G.AH76A5) ', 100, 19990000, N'Laptop LG gram 2022 i7 1260P (16Z90Q-G.AH76A5) là thế hệ laptop cao cấp - sang trọng mới được LG cho ra mắt với lối thiết kế hiện đại cùng hiệu năng mạnh mẽ, xứng danh trợ thủ đắc lực cho mọi đối tượng người dùng.', 1, N'RM', 107, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop LG gram 2022 i7 1260P/16GB/512GB/Win11 (14Z90Q-G.AH75A5) ', 100, 27990000, N'Laptop LG gram 2022 i7 1260P (14Z90Q-G.AH75A5) xứng danh một chiếc laptop cao cấp - sang trọng khi có ngoại hình mỏng nhẹ thu hút mọi ánh nhìn cùng hiệu năng mạnh mẽ hỗ trợ bạn hoàn thành mọi tác vụ công việc.', 1, N'RM', 108, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop LG gram 2022 i3 1220P/8GB/256GB/Win11 (14Z90Q-G.AJ32A5) ', 100, 6990000, N'Laptop LG gram 2022 i3 1220P (14Z90Q-G.AJ32A5) mang đến cho bạn một phiên bản laptop cao cấp - sang trọng vừa thời trang vừa di động mà còn sở hữu hiệu năng mạnh mẽ, sẵn sàng đồng hành cùng bạn đến bất kỳ đâu.', 1, N'RM', 109, N'DT', 0)
INSERT [dbo].[SanPham] VALUES ( N'Laptop LG gram 2022 i3 1220P/8GB/256GB/Win11 (14Z90Q-G.AJ32A5)', 100, 8450000, N'Laptop LG gram 2022 i3 1220P (14Z90Q-G.AJ32A5) mang đến cho bạn một phiên bản laptop cao cấp - sang trọng vừa thời trang vừa di động mà còn sở hữu hiệu năng mạnh mẽ, sẵn sàng đồng hành cùng bạn đến bất kỳ đâu.', 1, N'RM', 110, N'DT', 0)



-- phụ kiện (11) 186 
INSERT [dbo].[SanPham] VALUES ( N'Tai nghe A5 2020 3GB/64GB', 100, 3990000, N'Bất cứ ai mua smartphone đều quan tâm hàng đầu đến thông số kỹ thuật và cấu hình máy. Tiếp đó, khi đã ưng ý, họ quan tâm đến giá cả và cuối cùng là chọn lựa phiên bản màu sắc yêu thích cho mình. Cấu hình điện thoại Oppo A5 2020: Oppo sản xuất điện thoại A5 2020 trên nền tảng hệ điều hành Android 9.0, kết hợp với chip Snapdragon 665 tiến trình 11nm, tám nhân, tích hợp với bộ xử lý đồ họa Adreno 610 mang đến khả năng đa nhiệm và tốc độ xử lý thông tin, hình ảnh đồ họa nhanh, trải nghiệm người dùng tốt. Màn hình điện thoại Oppo A5 2020: Oppo A5 2020 sở hữu màn hình cảm ứng điện dung IPS, kích thước rộng 6.5 inch, thiết kế màn hình giọt nước, độ phân giải 720 x 1600 pixel cùng tỉ lệ 82,7% so với thân máy, cho trải nghiệm màn hình tốt hơn, chất lượng hình ảnh HD+ sắc nét. Hệ thống camera của điện thoại Oppo A5 2020: Nổi bật bởi hệ thống bốn camera sau, độ phân giải 12MP, 8MP, 2MP, 2MP cùng một camera selfie mặt trước 8MP, Oppo A5 2020 mang đến những bức ảnh chụp chân dung với cảm biến chiều sâu hoàn hảo, ảnh chụp góc rộng và ảnh selfie sắc nét, độ phân giải cao. Pin điện thoại Oppo A5 2020:  Oppo A5 2020 nổi bật với viên pin Li-Po 5000 mAh. Với dung lượng pin “khủng” như thế này, bạn có thể thoải mái chơi game, lướt web, xem phim… trong thời gian dài, trên một ngày đối với các tác vụ nặng, kéo dài đến hai ngày đối với các tác vụ cơ bản. Thiết kế điện thoại Oppo A5 2020: Oppo A5 2020 thiết kế hai khay sim – một khay sim nano, một khe dự phòng kép, cảm biến vân tay gắn tại mặt lưng giúp bạn thao tác mở khóa dễ dàng hơn. Phiên bản và màu sắc điện thoại Oppo A5 2020: Oppo A5 2020 dự kiến ra mắt với hai tùy chọn màu sắc cơ bản, dễ dùng: đen gương và trắng chói cùng hai phiên bản bộ nhớ: 64GB + 3GB RAM, 128GB + 4GB RAM và hỗ trợ mở rộng thẻ nhớ, dung lượng tối đa 256GB. Với giới hạn phiên bản này, bạn có thể nhanh chóng chọn mua cho mình smartphone Oppo A5 2020 phù hợp.', 1, N'IP', 111, N'PK', 0)
INSERT [dbo].[SanPham] VALUES ( N'Tai nghe A12e 3GB/64GB', 100, 2840000, N'Thiết kế: Điện thoại Oppo A12e có thiết kế khá truyền thống với màn hình tai thỏ, cạnh bên máy được bo tròn và cụm camera kép hàng ngang phía sau. Sản phẩm hiện tại có hai phiên bản màu sắc là Đỏ sang trọng và Tím đậm thời thượng. Nhìn chung thiết kế của chiếc điện thoại khá tối giản với chỉ một màu, ko có đặc điểm nổi bật lắm nhưng nó vẫn rất thanh lịch. Kích thước của điện thoại thông minh Oppo A12e tương đối lớn, cụ thể là 156.2 x 75.6 x 8.2 mm và có khối lượng 168 gram. Cảm giác cầm nắm máy khá thoải mái, dễ dàng thao tác. Camera: Điện thoại OPPO A12e có  thiết lập camera kép phía sau bao gồm ống kính chính 13MP và cảm biến độ sâu 2MP. Ở phía trước, OPPO A12e có camera selfie độ phân giải 8MP. Camera chính trên thiết bị có khả năng quay video 1080p với tốc độ 30 khung hình / giây. Hệ thống trang bị camera này đủ tốt để giúp cho bạn lưu lại những khoảnh khắc thú vị trong cuộc sống của bạn. Giống với truyền thống của nhà Oppo, phần camera selfie phía trước cũng có những tính năng làm đẹp AI 2.0 mang lại cho bạn những bức hình tự sướng ấn tượng. Màn hình: OPPO A12e có màn hình IPS LCD tai thỏ tràn viền với kích thước 6.2 inch và độ phân giải HD +. Không giống như các điện thoại thông minh cấp thấp khác hiện có trên thị trường, OPPO A12e có một phần notch khá rộng ở phía trên cùng của màn hình, mang lại cảm giác nhìn rất giống những mẫu thiết kế từ năm 2018. Tuy nhiên, OPPO A12e vẫn mang lại tỷ lệ khung hình 19: 9. Về chất lượng hiển thị hình ảnh, video, của sản phẩm ở mức đủ tốt so với mức giá. Cấu hình: Oppo A12e được trang bị chipset Snapdragon 450. Đó là bộ vi xử lý Cortex-A53 Octa-Core được sản xuất trên quy trình 14nm. Sản phẩm này nhắm đến phân khúc giá rẻ nhưng hiệu năng mang lại vẫn mạnh mẽ hơn các sản phẩm khác như Snapdragon 429. Sức mạnh xử lý của máy được hỗ trợ bởi bộ RAM dung lượng 3GB và 64GB bộ nhớ trong. Ngoài ra còn có hỗ trợ mở rộng dung lượng qua thẻ nhớ microSD.', 1, N'SS', 112, N'PK', 0)
INSERT [dbo].[SanPham] VALUES ( N'Tai nghe A15s 4GB/64GB', 100, 3590000, N'Thiết kế liền lạc, trẻ trung: Sở hữu một triết lý thiết kế nguyên khối liền lạc, OPPO A15s có kích thước dài, rộng, cao lần lượt là 164 x 75.4 x 7.9 mm. Với kích thước này, OPPO A15s mang tới cho người dùng một trải nghiệm cầm nắm cực kì thoải mái và không bị mỏi tay. Trọng lượng của máy cũng rất nhẹ, chỉ 177g đã tính cả trọng lượng của viên pin, giúp cho việc sử dụng trong một thời gian dài cũng không bị mỏi tay như những mẫu điện thoại khác được hoàn thiện từ kim loại và kính. Màn hình sắc nét, trung thực: OPPO A15s sở hữu một màn hình với kích thước rộng 6.52 inch, độ phân giải HD+ trên tấm nền màn hình IPS LCD. Việc được tích hợp tấm nền màn hình IPS LCD sẽ giúp cho OPPO A12s sẽ có được khả năng hiển thị tốt ở ngoài trời cùng với góc nhìn cực rộng. Tuy màn hình của máy chỉ có độ phân giải HD+ thế nhưng với một mẫu máy chỉ nằm ở phân khúc giá rẻ bình dân thì đây cũng là một điều dễ hiểu. Bộ 3 camera 13MP chụp ảnh tốt: Sở hữu hệ thống camera với 3 ống kính bao gồm camera chính có độ phân giải 13MP, khẩu độ f/2.2; camera hỗ trợ chụp cận cảnh macro và hỗ trợ chụp xóa phông sẽ đều có độ phân giải 2MP, khẩu độ f/2.4. Với bộ camera này, máy hứa hẹn sẽ giúp người dùng tạo ra được những bức ảnh siêu ấn tượng theo nhiều cách khác nhau để chia sẻ với bạn bè, người thân. Về khả năng quay video, OPPO A12s cũng hỗ trợ quay video độ phân giải Full HD+ 1080p với 30 khung hình/giây ở mức mượt mà và ổn định. Hiệu năng mượt mà với Helio P35 và RAM 4GB: OPPO A15s được cung cấp sức mạnh xử lý bởi bộ vi xử lý Helio P35 đến từ MediaTek. Vi xử lý Helio P35 là con chip 8 nhân được sản xuất trên tiến trình 12nm, cho xung nhịp tối đa đạt mức 2.35GHz. Đi cùng với đó là bộ xử lý đồ họa GPU PowerVR GE8320. Với thông số kĩ thuật như vậy, OPPO A15s hứa hẹn sẽ mang lại cho người dùng khả năng xử lý cực kì mượt mà và ổn định, ngay kể cả với những tác vụ nặng như chơi game, render video hay chỉnh sửa ảnh.', 1, N'XM', 113, N'PK', 0)
INSERT [dbo].[SanPham] VALUES ( N'Tai nghe A16K 3GB/32GB', 100, 3250000, N'Thiết kế đẹp, kích thước siêu mỏng: Oppo A16K được chế tác trẻ trung, sang trọng nhờ mặt lưng cong 3D và độ mỏng chỉ 7,85mm. Không chỉ đẹp thẩm mỹ, OPPO A16K còn cho cảm giác cầm nắm tuyệt vời trong lòng bàn tay. Vẻ đẹp mềm mại từ những đường nét tinh tế chắc chắn sẽ khiến bạn hài lòng. OPPO mang đến 2 sự lựa chọn màu sắc là Đen cá tính và Xanh nổi bật. Cụm Camera AI siêu đỉnh: Camera chính của Oppo A16K có độ phân giải là 13MP chụp tốt trong điều kiện đủ sáng. Camera selfie của Oppo đã trở thành thương hiệu cho tín đồ thích sống ảo, máy ảnh camera trước có độ phân giải là 5MP hỗ trợ công nghệ làm đẹp AI mang đến vẻ đẹp ở mọi góc chụp. Chế độ tự động nhận diện độ tuổi, giới tính, làn da của bạn để khéo léo tinh chỉnh tông màu, làm mịn da, che khuyết điểm, để bạn luôn đẹp tỏa sáng trong khung hình. Cấu hình mạnh mẽ từ con chip MediaTek Helio G35: Oppo A16K được trang bị con chip MediaTek Helio G35 8 nhân. Kết hợp cùng với RAM 3 GB cho phép chiếc máy đa nhiệm ở mức tốt, các ứng dụng cũng thoải mái tài nguyên ram sử dụng giúp mọi thao tác thường xuyên như lướt facebook, đọc báo, xem youtube,… sẽ không phải là vấn đề. Thời lượng Pin: Oppo A16K có viên pin dung lượng cao với 4230mAh giúp bạn sử dụng điện thoại thoải mái một ngày dài mà không cần lo lắng máy hết pin giữa chừng. Sử dụng tác vụ cơ bản thì một ngày là tương đối ổn, chơi game liên tục với những game nhẹ thì máy cũng trụ được ở mức 5-6 tiếng, sử dụng xem phim có thể kéo dài hơn. Máy cũng được trang bị sạc nhanh nên việc sạc lại pin cũng không có gì khó khăn.', 1, N'OP', 114, N'PK', 0)
INSERT [dbo].[SanPham] VALUES ( N'Tai nghe A31 6GB/128GB', 100, 4890000, N'Oppo A31 6GB/128GB trình làng với kiểu dáng thiết kế đẹp mắt, thời thượng và cuốn hút: Luôn được biết đến là thương hiệu sản xuất smartphone với kiểu dáng trẻ trung, đẹp mắt, mới đây, Oppo tiếp tục trình làng sản phẩm mới (A31) của mình với hình dáng thiết kế màn hình giọt nước thời thượng. Máy được hoàn thiện với mặt lưng bằng chất liệu nhựa giả kính cùng khung viền nhựa bao quanh làm tăng độ ma sát để cầm nắm trên tay thêm chắc chắn, không trơn trượt. Đây là thiết kế hoàn toàn phù hợp đối với sản phẩm trong định hướng phân khúc phổ thông như thế này. Oppo A31 6GB/128GB: Màn hình IPS, 6.5 inch rộng lớn, độ phân giải HD+: Với sự kiện ra mắt lần này, Oppo đã tập trung điểm nhấn trên thiết kế màn hình điện thoại A3. Máy sở hữu tấm nền IPS với kích thước 6.5 inch vượt trội cùng độ phân giải HD+. Toàn bộ mặt trước được tinh giản tối đa, chỉ để lại một notch nhỏ chứa camera selfie 8MP. Các cạnh viền của máy đều được thu gọn hết mức có thể mang đến không gian trải nghiệm “đã” mắt cho người dùng. Đây là kích thước hiển thị màn hình tối ưu, đặc biệt thích hợp với game thủ trong các trận chinh chiến. Riêng đối với người dùng thì đây là một sự ưu ái so với tầm giá. Oppo A31 6GB/128GB: Hiệu năng mạnh, cấu hình khỏe với chip Helio P35, PowerVR GE8320: Oppo A31 được trang bị chip Helio P35, PowerVR GE8320 trên nền hệ điều hành Android 9.0, tùy biến giao diện Color OS 6.1 thân thiện hơn với người dùng. Chip có cấu tạo 8 nhân, trong đó bốn nhân tốc độ cao 2.3 Ghz, bốn nhân còn lại tiết kiệm điện năng với tốc độ xung nhịp 1.7 Ghz, vừa giúp máy chạy đa nhiệm mượt mà, vừa mang đến hiệu quả tiết kiệm năng lượng tốt hơn. Oppo A31 6GB/128GB: Cụm 3 camera sau 12MP thiết kế đẹp mắt: Mặt lưng máy nổi bật với cụm 3 camera sau (chính 12MP & Phụ 2MP, 2MP) xếp hàng dọc đẹp mắt đặt lệch góc trái.', 1, N'VV', 115, N'PK', 0)
INSERT [dbo].[SanPham] VALUES ( N'Tai nghe A52 6GB/128GB', 100, 5490000, N'Oppo A52 chính hãng: Pin Li-Po 5000mAh siêu khủng: Nếu như mức dung lượng pin từ 3000 – 4000mAh trên các smartphone cùng phân khúc giá được coi là định mức tiêu chuẩn thông thường thì Oppo đã mang đến cho người dùng nhiều hơn thế, vượt ngoài mong đợi khi trang bị trên A52 con số “khủng” 5000mAh. Nhờ đó, bạn có thể yên tâm trải nghiệm mọi tác vụ trên máy khoảng 2 ngày không lo lắng việc hết pin hay mang vác theo pin dự phòng cồng kềnh. Điều này không những thuận tiện hơn cho những ai có tính chất công việc thường xuyên di chuyển bên ngoài, trong những chuyến công tác ngắn ngày hoặc những game thủ bận chinh chiến các trận game liên tiếp trong cường độ sử dụng cao. Vi xử lý chip Snapdragon 665 thiên game của Qualcomm trên Oppo A52 chính hãng: Trong tất cả các nhà sản xuất chip trang bị trên smartphone Android thì Qualcomm hiện là cái tên nổi bật nhất. Người dùng mong chờ và thiện cảm hơn khi Snapdragon 665 của nhà sản xuất chip set tài ba này được xướng lên trên siêu phẩm Oppo A52 ngày ra mắt. Đơn giản bởi những tinh chỉnh và cải tiến vượt trội Qualcomm đầu tư hướng đến cho Snap 665 thiên hướng game mạnh mẽ, dành riêng cho smartphone phân khúc cận cao cấp. Với cấu tạo tám nhân, trong đó bốn nhân 2.0Ghz, bốn nhân 1.8 Ghz mang đến khả năng đa nhiệm tốt cho Oppo A52. Máy đi kèm GPU Adreno 610 và hệ điều hành Android 10, Color OS 7.1 ngay khi xuất xưởng. Nhờ vậy, A52 có thể xử lý mượt mà mọi tác vụ người dùng, mang đến bạn những giây phút thư giãn, giải trí đỉnh cao với tốc độ xử lý thông tin, hình ảnh nhanh chóng. Màn hình nốt ruồi thời thượng, kích thước 6.5 inch rộng lớn hợp xu hướng trên Oppo A52 chính hãng: A52 tiếp nối thành công xu hướng thiết kế màn hình nốt ruồi trên smartphone nửa đầu năm 2020. Với vị trí đục lỗ góc trái rất gọn để chứa camera selfie, máy tối ưu không gian hiển thị, mang đến tỷ lệ khung hình 20:9.', 1, N'TN', 116, N'PK', 0)
INSERT [dbo].[SanPham] VALUES ( N'Tai nghe A53 4GB/128GB', 100, 3950000, N'Thiết kế sang trọng với mặt lưng bóng bẩy: Mang trên mình một triết lý thiết kế nguyên khối liền lạc, OPPO A53 có tổng số đo “3 vòng” lần lượt là 163.9 x 75.1 x 8.4 mm. Với kích thước như vậy, OPPO A53 sẽ mang tới cho người dùng một trải nghiệm cấm nắm thoải mái nhất tới cho người dùng. Ngoài ra, trọng lượng của máy cũng rất nhẹ nhàng chỉ 186g bao gồm cả pin, giúp việc cầm nắm trong một thời gian dài sẽ không bị mỏi tay như những chiếc điện thoại có thiết kế từ mặt lưng kính.  Màn hình IPS LCD 6.5 inch sắc nét: OPPO A53 sở hữu một màn hình có kích thước lên tới 6.5 inch, độ phân giải HD trên tấm nền IPS LCD chất lượng cao. Với việc được trang bị tấm nền IPS LCD, OPPO A53 sẽ có được khả năng hiển thị tốt ở ngoài trời cùng với một góc nhìn rộng. Độ phân giải của máy tuy chỉ là HD nhưng với một chiếc máy ở phân khúc giá rẻ bình dân, chúng ta cũng không thể đòi hỏi được nhiều hơn thế. Khả năng nhiếp ảnh tốt nhờ bộ 3 camera 16MP HDR: Mang trên mình một hệ thống camera 3 ống kính với camera chính có độ phân giải lên tới 16MP, khẩu độ f/2.2; camera phụ thứ 2 hỗ trợ chụp macro độ phân giải 2MP khẩu độ f/2.4 và cuối cùng là camera tele hỗ trợ chụp xóa phông 2MP, khẩu độ f/2.4. Với bộ 3 camera này, người dùng có thể cho ra được những bức ảnh cực kì ấn tượng theo nhiều cách khác nhau để đăng tải lên mạng chia sẻ với bạn bè. Ngoài ra, máy cũng hỗ trợ quay video 1080p với 30 khung hình/giây khá ổn định. Hiệu năng ổn định với vi xử lý Snapdragon 460: OPPO A53 được biết tới là mẫu smartphone đầu tiên trên thế giới được trang bị bộ vi xử lý Snapdragon 460 mới nhất của Qualcomm. Theo Qualcomm, smartphone khi được tích hợp bộ vi xử lý Snapdragon 460 sẽ cho hiệu suất “nhảy vọt” so với những dòng vi xử lý Snapdragon 4xx cũ trước đây. Mọi thao tác của người dùng trên OPPO A53 sẽ được xử lý một cách nhanh gọn và mượt mà nhất. Không chỉ vậy, máy cũng sẽ mang tới cho người dùng những trải nghiệm gaming ở mức độ khá, ổn định trong tầm giá.', 1, N'RM', 117, N'PK', 0)
INSERT [dbo].[SanPham] VALUES ( N'Tai nghe A55 4GB/64GB', 100, 4490000, N'Thiết kế sang trọng: OPPO A55 có thiết kế hiện đại, mặt kính bóng loáng, màn hình có khung viền mỏng, độ rộng lên đến 6.51 inch, người dùng sẽ thỏa sức xem phim với màn hình này. Kích thước máy vừa phải, cầm nắm dễ dàng hơn, các nút âm lượng bố trí vừa tầm tay người dùng. OPPO A55 cho cảm giác cầm nắm vừa vặn và thoải mái cho tay người dùng, sử dụng lâu sẽ có trải nghiệm thoải mái và chắc chắn. Camera sắc nét: Cụm Camera trên OPPO A55 được xếp dọc ở mặt sau, bao gồm camera chính cảm biến siêu lớn lên đến 50MP, camera xoá phông 2MP và camera macro chụp cận cảnh 2MP. Hiệu năng mạnh mẽ: OPPO A55 được trang bị sức mạnh bên trang bao gồm bộ vi xử lý Mediatek Helio G35, đây là con chip cực kì quen thuộc đối với những sản phẩm có mức giá rẻ đến từ OPPO. Về cơ bản mẫu chipset này có thể đáp ứng các nhu cầu cơ bản của người dùng, có thể chơi được những tựa game nhẹ nhàng cực kì ổn. Ngoài ra máy còn được trang bị RAM 4GB và bộ nhớ trong 64GB. Có thể nói mẫu máy này phù hợp cho nhiều đối tượng như học sinh/sinh viên, những người trung niên... OPPO A55 có dung lượng lưu trữ lớn, các loại tài liệu, game nặng ký đều có thể lưu mà điện thoại vẫn còn nhiều chỗ trống. Lượng pin của điện thoại lớn lên đến 5.000mAh, người dùng sẽ thỏa sức đam mê chiến game, lướt web hơn 8 tiếng đồng hồ, khi sắp hết pin có thể sạc nhanh 18W, tiết kiệm thời gian chờ đợi.', 1, N'IP', 118, N'PK', 0)
INSERT [dbo].[SanPham] VALUES ( N'Tai nghe A72 4GB/128GB', 100, 6990000, N'Oppo A72 chính hãng sở hữu cấu hình phần cứng thiên hướng game mạnh mẽ: Nếu là một tín đồ công nghệ, chắc chắn bạn sẽ biết đến nhà sản xuất chip lừng danh Qualcomm, chuyên cung cấp các vi xử lý hiệu suất mạnh mẽ cho các smartphone Android. Trong đó, Snapdragon 665 là con chip thiên hướng game nổi trội được Qualcomm công bố phát hành trong bộ ba chip set dành riêng cho điện thoại tầm trung. Với cấu tạo đa nhân, trong đó 4 lõi 2.0Ghz, bốn nhân còn lại 1.8Ghz, con chip này đảm bảo cho Oppo A72 chạy đa nhiệm mượt mà, hiệu suất cao, cân tốt các tựa game mobile hiện hành lại đồng thời vô cùng tiết kiệm năng lượng. Oppo A72 chính hãng trang bị viên pin 5000mAh cực khủng, trải nghiệm giải trí hai ngày dài: Đối với người dùng, viên pin 5000mAh trên Oppo A72 là điểm thu hút lớn. Bởi lẽ, nhu cầu sử dụng smartphone trong cuộc sống hiện đại tăng cao, từ phục vụ công việc đến học tập và mục đích giải trí. Chính vì thế, ngoài việc họ cần một chiếc điện thoại có cấu hình khỏe thì thời lượng sử dụng bền bỉ cũng là điều họ rất quan tâm. Vượt qua định mức 4000mAh thông thường trang bị trên mặt bằng chung các smartphone, Oppo A72 sở hữu cho mình con số cực khủng 5000mAh, cho phép bạn thoải mái sử dụng điện thoại trong hai ngày. Ngoài ra, hãng thiết kế sạc nhanh công suất 18W đi kèm giúp bạn sạc pin nhanh chóng và thuận tiện hơn khi mang máy theo trong hành trình di chuyển với các chuyến công tác ngắn hạn hay những công việc có tính chất di chuyển thường xuyên hoặc trải nghiệm liên tiếp các trận game đỉnh cao. Oppo A72 chính hãng thời thượng với màn hình đục lỗ 6.5 inch rộng lớn: Sở hữu thiết kế màn hình đục lỗ góc trái hợp thời, chuẩn phong cách, tối ưu hóa không gian hiển thị, dáng vẻ Oppo A72 nổi bật không khác gì những smartphone cao cấp ra mắt trong năm nay. Máy được trang bị tấm nền IPS, kích thước 6.5 inch cùng độ phân giải 1080 x 2400 pixel, đạt mật độ điểm ảnh 405 ppi trợ giúp đắc lực cho các game thủ trong các trận chinh chiến game mobile hiện hành. Ngoài ra, màn hình được phủ kính cường lực Corning Gorilla Glass 3 nâng cao hiệu quả bảo vệ trước va đập nhẹ và chống trầy xước.', 1, N'IP', 119, N'PK', 0)
INSERT [dbo].[SanPham] VALUES ( N'Tai nghe A83 3GB/32GB', 100, 4990000, N'Oppo A72 chính hãng sở hữu cấu hình phần cứng thiên hướng game mạnh mẽ: Nếu là một tín đồ công nghệ, chắc chắn bạn sẽ biết đến nhà sản xuất chip lừng danh Qualcomm, chuyên cung cấp các vi xử lý hiệu suất mạnh mẽ cho các smartphone Android. Trong đó, Snapdragon 665 là con chip thiên hướng game nổi trội được Qualcomm công bố phát hành trong bộ ba chip set dành riêng cho điện thoại tầm trung. Với cấu tạo đa nhân, trong đó 4 lõi 2.0Ghz, bốn nhân còn lại 1.8Ghz, con chip này đảm bảo cho Oppo A72 chạy đa nhiệm mượt mà, hiệu suất cao, cân tốt các tựa game mobile hiện hành lại đồng thời vô cùng tiết kiệm năng lượng. Oppo A72 chính hãng trang bị viên pin 5000mAh cực khủng, trải nghiệm giải trí hai ngày dài: Đối với người dùng, viên pin 5000mAh trên Oppo A72 là điểm thu hút lớn. Bởi lẽ, nhu cầu sử dụng smartphone trong cuộc sống hiện đại tăng cao, từ phục vụ công việc đến học tập và mục đích giải trí. Chính vì thế, ngoài việc họ cần một chiếc điện thoại có cấu hình khỏe thì thời lượng sử dụng bền bỉ cũng là điều họ rất quan tâm. Vượt qua định mức 4000mAh thông thường trang bị trên mặt bằng chung các smartphone, Oppo A72 sở hữu cho mình con số cực khủng 5000mAh, cho phép bạn thoải mái sử dụng điện thoại trong hai ngày. Ngoài ra, hãng thiết kế sạc nhanh công suất 18W đi kèm giúp bạn sạc pin nhanh chóng và thuận tiện hơn khi mang máy theo trong hành trình di chuyển với các chuyến công tác ngắn hạn hay những công việc có tính chất di chuyển thường xuyên hoặc trải nghiệm liên tiếp các trận game đỉnh cao. Oppo A72 chính hãng thời thượng với màn hình đục lỗ 6.5 inch rộng lớn: Sở hữu thiết kế màn hình đục lỗ góc trái hợp thời, chuẩn phong cách, tối ưu hóa không gian hiển thị, dáng vẻ Oppo A72 nổi bật không khác gì những smartphone cao cấp ra mắt trong năm nay. Máy được trang bị tấm nền IPS, kích thước 6.5 inch cùng độ phân giải 1080 x 2400 pixel, đạt mật độ điểm ảnh 405 ppi trợ giúp đắc lực cho các game thủ trong các trận chinh chiến game mobile hiện hành. Ngoài ra, màn hình được phủ kính cường lực Corning Gorilla Glass 3 nâng cao hiệu quả bảo vệ trước va đập nhẹ và chống trầy xước.', 1, N'SS', 120, N'PK', 0)
INSERT [dbo].[SanPham] VALUES ( N'Tai nghe A91 8GB/128GB', 100, 6490000, N'Hệ thống 4 camera 48MP tại mặt lưng Oppo A91 chính hãng: chụp ảnh “chất lừ”: Oppo A91 chính hãng nổi bật với mặt lưng máy thiết kế cụm bốn camera sau, độ phân giải lên đến 48MP. Cùng với đó, máy được bổ sung cảm biến góc rộng 8MP, cảm biến macro 2MP, cảm biến chiều sâu 2MP. Ngoài ra, tại phần notch mặt trước của Oppo A91, camera selfie 16MP được khéo léo sắp xếp. Sự kết hợp này mang đến cho bạn những bức ảnh chụp tuyệt đẹp ở nhiều hiệu ứng và nhiều góc cảnh. Màn hình AMOLED 6.4 inch, Full HD+ siêu sắc nét trên điện thoại Oppo A91 chính hãng: Màn hình giọt nước là kiểu dáng thiết kế sở hữu nhiều ưu điểm, trong đó, nhà sản xuất chỉ giữ lại phần notch rất nhỏ gọn để chứa camera selfie của máy. Chính vì thế, toàn bộ diện tích của mặt trước sẽ được tối ưu hóa, là tiền đề phát triển mở rộng kích thước sử dụng, mang đến không gian trải nghiệm hình ảnh tốt hơn cho người dùng. Mặt khác, đây cũng được xem như xu hướng thời thượng của thế giới, được người dùng yêu thích. Oppo A91 chính hãng sở hữu chip MediaTek Helio P70 đồng bộ với GPU Mali-G72 MP3 cho hiệu năng tối đa: Helio P70 là một trong những con chip mạnh của nhà sản xuất MediaTek. Với tiến trình rút gọn 12nm cùng cấu tạo tám nhân, chip mang đến cho máy khả năng chạy đa nhiệm mượt mà. Đặc biệt, đồng bộ với GPU Mali-G72 MP3 trên nền hệ điều hành Android 9.0 (Pie) giúp máy phát huy tối đa hiệu năng, cho tốc độ xử lý thông tin, hình ảnh nhanh chóng, hiển thị liên tiếp không độ trễ. Với trang bị này từ Oppo, bạn yên tâm lướt web, xem phim, chơi game… làm mọi điều mình thích trên điện thoại A91. Oppo A91 thiết kế pin Li-Po 4025mAh trải nghiệm trọn ngày dài kèm sạc nhanh 20W thần tốc: Nhu cầu của người dùng đối với một chiếc smartphone phục vụ cho mục đích học tập hay làm việc, giải trí đều mong muốn máy có thể đáp ứng được 1 ngày sử dụng.', 1, N'IP', 121, N'PK', 0)





/* hinh anh*/
-- Dell
INSERT [dbo].[HinhAnh]  VALUES ( 1, N'Dell1.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 1, N'Dell2.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 1, N'Dell3.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 1, N'Dell4.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 1, N'Dell5.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 2, N'Dell6.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 2, N'Dell7.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 2, N'Dell8.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 2, N'Dell9.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 2, N'Dell10.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 3, N'Dell11.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 3, N'Dell12.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 3, N'Dell13.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 3, N'Dell14.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 3, N'Dell15.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 4, N'Dell16.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 4, N'Dell17.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 4, N'Dell18.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 4, N'Dell19.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 4, N'Dell20.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 5, N'Dell21.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 5, N'Dell22.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 5, N'Dell23.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 5, N'Dell24.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 5, N'Dell25.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 6, N'Dell26.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 6, N'Dell27.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 6, N'Dell28.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 6, N'Dell29.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 6, N'Dell30.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 7, N'Dell31.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 7, N'Dell32.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 7, N'Dell33.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 7, N'Dell34.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 7, N'Dell35.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 8, N'Dell36.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 8, N'Dell37.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 8, N'Dell38.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 8, N'Dell39.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 8, N'Dell40.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 9, N'Dell41.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 9, N'Dell42.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 9, N'Dell43.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 9, N'Dell44.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 9, N'Dell45.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 10, N'Dell46.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 10, N'Dell47.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 10, N'Dell48.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 10, N'Dell49.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 10, N'Dell50.jpg', 0)


INSERT [dbo].[HinhAnh]  VALUES ( 11, N'Dell51.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 11, N'Dell52.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 11, N'Dell53.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 11, N'Dell54.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 11, N'Dell55.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 12, N'Dell56.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 12, N'Dell57.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 12, N'Dell58.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 12, N'Dell59.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 12, N'Dell60.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 13, N'Dell61.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 13, N'Dell62.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 13, N'Dell63.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 13, N'Dell64.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 13, N'Dell65.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 14, N'Dell66.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 14, N'Dell67.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 14, N'Dell68.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 14, N'Dell69.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 14, N'Dell70.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 15, N'Dell71.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 15, N'Dell72.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 15, N'Dell73.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 15, N'Dell74.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 15, N'Dell75.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 16, N'Dell76.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 16, N'Dell77.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 16, N'Dell78.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 16, N'Dell79.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 16, N'Dell80.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 17, N'Dell81.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 17, N'Dell82.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 17, N'Dell83.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 17, N'Dell84.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 17, N'Dell85.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 18, N'Dell86.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 18, N'Dell87.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 18, N'Dell88.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 18, N'Dell89.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 18, N'Dell90.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 19, N'Dell91.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 19, N'Dell92.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 19, N'Dell93.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 19, N'Dell94.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 19, N'Dell95.jpg', 0)


-- Asus
INSERT [dbo].[HinhAnh]  VALUES ( 20, N'Asus91.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 20, N'Asus92.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 20, N'Asus93.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 20, N'Asus94.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 20, N'Asus95.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 21, N'Asus96.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 21, N'Asus97.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 21, N'Asus98.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 21, N'Asus99.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 21, N'Asus100.jpg', 0)



INSERT [dbo].[HinhAnh]  VALUES ( 22, N'Asus101.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 22, N'Asus102.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 22, N'Asus103.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 22, N'Asus104.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 22, N'Asus105.jpg', 0)


INSERT [dbo].[HinhAnh]  VALUES ( 23, N'Asus106.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 23, N'Asus107.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 23, N'Asus108.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 23, N'Asus109.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 23, N'Asus110.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 24, N'Asus111.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 24, N'Asus112.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 24, N'Asus113.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 24, N'Asus114.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 24, N'Asus115.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 25, N'Asus116.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 25, N'Asus117.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 25, N'Asus118.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 25, N'Asus119.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 25, N'Asus120.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 26, N'Asus121.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 26, N'Asus122.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 26, N'Asus123.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 26, N'Asus124.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 26, N'Asus125.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 27, N'Asus126.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 27, N'Asus127.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 27, N'Asus128.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 27, N'Asus129.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 27, N'Asus130.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 28, N'Asus131.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 28, N'Asus132.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 28, N'Asus133.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 28, N'Asus134.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 28, N'Asus135.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 29, N'Asus136.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 29, N'Asus137.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 29, N'Asus138.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 29, N'Asus139.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 29, N'Asus140.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 30, N'Asus141.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 30, N'Asus142.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 30, N'Asus143.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 30, N'Asus144.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 30, N'Asus145.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 31, N'Asus146.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 31, N'Asus147.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 31, N'Asus148.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 31, N'Asus149.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 31, N'Asus150.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 32, N'Asus151.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 32, N'Asus152.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 32, N'Asus153.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 32, N'Asus154.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 32, N'Asus155.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 33, N'Asus156.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 33, N'Asus157.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 33, N'Asus158.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 33, N'Asus159.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 33, N'Asus160.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 34, N'Asus161.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 34, N'Asus162.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 34, N'Asus163.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 34, N'Asus164.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 34, N'Asus165.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 35, N'Asus166.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 35, N'Asus167.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 35, N'Asus168.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 35, N'Asus169.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 35, N'Asus170.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 36, N'Asus171.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 36, N'Asus172.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 36, N'Asus173.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 36, N'Asus174.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 36, N'Asus175.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 37, N'Asus176.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 37, N'Asus177.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 37, N'Asus178.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 37, N'Asus179.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 37, N'Asus180.jpg', 0)

-- LenoVo
INSERT [dbo].[HinhAnh]  VALUES ( 38, N'Lenovo181.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 38, N'Lenovo182.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 38, N'Lenovo183.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 38, N'Lenovo184.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 38, N'Lenovo185.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 39, N'Lenovo186.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 39, N'Lenovo187.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 39, N'Lenovo188.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 39, N'Lenovo189.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 39, N'Lenovo190.jpg', 0)
-----
INSERT [dbo].[HinhAnh]  VALUES ( 40, N'Lenovo191.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 40, N'Lenovo192.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 40, N'Lenovo193.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 40, N'Lenovo194.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 40, N'Lenovo195.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 41, N'Lenovo196.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 41, N'Lenovo197.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 41, N'Lenovo198.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 41, N'Lenovo199.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 41, N'Lenovo200.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 42, N'Lenovo201.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 42, N'Lenovo202.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 42, N'Lenovo203.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 42, N'Lenovo204.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 42, N'Lenovo205.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 43, N'Lenovo206.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 43, N'Lenovo207.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 43, N'Lenovo208.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 43, N'Lenovo209.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 43, N'Lenovo210.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 44, N'Lenovo211.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 44, N'Lenovo212.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 44, N'Lenovo213.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 44, N'Lenovo214.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 44, N'Lenovo215.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 45, N'Lenovo216.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 45, N'Lenovo217.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 45, N'Lenovo218.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 45, N'Lenovo219.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 45, N'Lenovo220.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 46, N'Lenovo221.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 46, N'Lenovo222.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 46, N'Lenovo223.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 46, N'Lenovo224.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 46, N'Lenovo225.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 47, N'Lenovo226.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 47, N'Lenovo227.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 47, N'Lenovo228.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 47, N'Lenovo229.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 47, N'Lenovo230.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 48, N'Lenovo231.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 48, N'Lenovo232.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 48, N'Lenovo233.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 48, N'Lenovo234.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 48, N'Lenovo235.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 49, N'Lenovo236.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 49, N'Lenovo237.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 49, N'Lenovo238.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 49, N'Lenovo239.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 49, N'Lenovo240.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 50, N'Lenovo241.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 50, N'Lenovo242.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 50, N'Lenovo243.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 50, N'Lenovo244.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 50, N'Lenovo245.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 51, N'Lenovo246.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 51, N'Lenovo247.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 51, N'Lenovo248.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 51, N'Lenovo249.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 51, N'Lenovo250.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 52, N'Lenovo251.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 52, N'Lenovo252.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 52, N'Lenovo253.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 52, N'Lenovo254.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 52, N'Lenovo255.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 53, N'Lenovo256.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 53, N'Lenovo257.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 53, N'Lenovo258.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 53, N'Lenovo259.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 53, N'Lenovo260.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 54, N'Lenovo261.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 54, N'Lenovo262.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 54, N'Lenovo263.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 54, N'Lenovo264.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 54, N'Lenovo265.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 55, N'Lenovo266.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 55, N'Lenovo267.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 55, N'Lenovo268.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 55, N'Lenovo269.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 55, N'Lenovo270.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 56, N'Lenovo271.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 56, N'Lenovo272.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 56, N'Lenovo273.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 56, N'Lenovo274.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 56, N'Lenovo275.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 57, N'Lenovo276.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 57, N'Lenovo277.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 57, N'Lenovo278.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 57, N'Lenovo279.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 57, N'Lenovo280.jpg', 0)
---58
INSERT [dbo].[HinhAnh]  VALUES ( 58, N'Lenovo281.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 58, N'Lenovo282.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 58, N'Lenovo283.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 58, N'Lenovo284.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 58, N'Lenovo285.jpg', 0)

-- MSI
INSERT [dbo].[HinhAnh]  VALUES ( 59, N'MSI286.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 59, N'MSI287.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 59, N'MSI288.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 59, N'MSI289.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 59, N'MSI290.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 60, N'MSI291.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 60, N'MSI292.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 60, N'MSI293.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 60, N'MSI294.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 60, N'MSI295.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 61, N'MSI296.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 61, N'MSI297.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 61, N'MSI298.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 61, N'MSI299.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 61, N'MSI300.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 62, N'MSI301.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 62, N'MSI302.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 62, N'MSI303.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 62, N'MSI304.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 62, N'MSI305.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 63, N'MSI306.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 63, N'MSI307.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 63, N'MSI308.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 63, N'MSI309.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 63, N'MSI310.jpg', 0)


INSERT [dbo].[HinhAnh]  VALUES ( 64, N'MSI311.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 64, N'MSI312.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 64, N'MSI313.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 64, N'MSI314.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 64, N'MSI315.jpg', 0)


INSERT [dbo].[HinhAnh]  VALUES ( 65, N'MSI316.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 65, N'MSI317.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 65, N'MSI318.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 65, N'MSI319.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 65, N'MSI320.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 66, N'MSI321.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 66, N'MSI322.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 66, N'MSI323.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 66, N'MSI324.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 66, N'MSI325.jpg', 0)
------------ sai 
INSERT [dbo].[HinhAnh]  VALUES ( 67, N'MSI326.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 67, N'MSI327.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 67, N'MSI328.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 67, N'MSI329.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 67, N'MSI330.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 68, N'MSI331.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 68, N'MSI332.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 68, N'MSI333.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 68, N'MSI334.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 68, N'MSI335.jpg', 0)
---------------------------------------------------------------- sai cmnr 
INSERT [dbo].[HinhAnh]  VALUES ( 69, N'MSI336.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 69, N'MSI337.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 69, N'MSI338.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 69, N'MSI339.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 69, N'MSI340.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 70, N'MSI341.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 70, N'MSI342.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 70, N'MSI343.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 70, N'MSI344.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 70, N'MSI345.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 71, N'MSI346.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 71, N'MSI347.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 71, N'MSI348.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 71, N'MSI349.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 71, N'MSI350.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 72, N'MSI351.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 72, N'MSI352.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 72, N'MSI353.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 72, N'MSI354.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 72, N'MSI355.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 73, N'MSI356.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 73, N'MSI357.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 73, N'MSI358.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 73, N'MSI359.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 73, N'MSI360.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 74, N'MSI361.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 74, N'MSI362.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 74, N'MSI363.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 74, N'MSI364.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 74, N'MSI365.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 75, N'MSI366.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 75, N'MSI367.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 75, N'MSI368.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 75, N'MSI369.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 75, N'MSI370.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 76, N'MSI371.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 76, N'MSI372.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 76, N'MSI373.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 76, N'MSI374.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 76, N'MSI375.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 77, N'MSI376.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 77, N'MSI377.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 77, N'MSI378.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 77, N'MSI379.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 77, N'MSI380.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 78, N'MSI381.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 78, N'MSI382.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 78, N'MSI383.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 78, N'MSI384.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 78, N'MSI385.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 79, N'MSI386.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 79, N'MSI387.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 79, N'MSI388.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 79, N'MSI389.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 79, N'MSI390.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 80, N'MSI391.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 80, N'MSI392.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 80, N'MSI393.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 80, N'MSI394.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 80, N'MSI395.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 81, N'MSI396.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 81, N'MSI397.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 81, N'MSI398.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 81, N'MSI399.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 81, N'MSI400.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 82, N'MSI401.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 82, N'MSI402.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 82, N'MSI403.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 82, N'MSI404.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 82, N'MSI405.jpg', 0)
--83
INSERT [dbo].[HinhAnh]  VALUES ( 83, N'MSI406.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 83, N'MSI407.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 83, N'MSI408.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 83, N'MSI409.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 83, N'MSI410.jpg', 0)


-- ACER
INSERT [dbo].[HinhAnh]  VALUES ( 84, N'Acer411.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 84, N'Acer412.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 84, N'Acer413.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 84, N'Acer414.jpg', 0)
											  
INSERT [dbo].[HinhAnh]  VALUES ( 85, N'Acer415.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 85, N'Acer416.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 85, N'Acer417.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 85, N'Acer418.jpg', 0)
											 
INSERT [dbo].[HinhAnh]  VALUES ( 86, N'Acer419.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 86, N'Acer420.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 86, N'Acer421.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 86, N'Acer422.jpg', 0)
											
INSERT [dbo].[HinhAnh]  VALUES ( 87, N'Acer423.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 87, N'Acer424.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 87, N'Acer425.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 87, N'Acer426.jpg', 0)
											
INSERT [dbo].[HinhAnh]  VALUES ( 88, N'Acer427.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 88, N'Acer428.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 88, N'Acer429.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 88, N'Acer430.jpg', 0)
											
INSERT [dbo].[HinhAnh]  VALUES ( 89, N'Acer431.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 89, N'Acer432.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 89, N'Acer433.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 89, N'Acer434.jpg', 0)
											 
INSERT [dbo].[HinhAnh]  VALUES ( 90, N'Acer435.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 90, N'Acer436.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 90, N'Acer437.jpg', 0)
											
INSERT [dbo].[HinhAnh]  VALUES ( 91, N'Acer438.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 91, N'Acer439.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 91, N'Acer440.jpg', 0)
											 
INSERT [dbo].[HinhAnh]  VALUES ( 92, N'Acer441.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 92, N'Acer442.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 92, N'Acer443.jpg', 0)


-- HP
INSERT [dbo].[HinhAnh]  VALUES ( 93, N'HP444.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 93, N'HP445.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 93, N'HP446.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 93, N'HP447.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 93, N'HP448.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 94, N'HP449.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 94, N'HP450.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 94, N'HP451.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 94, N'HP452.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 94, N'HP453.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 95, N'HP454.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 95, N'HP455.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 95, N'HP456.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 95, N'HP457.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 95, N'HP458.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 96, N'HP459.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 96, N'HP460.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 96, N'HP461.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 96, N'HP462.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 96, N'HP463.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 97, N'HP464.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 97, N'HP465.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 97, N'HP466.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 97, N'HP467.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 97, N'HP468.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 98, N'HP469.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 98, N'HP470.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 98, N'HP471.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 98, N'HP472.jpg', 0)


-- LG
INSERT [dbo].[HinhAnh]  VALUES ( 99, N'lg473.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 99, N'lg474.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 99, N'lg475.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 99, N'lg476.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 99, N'lg477.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 100, N'lg478.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 100, N'lg479.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 100, N'lg480.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 100, N'lg481.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 100, N'lg482.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 101, N'lg483.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 101, N'lg484.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 101, N'lg485.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 101, N'lg486.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 101, N'lg487.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 102, N'lg488.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 102, N'lg489.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 102, N'lg490.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 102, N'lg491.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 102, N'lg492.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 103, N'lg493.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 103, N'lg494.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 103, N'lg495.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 103, N'lg496.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 103, N'lg497.jpg', 0)


INSERT [dbo].[HinhAnh]  VALUES ( 104, N'lg498.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 104, N'lg499.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 104, N'lg500.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 104, N'lg501.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 104, N'lg502.jpg', 0)


INSERT [dbo].[HinhAnh]  VALUES ( 105, N'lg503.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 105, N'lg504.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 105, N'lg505.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 105, N'lg506.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 105, N'lg507.jpg', 0)


INSERT [dbo].[HinhAnh]  VALUES ( 106, N'lg508.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 106, N'lg509.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 106, N'lg510.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 106, N'lg511.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 106, N'lg512.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 107, N'lg513.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 107, N'lg514.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 107, N'lg515.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 107, N'lg516.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 107, N'lg517.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 108, N'lg518.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 108, N'lg519.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 108, N'lg520.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 108, N'lg521.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 108, N'lg522.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 109, N'lg523.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 109, N'lg524.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 109, N'lg525.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 109, N'lg526.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 109, N'lg527.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 110, N'lg528.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 110, N'lg529.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 110, N'lg530.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 110, N'lg531.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 110, N'lg532.jpg', 0)

-- Phụ kiện
INSERT [dbo].[HinhAnh]  VALUES ( 111, N'dlinel-1m.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 111, N'dlinel-1m.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 111, N'dlinel-1m.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 111, N'dlinel-1m.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 111, N'dlinel-1m.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 112, N'apple-type-c.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 112, N'apple-type-c.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 112, N'apple-type-c.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 112, N'apple-type-c.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 112, N'apple-type-c.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 113, N'dpod-army.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 113, N'dpod-army.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 113, N'dpod-army.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 113, N'dpod-army.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 113, N'dpod-army.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 114, N'samsung-galaxy-s10.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 114, N'samsung-galaxy-s10.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 114, N'samsung-galaxy-s10.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 114, N'samsung-galaxy-s10.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 114, N'samsung-galaxy-s10.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 115, N'bwoo-dpod.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 115, N'bwoo-dpod.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 115, N'bwoo-dpod.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 115, N'bwoo-dpod.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 115, N'bwoo-dpod.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 116, N'airpod3.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 116, N'airpod3-1.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 116, N'airpod3-2.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 116, N'airpod3-3.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 116, N'airpod3-4.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 117, N'enco bud.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 117, N'enco bud-1.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 117, N'enco bud-2.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 117, N'enco bud-3.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 117, N'enco bud-4.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 118, N'Buds-Live.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 118, N'Buds-Live-1.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 118, N'Buds-Live-2.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 118, N'Buds-Live-3.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 118, N'Buds-Live-4.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 119, N'bud pro.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 119, N'bud pro 1.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 119, N'bud pro.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 119, N'bud pro.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 119, N'bud pro.jpg', 0)


INSERT [dbo].[HinhAnh]  VALUES ( 120, N'drop pro light.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 120, N'drop pro light-1.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 120, N'drop pro light-2.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 120, N'drop pro light-3.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 120, N'drop pro light-4.jpg', 0)

INSERT [dbo].[HinhAnh]  VALUES ( 121, N't5 2.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 121, N't5 2-1.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 121, N't5 2.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 121, N't5 2.jpg', 0)
INSERT [dbo].[HinhAnh]  VALUES ( 121, N't5 2.jpg', 0)


/* vai trò */
INSERT INTO VaiTro VALUES ('QL', N'Quản lý')
INSERT INTO VaiTro VALUES ('NV', N'Nhân viên')
INSERT INTO VaiTro VALUES ('KH', N'Khách hàng')


/* khach hang*/
INSERT [dbo].[KhachHang]  VALUES (N'long', N'123', N'Châu Diệu Long', N'longcdps16807@fpt.edu.vn', N'0362204475', N'Lê Đức Thọ, Gò Vấp, TP HCM' , 0, 'KH')
INSERT [dbo].[KhachHang]  VALUES (N'minhlong', N'123', N'Nguyễn Minh Long', N'longmt@gmail.com', N'0947583927', N'Quang Trung, quận Gò Vấp, TP HCM', 0, 'KH')
INSERT [dbo].[KhachHang]  VALUES (N'thanh', N'123', N'Nguyễn Chí Thành', N'thanhnt@gmail.com', N'0987364909', N'Tô Kí, quận 12, TP HCM', 0, 'KH')
INSERT [dbo].[KhachHang]  VALUES (N'thuyh', N'123', N'Bùi Thị Kim Thúy', N'thuy@gmail.com', N'0937584245', N'Phạm Văn Chiêu, Gò Vấp, TP HCM', 0, 'KH')
INSERT [dbo].[KhachHang]  VALUES (N'uyen', N'123', N'Phạm Tường Uyên', N'uyenpt@gmail.com', N'0789438540', N'Nguyễn Kiệm, quận Phú Nhuận, TP HCM', 0, 'KH')


/* nhan vien*/
INSERT [dbo].[NhanVien]  VALUES (N'dieulong', N'123', N'Châu Diệu Long', N'longcd@gmail.com', N'0362204475', N'HCM', CAST(N'2002-05-10' AS Date), 0, 'QL')
INSERT [dbo].[NhanVien]  VALUES (N'dung', N'123', N'Hoàng Mạnh Dũng', N'hungth@gmail.com', N'0903423218', N'HCM', CAST(N'2000-08-08' AS Date), 0, 'NV')
INSERT [dbo].[NhanVien]  VALUES (N'huy', N'123', N'Trần Nhật Huy', N'huypvn@gmail.com', N'0859473453', N'HCM', CAST(N'2002-10-10' AS Date), 0, 'NV')
INSERT [dbo].[NhanVien]  VALUES (N'tam', N'123', N'Nguyễn Văn Tâm', N'nguyenvt@gmail.com', N'0947584738', N'HCM', CAST(N'2001-12-07' AS Date), 0, 'NV')
INSERT [dbo].[NhanVien]  VALUES (N'tu', N'123', N'Nguyễn Đỗ Thanh Tú', N'taibt@gmail.com', N'0786432812', N'HCM', CAST(N'2002-10-06' AS Date), 0, 'NV')
INSERT [dbo].[NhanVien]  VALUES (N'teo', N'123 ', N'Nguyễn Văn Tèo', N'teoonv@gmail.com', N'0957384729', N'', CAST(N'1990-12-01' AS Date), 0, 'QL')





