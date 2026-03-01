UPDATE Ban
SET TrangThaiBan = N'Hoạt động'
WHERE TrangThaiBan = 'Hoat dong';
UPDATE Ban
SET TrangThaiBan = N'Trống'
WHERE TrangThaiBan = 'Trong';
UPDATE Ban
SET TrangThaiBan = N'Bảo trì'
WHERE TrangThaiBan = 'Bao tri';

SELECT DISTINCT TrangThaiBan FROM Ban;
ALTER TABLE Ban
ALTER COLUMN TrangThaiBan NVARCHAR(20);

UPDATE Ban SET TrangThaiBan = N'Hoạt động' WHERE TrangThaiBan LIKE '%d?ng%';
UPDATE Ban SET TrangThaiBan = N'Bảo trì' WHERE TrangThaiBan LIKE '%B?o trì%';
UPDATE Ban SET TrangThaiBan = N'Trống' WHERE TrangThaiBan LIKE '%tr%';

update CaChoi
set TrangThaiCaThuc = N'Kết thúc'
where TrangThaiCaThuc like 'K?t%'

ALTER TABLE CaChoi
ALTER COLUMN TrangThaiCaThuc NVARCHAR(50);

ALTER TABLE NhanVien
ALTER COLUMN TenNV NVARCHAR(50);

ALTER TABLE NhanVien
ALTER COLUMN VaiTro NVARCHAR(30);

ALTER TABLE NhanVien
ALTER COLUMN TrangThaiLamViec NVARCHAR(30);

CREATE TABLE PhieuDoUong_New (
    MaPhieu INT IDENTITY(1,1) PRIMARY KEY,
    MaCaChoi VARCHAR(20),
    MaDoUong varchar(10),
	SoLuong int,
	ThanhTien decimal(10,2)
    
);

INSERT INTO PhieuDoUong_New (MaCaChoi,MaDoUong,SoLuong,ThanhTien)
SELECT MaCaChoi,MaDoUong,SoLuong,ThanhTien FROM PhieuDoUong;

DROP TABLE PhieuDoUong;

EXEC sp_rename 'PhieuDoUong_New', 'PhieuDoUong';


ALTER TABLE DoUong
ALTER COLUMN tendouong NVARCHAR(50);