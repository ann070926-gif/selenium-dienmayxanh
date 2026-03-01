--create database BidaShop
use BidaShop

-- T?o và thêm d? li?u m?u cho NhanVien
CREATE TABLE NhanVien (
    MaNhanVien VARCHAR(10) PRIMARY KEY,
    TenNV VARCHAR(50),
    TenDangNhap VARCHAR(50),
    MatKhau VARCHAR(100),
    VaiTro VARCHAR(20),
    SDT VARCHAR(15),
    TrangThaiLamViec VARCHAR(20)
);
INSERT INTO NhanVien (MaNhanVien, TenNV, TenDangNhap, MatKhau, VaiTro, SDT, TrangThaiLamViec) VALUES
('NV001', 'Nguyen Van A', 'nva', '123456', 'QuanLy', '0901234567', 'DangLam'),
('NV002', 'Tran Thi B', 'ttb', '654321', 'NhanVien', '0912345678', 'DangLam'),
('NV003', 'Le Van C', 'lvc', '789101', 'NhanVien', '0923456789', 'DangLam');

-- T?o và thêm d? li?u m?u cho Ban
CREATE TABLE Ban (
    MaBan VARCHAR(10) PRIMARY KEY,
    TenBan VARCHAR(50),
    GiaBan DECIMAL(10, 2),
    TrangThaiBan VARCHAR(20)
);
INSERT INTO Ban (MaBan, TenBan, GiaBan, TrangThaiBan) VALUES
('B001', 'Ban 1', 50000.00, 'Trong'),
('B002', 'Ban 2', 60000.00, 'DaDat'),
('B003', 'Ban 3', 55000.00, 'DangSuDung');

-- T?o và thêm d? li?u m?u cho CaChoi
CREATE TABLE CaChoi (
    MaCaChoi VARCHAR(10) PRIMARY KEY,
    MaBan VARCHAR(10),
    MaNVBatDau VARCHAR(10),
    ThoiGianBatDau DATETIME,
    ThoiGianKetThuc DATETIME,
    TrangThaiCaThuc VARCHAR(20),
    TongTienCa DECIMAL(10, 2),
    FOREIGN KEY (MaBan) REFERENCES Ban(MaBan),
    FOREIGN KEY (MaNVBatDau) REFERENCES NhanVien(MaNhanVien)
);
INSERT INTO CaChoi (MaCaChoi, MaBan, MaNVBatDau, ThoiGianBatDau, ThoiGianKetThuc, TrangThaiCaThuc, TongTienCa) VALUES
('CC001', 'B001', 'NV001', '2025-07-21 18:00:00', '2025-07-21 20:00:00', 'HoanTat', 100000.00),
('CC002', 'B002', 'NV002', '2025-07-21 19:00:00', NULL, 'DangChoi', 60000.00),
('CC003', 'B003', 'NV003', '2025-07-21 17:00:00', '2025-07-21 19:00:00', 'HoanTat', 110000.00);

-- T?o và thêm d? li?u m?u cho LichSuGiaGioChoi
CREATE TABLE LichSuGiaGioChoi (
    MaLichSuGia VARCHAR(10) PRIMARY KEY,
    MaBan VARCHAR(10),
    GiaCu DECIMAL(10, 2),
    GiaMoi DECIMAL(10, 2),
    NgayCapNhat DATETIME,
    MaNVThayDoi VARCHAR(10),
    FOREIGN KEY (MaBan) REFERENCES Ban(MaBan),
    FOREIGN KEY (MaNVThayDoi) REFERENCES NhanVien(MaNhanVien)
);
INSERT INTO LichSuGiaGioChoi (MaLichSuGia, MaBan, GiaCu, GiaMoi, NgayCapNhat, MaNVThayDoi) VALUES
('LSG001', 'B001', 45000.00, 50000.00, '2025-07-20 10:00:00', 'NV001'),
('LSG002', 'B002', 55000.00, 60000.00, '2025-07-20 11:00:00', 'NV002'),
('LSG003', 'B003', 50000.00, 55000.00, '2025-07-21 09:00:00', 'NV003');

-- T?o và thêm d? li?u m?u cho DoUong
CREATE TABLE DoUong (
    MaDoUong VARCHAR(10) PRIMARY KEY,
    TenDoUong VARCHAR(50),
    GiaBan DECIMAL(10, 2),
    TrangThaiDoUong VARCHAR(20)
);
INSERT INTO DoUong (MaDoUong, TenDoUong, GiaBan, TrangThaiDoUong) VALUES
('DU001', 'Nuoc Ngot', 15000.00, 'CoSan'),
('DU002', 'Tra Dao', 20000.00, 'CoSan'),
('DU003', 'Ca Phe Den', 18000.00, 'CoSan');

-- T?o và thêm d? li?u m?u cho PhieuDoUong
CREATE TABLE PhieuDoUong (
    MaPhieu VARCHAR(10) PRIMARY KEY,
    MaCaChoi VARCHAR(10),
    MaDoUong VARCHAR(10),
    SoLuong INT,
    ThanhTien DECIMAL(10, 2),
    FOREIGN KEY (MaCaChoi) REFERENCES CaChoi(MaCaChoi),
    FOREIGN KEY (MaDoUong) REFERENCES DoUong(MaDoUong)
);
INSERT INTO PhieuDoUong (MaPhieu, MaCaChoi, MaDoUong, SoLuong, ThanhTien) VALUES
('PD001', 'CC001', 'DU001', 2, 30000.00),
('PD002', 'CC002', 'DU002', 1, 20000.00),
('PD003', 'CC003', 'DU003', 1, 18000.00);

-- T?o và thêm d? li?u m?u cho BaoCaoDoanhThu
CREATE TABLE BaoCaoDoanhThu (
    NgayBaoCao DATE,
    DoanhThuBanChoi DECIMAL(10, 2),
    DoanhThuDoUong DECIMAL(10, 2),
    TongDoanhThu DECIMAL(10, 2),
    IDBaoCao VARCHAR(10) PRIMARY KEY,
    NhanVienLapBaoCao VARCHAR(10),
    FOREIGN KEY (NhanVienLapBaoCao) REFERENCES NhanVien(MaNhanVien)
);
INSERT INTO BaoCaoDoanhThu (NgayBaoCao, DoanhThuBanChoi, DoanhThuDoUong, TongDoanhThu, IDBaoCao, NhanVienLapBaoCao) VALUES
('2025-07-21', 210000.00, 68000.00, 278000.00, 'BC001', 'NV001'),
('2025-07-20', 160000.00, 40000.00, 200000.00, 'BC002', 'NV002'),
('2025-07-19', 110000.00, 18000.00, 128000.00, 'BC003', 'NV003');

ALTER TABLE PhieuDoUong
ADD CONSTRAINT FK_PhieuDoUong_DoUong
FOREIGN KEY (MaDoUong) REFERENCES DoUong(MaDoUong);

ALTER TABLE PhieuDoUong
ALTER COLUMN MaCaChoi varchar(10);

ALTER TABLE PhieuDoUong
ADD CONSTRAINT FK_PhieuDoUong_CaChoi
FOREIGN KEY (MaCaChoi) REFERENCES CaChoi(MaCaChoi);