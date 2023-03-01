--18. Cho biết số lượng đề án của công ty
select count(*)
	from dean
--19. Liệt kê danh sách các phòng ban có tham gia chủ trì các đề án
select TENDEAN,TENPHG
	from PHONGBAN,DEAN
	where PHONGBAN.MAPHG = DEAN.PHONG
--20. Cho biết số lượng các phòng ban có tham gia chủ trì các đề án
select TENDEAN,TENPHG
	from PHONGBAN,DEAN
	where PHONGBAN.MAPHG = DEAN.PHONG

	select*
	from phongban
	select*
	from DEAN
--21. Cho biết số lượng đề án do phòng Nghiên Cứu chủ trì
select count(*)
	from PHONGBAN,DEAN
	where PHONG=MAPHG and TENPHG like N'Nghiên cứu'

	--dean
	select *
	from dean
	--phancong
	select *
	from PHANCONG
	--nhanvien
	select*
	from NHANVIEN
--22. Cho biết lương trung bình của các nữ nhân viên
select avg(LUONG) as 'Lương Trung Bình của các NV nữ'
	from NHANVIEN
	where phai like N'Nữ'
--23. Cho biết số thân nhân của nhân viên Đinh Bá Tiến
select count(*) as 'Số thân nhân của tiến'
	from NHANVIEN,THANNHAN
	where MANV=MA_NVIEN and HONV = N'Đinh' and TENLOT=N'Bá' and TENNV=N'Tiến'
--24. Liệt kê danh sách 3 nhân viên lớn tuổi nhất, danh sách bao gồm họ tên và năm sinh.
SELECT TOP 3 HONV + ' ' + TENLOT + ' ' + TENNV AS 'Họ và Tên', YEAR(NGSINH) AS 'Năm sinh'
FROM NHANVIEN
ORDER BY NGSINH ASC
--25. Với mỗi đề án, liệt kê mã đề án và tổng số giờ làm việc của tất cả các nhân viên tham gia đề án đó.
select dean.TENDEAN,sum(PHANCONG.THOIGIAN) as 'Tổng giờ làm'
	from PHANCONG,DEAN
	where PHANCONG.MADA = DEAN.MADA
	group by DEAN.TENDEAN
--26. Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc của tất cả các nhân viên tham gia đề án đó.
select dean.TENDEAN,sum(PHANCONG.THOIGIAN) as 'Tổng giờ làm'
	from PHANCONG,DEAN
	where PHANCONG.MADA = DEAN.MADA
	group by DEAN.TENDEAN
--27. Với mỗi đề án, cho biết có bao nhiêu nhân viên tham gia đề án đó, thông tin bao gồm tên đề án và số lượng nhân viên.
select MADA, count(*)
	from PHANCONG,NHANVIEN
	where MANV=MA_NVIEN
	group by MADA
--28. Với mỗi nhân viên, cho biết họ và tên nhân viên và số lượng thân nhân của nhân viên đó.
select HONV+' '+TENNV as 'Họ Và Tên',count(*) as 'Số lượng thân nhân'
	from NHANVIEN,THANNHAN
	where MANV = MA_NVIEN
	group by HONV,TENNV
--29. Với mỗi nhân viên, cho biết họ tên của nhân viên và số lượng đề án mà nhân viên đó đã tham gia.
select honv,tennv,count(*)
	from NHANVIEN,PHANCONG
	where MANV=MA_NVIEN
	group by honv,tennv
--30. Với mỗi phòng ban, liệt kê tên phòng ban và lương trung bình của những nhân viên làm việc cho phòng ban đó.
select TENPHG,AVG(LUONG)
	from PHONGBAN,NHANVIEN
	where maphg=PHG
	group by TENPHG
--31. Với các phòng ban có mức lương trung bình trên 5.200.000, liệt kê tên phòng ban và số lượng nhân viên của phòng ban đó.
select TENPHG,COUNT(*) as 'Số lượng nhân viên làm việc'
	from PHONGBAN,NHANVIEN
	where MAPHG=PHG
	group by TENPHG
	having avg(LUONG)>5200000
--32. Với mỗi phòng ban, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ trì
select TENPHG,count(*)
	from PHONGBAN,DEAN
	where maphg=phong
	group by TENPHG
	--dean
	select*
	from DEAN
--33. Với mỗi phòng ban, cho biết tên phòng ban, họ tên người trưởng phòng và số lượng đề án mà phòng ban đó chủ trì
select TENPHG,HONV,TENLOT,TENNV,count(*) as 'Số lượng đề án'
	from PHONGBAN,NHANVIEN,DEAN
	where MANV=TRPHG and MAPHG=PHONG
	group by TENPHG,HONV,TENLOT,TENNV
--34. Với mỗi đề án, cho biết tên đề án và số lượng nhân viên tham gia đề án
SELECT DEAN.TENDEAN, COUNT(*) AS 'Số lượng NV'
FROM DEAN
INNER JOIN CONGVIEC ON DEAN.MADA = CONGVIEC.MADA
GROUP BY DEAN.TENDEAN



