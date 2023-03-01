--1. Liệt kê danh sách tất cả các nhân viên
SELECT * FROM NHANVIEN;
--2. Tìm các nhân viên làm việc ở phòng số 5
select *
	from nhanvien
	where nhanvien.phg=5
--3.Liệt kê họ tên và phòng làm việc các nhân viên có mức lương trên 6.000.000 đồng
select*
	from NHANVIEN
	where NHANVIEN.LUONG>6000000
--4. Tìm các nhân viên có mức lương trên 6.500.000 ở phòng 1 hoặc các nhân viên có mức lương trên 5.000.000 ở phòng 4
select *
	from nhanvien
	where NHANVIEN.LUONG>6500000 and NHANVIEN.PHG=1 or NHANVIEN.LUONG>5000000 and NHANVIEN.PHG=4
--5. Cho biết họ tên đầy đủ của các nhân viên ở TP Quảng Ngãi
SELECT HONV + ' ' + TENLOT + ' ' + TENNV as 'Họ Và Tên'
FROM NHANVIEN 
WHERE DCHI LIKE N'%TP.Quảng Ngãi%'
--6. Cho biết họ tên đầy đủ của các nhân viên có họ bắt đầu bằng ký tự N;
select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ Và Tên'
	from NHANVIEN
	where NHANVIEN.HONV like N'N%'
--7. Cho biết ngày sinh và địa chỉ của nhân viên Cao Thanh Huyền
select NGSINH,DCHI
	from NHANVIEN
	where HONV = N'Cao' and TENLOT=N'Thanh' and TENNV=N'Huyền'
--8. Cho biết các nhân viên có năm sinh trong khoảng 1955 đến 1975
select *
	from NHANVIEN
	where Year(NGSINH) Between 1955 and 1975
--9. Cho biết các nhân viên và năm sinh của nhân viên
select TENNV,Year(NGSINH) as 'Năm sinh'
	from NHANVIEN
--10. Cho biết họ tên và tuổi của tất cả các nhân viên
select TENNV,Year(getdate())-Year(NGSINH) as 'Tuổi'
	from NHANVIEN
--11. Tìm tên những người trưởng phòng của từng phòng ban
select HONV+ ' ' +TENLOT+ ' ' +TENNV as 'Họ Và Tên Trưởng Phòng'
	from PHONGBAN,NHANVIEN
	where PHONGBAN.TRPHG=NHANVIEN.MANV
--12. Tìm tên và địa chỉ của tất cả các nhân viên của phòng Điều hành;
select TENNV,DCHI
	from PHONGBAN,NHANVIEN
	where PHONGBAN.MAPHG = NHANVIEN.PHG and TENPHG like N'Điều hành'

	select*
	from phongban
--13. Với mỗi đề án ở Tp Quảng Ngãi, cho biết tên đề án, tên phòng ban, họ tên và ngày nhận chức của trưởng phòng của phòng ban chủ trì đề án đó. 
	select TENDEAN,TENPHG,HONV,TENNV
	from NHANVIEN,PHONGBAN,DEAN
	where NHANVIEN.MANV = PHONGBAN.TRPHG and PHONGBAN.MAPHG = DEAN.PHONG and DEAN.DDIEM_DA like N'Hà Nội'

	select*
	from phongban
	select*
	from DEAN
--14. Tìm tên những nữ nhân viên và tên người thân của họ
select TENNV,TENTN
	from NHANVIEN,THANNHAN
	where NHANVIEN.MANV = THANNHAN.MA_NVIEN and NHANVIEN.PHAI like N'Nữ'
--15. Với mỗi nhân viên, cho biết họ tên của nhân viên, họ tên trưởng phòng của phòng ban mà nhân viên đó đang làm việc.
SELECT DISTINCT nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV AS 'Họ và tên nhân viên', tp.HONV + ' ' + tp.TENLOT + ' ' + tp.TENNV AS 'Họ và tên trưởng phòng'
FROM NHANVIEN nv, NHANVIEN tp,PHONGBAN pb
Where tp.manv = pb.TRPHG and nv.phg = tp.phg
--16. Tên những nhân viên phòng Nghiên cứu có tham gia vào đề án Xây dựng nhà máy chế biến thủy sản;
SELECT DISTINCT nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV AS 'Họ Tên'
FROM NHANVIEN nv, DEAN da
WHERE nv.MANV = da.DDIEM_DA
AND nv.PHG = 5 -- phòng Nghiên cứu có mã là 5 (trong ví dụ này)
AND da.TENDEAN LIKE N'Xây dựng nhà máy chế biến thủy sản';
select *from DEAN
select *from PHONGBAN
--17. Cho biết tên các đề án mà nhân viên Trần Thanh Tâm đã tham gia.
select DEAN.TENDEAN
	from NHANVIEN,PHANCONG,DEAN
	where NHANVIEN.MANV = PHANCONG.MA_NVIEN and PHANCONG.MADA= DEAN.MADA and HONV = N'Trần' and TENLOT=N'Thanh' and TENNV=N'Tâm'

