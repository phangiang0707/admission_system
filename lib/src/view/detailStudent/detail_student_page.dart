import 'package:admission_system/src/model/postStudent.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../controller/getDetailStudent.controller.dart';
import '../../controller/getProvince.controller.dart';
import '../../controller/putDetailStudent.controller.dart';
import '../../model/getDetailStudent.model.dart';
import '../../model/getProvince.model.dart';
import 'page/list_certificate_page.dart';

class Detail_Student_page extends StatefulWidget {
  const Detail_Student_page({super.key, required this.id});
  final String id;
  @override
  State<Detail_Student_page> createState() => _Detail_Student_pageState();
}

class _Detail_Student_pageState extends State<Detail_Student_page> {
  DetailStudentController? _studentController;
  GetDetailStudentOtd? _studentOtd;
  DateTime txtDateRange = DateTime.now();
  DateTime txtBirthday = DateTime.now();
  bool disabled = true;
  PutDetailStudentController? _putDetailStudentController;
  GetProvinceController? _getProvinceController;
  GetProvinceOtd? _getProvince;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _putDetailStudentController = PutDetailStudentController(context: context);
    _studentController = DetailStudentController(context: context);
    _getProvinceController = GetProvinceController();
    _getProvinceController!.getProvince().then((value) {
      setState(() {
        _getProvince = value;
      });
    });
    _studentController!.getStudent(widget.id).then((value) {
      setState(() {
        print("----------------------------${value!.maHocSinh}");
        print(value.daNhapHoc);
        if (value.daNhapHoc == true) {
          setState(() {
            _txtTinhTrang.text = "Tình trạng đã nhập học";
          });
        } else {
          setState(() {
            _txtTinhTrang.text = "Tình trạng chưa nhập học";
          });
        }
        _studentOtd = value;
        _txtHoTenBo.text = value.hoTenCha;
        _txtHoTenMe.text = value.hoTenMe;
        _txtHo.text = value.hoVaTenDem;
        _txtTen.text = value.ten;
        _txtMaHSSV.text = value.maHocSinh;
        if (_studentOtd!.gioiTinh == true) {
          _txtGioiTinh = true;
        } else {
          _txtGioiTinh = false;
        }
        _txtBirthday.text =
            "${_studentOtd!.ngaySinh.day}/${_studentOtd!.ngaySinh.month}/${_studentOtd!.ngaySinh.year}";
        _txtNoiSinh.text = _studentOtd!.noiSinh;
        _txtQueQuan.text = _studentOtd!.queQuan;
        _txtDiaChiThuongTru.text = _studentOtd!.diaChiThuongTru;
        _txtNgheDk.text = _studentOtd!.ngheDangKy;
        _txtLop.text = _studentOtd!.lop;
        _txtSDTHocSinh.text = _studentOtd!.sdtHocSinh;
        _txtSDTLienLac.text = _studentOtd!.sdtLienLac;
        if (value.trinhDo == "CAO_DANG") {
          setState(() {});
          _txtTrinhDo.text = "Cao đẳng";
        } else {
          setState(() {});
          _txtTrinhDo.text = "Trung cấp";
        }
        _txtGiayCNtaiTruong.text = _studentOtd!.giayCntnTruong;
        _txtHocLuc.text = _studentOtd!.hocLuc;
        _txtHanhKiem.text = _studentOtd!.hanhKiem;
        _txtTKLop9.text = _studentOtd!.diemTongKetLop9;
        if (value.namTotNghiep == null) {
          _txtNamTotNghiep.text = "";
        } else {
          _txtNamTotNghiep.text = _studentOtd!.namTotNghiep;
        }
        _txtDiaChiLienLac.text = _studentOtd!.diaChiLienLac;
        _txtNDanToc.text = _studentOtd!.danToc;
        _txtTonGiao.text = _studentOtd!.tonGiao;
        _txtDoiTuong.text = _studentOtd!.doiTuong;
        _txtKhuVuc.text = _studentOtd!.khuVuc;
        _txtCMND.text = _studentOtd!.cccd;
        _txtNoiCap.text = _studentOtd!.noiCap;
        if (value.ngayCap == null) {
          _txtNgayCap.text = "";
        } else {
          _txtNgayCap.text =
              "${DateTime.parse(_studentOtd!.ngayCap).day}/${DateTime.parse(_studentOtd!.ngayCap).month}/${DateTime.parse(_studentOtd!.ngayCap).year}";
        }
      });
    });
  }

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  TextEditingController _txtTinhTrang = TextEditingController();
  TextEditingController _txtHo = TextEditingController();
  TextEditingController _txtTen = TextEditingController();
  TextEditingController _txtMaHSSV = TextEditingController();
  TextEditingController _txtBirthday = TextEditingController();
  TextEditingController _txtNoiSinh = TextEditingController();
  TextEditingController _txtQueQuan = TextEditingController();
  TextEditingController _txtDiaChiThuongTru = TextEditingController();
  TextEditingController _txtNgheDk = TextEditingController();
  TextEditingController _txtLop = TextEditingController();
  TextEditingController _txtSDTHocSinh = TextEditingController();
  TextEditingController _txtSDTLienLac = TextEditingController();
  TextEditingController _txtTrinhDo = TextEditingController();
  TextEditingController _txtGiayCNtaiTruong = TextEditingController();
  TextEditingController _txtHocLuc = TextEditingController();
  TextEditingController _txtHanhKiem = TextEditingController();
  TextEditingController _txtTKLop9 = TextEditingController();
  TextEditingController _txtNamTotNghiep = TextEditingController();
  TextEditingController _txtDiaChiLienLac = TextEditingController();
  TextEditingController _txtNDanToc = TextEditingController();
  TextEditingController _txtTonGiao = TextEditingController();
  TextEditingController _txtDoiTuong = TextEditingController();
  TextEditingController _txtKhuVuc = TextEditingController();
  TextEditingController _txtCMND = TextEditingController();
  TextEditingController _txtNgayCap = TextEditingController();
  TextEditingController _txtNoiCap = TextEditingController();
  TextEditingController _txtHoTenBo = TextEditingController();
  TextEditingController _txtHoTenMe = TextEditingController();
  bool _txtGioiTinh = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () async {
          _studentController!.getStudent(widget.id).then((value) {
            setState(() {
              print("----------------------------${value!.maHocSinh}");
              print(value.daNhapHoc);
              _studentOtd = value;
              _txtHoTenBo.text = value.hoTenCha;
              _txtHoTenMe.text = value.hoTenMe;
              _txtHo.text = value.hoVaTenDem;
              _txtTen.text = value.ten;
              _txtMaHSSV.text = value.maHocSinh;
              if (_studentOtd!.gioiTinh == true) {
                _txtGioiTinh = true;
              } else {
                _txtGioiTinh = false;
              }
              _txtBirthday.text =
                  "${_studentOtd!.ngaySinh.day}/${_studentOtd!.ngaySinh.month}/${_studentOtd!.ngaySinh.year}";
              _txtNoiSinh.text = _studentOtd!.noiSinh;
              _txtQueQuan.text = _studentOtd!.queQuan;
              _txtDiaChiThuongTru.text = _studentOtd!.diaChiThuongTru;
              _txtNgheDk.text = _studentOtd!.ngheDangKy;
              _txtLop.text = _studentOtd!.lop;
              _txtSDTHocSinh.text = _studentOtd!.sdtHocSinh;
              _txtSDTLienLac.text = _studentOtd!.sdtLienLac;
              if (value.trinhDo == "CAO_DANG") {
                setState(() {});
                _txtTrinhDo.text = "Cao đẳng";
              } else {
                setState(() {});
                _txtTrinhDo.text = "Trung cấp";
              }

              _txtGiayCNtaiTruong.text = _studentOtd!.giayCntnTruong;
              _txtHocLuc.text = _studentOtd!.hocLuc;
              _txtHanhKiem.text = _studentOtd!.hanhKiem;
              _txtTKLop9.text = _studentOtd!.diemTongKetLop9;
              _txtNamTotNghiep.text = _studentOtd!.namTotNghiep;
              _txtDiaChiLienLac.text = _studentOtd!.diaChiLienLac;
              _txtNDanToc.text = _studentOtd!.danToc;
              _txtTonGiao.text = _studentOtd!.tonGiao;
              _txtDoiTuong.text = _studentOtd!.doiTuong;
              _txtKhuVuc.text = _studentOtd!.khuVuc;
              _txtCMND.text = _studentOtd!.cccd;
              _txtNoiCap.text = _studentOtd!.noiCap;
              txtBirthday = _studentOtd!.ngaySinh;
              txtDateRange = _studentOtd!.ngayCap;
              if (value.ngayCap == null) {
                _txtNgayCap.text = "";
              } else {
                _txtNgayCap.text =
                    "${_studentOtd!.ngayCap.day}/${_studentOtd!.ngayCap.month}/${_studentOtd!.ngayCap.year}";
              }
            });
            if (_studentOtd!.daNhapHoc == true) {
              setState(() {
                _txtTinhTrang.text = "Tình trạng đã nhập học";
              });
            } else {
              setState(() {
                _txtTinhTrang.text = "Tình trạng chưa nhập học";
              });
            }
          });
        },
        child: Container(
          // width: double.infinity,
          // height: double.infinity,
          color: Color.fromRGBO(238, 239, 241, 100),
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 1300,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Column(
                    children: [
                      Container(
                        color: Color.fromARGB(255, 0, 61, 110),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context, 'refresh');
                                },
                                icon: Icon(
                                  Icons.chevron_left_outlined,
                                  color: Colors.white,
                                )),
                            Text(
                              "Thông tin sinh viên",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 3,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            List_Certificate_page(
                                                studentOtd: _studentOtd)));
                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "Xem danh sách hồ sơ",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Container(
                                  child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      readOnly: true,
                                      controller: _txtTinhTrang,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        isDense: true, // Added this
                                        contentPadding:
                                            EdgeInsets.all(8), // Added this
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  disabled == true
                                      ? InkWell(
                                          onTap: () {
                                            setState(() {
                                              disabled = false;
                                            });
                                          },
                                          child: Text("Sửa thông tin"),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            String trinhDo1 = "";
                                            if (_txtTrinhDo.text ==
                                                "Cao đẳng") {
                                              setState(() {
                                                trinhDo1 = "CAO_DANG";
                                              });
                                            } else {
                                              setState(() {
                                                trinhDo1 = "TRUNG_CAP";
                                              });
                                            }
                                            _putDetailStudentController!
                                                .putDetailStudentController(
                                                    widget.id,
                                                    PostStudentOtd(
                                                        maHocSinh:
                                                            _txtMaHSSV.text,
                                                        hoVaTenDem: _txtHo.text,
                                                        ten: _txtTen.text,
                                                        gioiTinh: _txtGioiTinh,
                                                        ngaySinh: txtBirthday,
                                                        noiSinh:
                                                            _txtNoiSinh.text,
                                                        queQuan:
                                                            _txtQueQuan.text,
                                                        diaChiThuongTru:
                                                            _txtDiaChiThuongTru
                                                                .text,
                                                        ngheDangKy:
                                                            _txtNgheDk.text,
                                                        lop: _txtLop.text,
                                                        sdtHocSinh:
                                                            _txtSDTHocSinh.text,
                                                        sdtLienLac:
                                                            _txtSDTLienLac.text,
                                                        trinhDo: trinhDo1,
                                                        giayCntnTruong:
                                                            _txtGiayCNtaiTruong
                                                                .text,
                                                        hocLuc: _txtHocLuc.text,
                                                        hanhKiem:
                                                            _txtHanhKiem.text,
                                                        diemTongKetLop9:
                                                            _txtTKLop9.text,
                                                        namTotNghiep:
                                                            _txtNamTotNghiep
                                                                .text,
                                                        diaChiLienLac:
                                                            _txtDiaChiLienLac
                                                                .text,
                                                        danToc:
                                                            _txtNDanToc.text,
                                                        tonGiao:
                                                            _txtTonGiao.text,
                                                        doiTuong:
                                                            _txtDoiTuong.text,
                                                        khuVuc: _txtKhuVuc.text,
                                                        cccd: _txtCMND.text,
                                                        ngayCap: txtDateRange,
                                                        noiCap: _txtNoiCap.text,
                                                        hoTenCha:
                                                            _txtHoTenBo.text,
                                                        hoTenMe:
                                                            _txtHoTenMe.text,
                                                        ghiChu: ""))
                                                .then((value) {
                                              final snackBar = SnackBar(
                                                content: const Text(
                                                    'Sửa thành công'),
                                                action: SnackBarAction(
                                                  label: 'Undo',
                                                  onPressed: () {
                                                    // Some code to undo the change.
                                                  },
                                                ),
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                              _refreshIndicatorKey.currentState
                                                  ?.show();
                                            });
                                            setState(() {
                                              disabled = true;
                                            });
                                          },
                                          child: Text("Hoàn thành"),
                                        )
                                ],
                              )),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Họ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                      child: TextField(
                                                    readOnly: disabled,
                                                    controller: _txtHo,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      isDense:
                                                          true, // Added this
                                                      contentPadding:
                                                          EdgeInsets.all(
                                                              8), // Added this
                                                    ),
                                                  )),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Tên",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                      child: TextField(
                                                    readOnly: disabled,
                                                    controller: _txtTen,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      isDense:
                                                          true, // Added this
                                                      contentPadding:
                                                          EdgeInsets.all(
                                                              8), // Added this
                                                    ),
                                                  )),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Mã HSSV: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                      child: TextField(
                                                    readOnly: true,
                                                    controller: _txtMaHSSV,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      isDense:
                                                          true, // Added this
                                                      contentPadding:
                                                          EdgeInsets.all(
                                                              8), // Added this
                                                    ),
                                                  )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Giới tính: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                      child: Row(
                                                    children: [
                                                      Container(
                                                          child: Row(
                                                        children: [
                                                          Text("Nam"),
                                                          Radio(
                                                            value: true,
                                                            groupValue:
                                                                _txtGioiTinh,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _txtGioiTinh =
                                                                    value!;
                                                              });
                                                            },
                                                          ),
                                                        ],
                                                      )),
                                                      SizedBox(
                                                        width: 50,
                                                      ),
                                                      Container(
                                                          child: Row(
                                                        children: [
                                                          Text("Nữ"),
                                                          Radio(
                                                            value: false,
                                                            groupValue:
                                                                _txtGioiTinh,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _txtGioiTinh =
                                                                    value!;
                                                              });
                                                            },
                                                          ),
                                                        ],
                                                      )),
                                                    ],
                                                  )
                                                      //     TextField(
                                                      //   controller: _txtGioiTinh,
                                                      //   decoration: InputDecoration(
                                                      //     border: OutlineInputBorder(),
                                                      //     isDense: true, // Added this
                                                      //     contentPadding:
                                                      //         EdgeInsets.all(8), // Added this
                                                      //   ),
                                                      // )
                                                      ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Ngày sinh: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                      child: TextField(
                                                    readOnly: disabled,
                                                    onTap: disabled == true
                                                        ? null
                                                        : () async {
                                                            DateTime?
                                                                datimePickerStart =
                                                                await showDatePicker(
                                                                    context:
                                                                        context,
                                                                    initialDate:
                                                                        DateTime
                                                                            .now(),
                                                                    firstDate:
                                                                        DateTime(
                                                                            2000),
                                                                    lastDate:
                                                                        DateTime(
                                                                            2101));
                                                            if (datimePickerStart !=
                                                                null) {
                                                              setState(() {
                                                                txtBirthday =
                                                                    datimePickerStart;
                                                                _txtBirthday
                                                                    .text = DateFormat(
                                                                        'dd/MM/yyyy')
                                                                    .format(
                                                                        datimePickerStart);
                                                              });
                                                            }
                                                          },
                                                    controller: _txtBirthday,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      isDense:
                                                          true, // Added this
                                                      contentPadding:
                                                          EdgeInsets.all(
                                                              8), // Added this
                                                    ),
                                                  )),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Nơi sinh: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                      child: TextField(
                                                    onTap: () => disabled ==
                                                            false
                                                        ? _dialogBuilderNoiSinh(
                                                            context)
                                                        : null,
                                                    readOnly: disabled,
                                                    controller: _txtNoiSinh,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      isDense:
                                                          true, // Added this
                                                      contentPadding:
                                                          EdgeInsets.all(
                                                              8), // Added this
                                                    ),
                                                  )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Quê quán: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                      child: TextField(
                                                    onTap: () => disabled ==
                                                            false
                                                        ? _dialogBuilderQueQuan(
                                                            context)
                                                        : null,
                                                    readOnly: disabled,
                                                    controller: _txtQueQuan,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      isDense:
                                                          true, // Added this
                                                      contentPadding:
                                                          EdgeInsets.all(
                                                              8), // Added this
                                                    ),
                                                  )),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Địa chỉ thường trú: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                      child: TextField(
                                                    readOnly: disabled,
                                                    controller:
                                                        _txtDiaChiThuongTru,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      isDense:
                                                          true, // Added this
                                                      contentPadding:
                                                          EdgeInsets.all(
                                                              8), // Added this
                                                    ),
                                                  )),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Nghề đăng ký: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                      child: TextField(
                                                    readOnly: disabled,
                                                    controller: _txtNgheDk,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      isDense:
                                                          true, // Added this
                                                      contentPadding:
                                                          EdgeInsets.all(
                                                              8), // Added this
                                                    ),
                                                  )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Lớp: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                      child: TextField(
                                                    readOnly: disabled,
                                                    controller: _txtLop,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      isDense:
                                                          true, // Added this
                                                      contentPadding:
                                                          EdgeInsets.all(
                                                              8), // Added this
                                                    ),
                                                  )),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "SĐT học sinh: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                      child: TextField(
                                                    readOnly: disabled,
                                                    controller: _txtSDTHocSinh,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      isDense:
                                                          true, // Added this
                                                      contentPadding:
                                                          EdgeInsets.all(
                                                              8), // Added this
                                                    ),
                                                  )),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "SĐT liên lạc: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                      child: TextField(
                                                    readOnly: disabled,
                                                    controller: _txtSDTLienLac,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      isDense:
                                                          true, // Added this
                                                      contentPadding:
                                                          EdgeInsets.all(
                                                              8), // Added this
                                                    ),
                                                  )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Trình độ: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                      child: TextField(
                                                    onTap: () {
                                                      disabled == false
                                                          ? showDialog<void>(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                  title: const Text(
                                                                      'Chọn trình độ'),
                                                                  content:
                                                                      SingleChildScrollView(
                                                                    child: Column(
                                                                        children: [
                                                                          TextButton(
                                                                              onPressed: () {
                                                                                setState(() {
                                                                                  _txtTrinhDo.text = "Trung cấp";
                                                                                });
                                                                              },
                                                                              child: Text(
                                                                                "Trung cấp",
                                                                                style: TextStyle(color: Colors.black),
                                                                              )),
                                                                          TextButton(
                                                                              onPressed: () {
                                                                                setState(() {
                                                                                  _txtTrinhDo.text = "Cao đẳng";
                                                                                });
                                                                              },
                                                                              child: Text(
                                                                                "Cao đẳng",
                                                                                style: TextStyle(color: Colors.black),
                                                                              ))
                                                                        ]),
                                                                  ),
                                                                  actions: <Widget>[
                                                                    TextButton(
                                                                      style: TextButton
                                                                          .styleFrom(
                                                                        textStyle: Theme.of(context)
                                                                            .textTheme
                                                                            .labelLarge,
                                                                      ),
                                                                      child: const Text(
                                                                          'Cancel'),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            )
                                                          : null;
                                                    },
                                                    readOnly: disabled,
                                                    controller: _txtTrinhDo,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      isDense:
                                                          true, // Added this
                                                      contentPadding:
                                                          EdgeInsets.all(
                                                              8), // Added this
                                                    ),
                                                  )),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Giấy CNTN tại trường: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                      child: TextField(
                                                    readOnly: disabled,
                                                    controller:
                                                        _txtGiayCNtaiTruong,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      isDense:
                                                          true, // Added this
                                                      contentPadding:
                                                          EdgeInsets.all(
                                                              8), // Added this
                                                    ),
                                                  )),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Học lực: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                      child: TextField(
                                                    onTap: () {
                                                      disabled == false
                                                          ? showDialog<void>(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                  title: const Text(
                                                                      'Chọn học lực'),
                                                                  content:
                                                                      SingleChildScrollView(
                                                                    child: Column(
                                                                        children: [
                                                                          TextButton(
                                                                              onPressed: () {
                                                                                setState(() {
                                                                                  _txtHocLuc.text = "Giỏi";
                                                                                });
                                                                              },
                                                                              child: Text(
                                                                                "Giỏi",
                                                                                style: TextStyle(color: Colors.black),
                                                                              )),
                                                                          TextButton(
                                                                              onPressed: () {
                                                                                setState(() {
                                                                                  _txtHocLuc.text = "Khá";
                                                                                });
                                                                              },
                                                                              child: Text(
                                                                                "Khá",
                                                                                style: TextStyle(color: Colors.black),
                                                                              )),
                                                                          TextButton(
                                                                              onPressed: () {
                                                                                setState(() {
                                                                                  _txtHocLuc.text = "Trung bình";
                                                                                });
                                                                              },
                                                                              child: Text(
                                                                                "Trung bình",
                                                                                style: TextStyle(color: Colors.black),
                                                                              ))
                                                                        ]),
                                                                  ),
                                                                  actions: <Widget>[
                                                                    TextButton(
                                                                      style: TextButton
                                                                          .styleFrom(
                                                                        textStyle: Theme.of(context)
                                                                            .textTheme
                                                                            .labelLarge,
                                                                      ),
                                                                      child: const Text(
                                                                          'Cancel'),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            )
                                                          : null;
                                                    },
                                                    readOnly: disabled,
                                                    controller: _txtHocLuc,
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      isDense:
                                                          true, // Added this
                                                      contentPadding:
                                                          EdgeInsets.all(
                                                              8), // Added this
                                                    ),
                                                  )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Hạnh kiểm: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    child: TextField(
                                                      onTap: () {
                                                        disabled == false
                                                            ? showDialog<void>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return AlertDialog(
                                                                    title: const Text(
                                                                        'Chọn hạnh kiểm'),
                                                                    content:
                                                                        SingleChildScrollView(
                                                                      child: Column(
                                                                          children: [
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  setState(() {
                                                                                    _txtHanhKiem.text = "Tổt";
                                                                                  });
                                                                                },
                                                                                child: Text(
                                                                                  "Tổt",
                                                                                  style: TextStyle(color: Colors.black),
                                                                                )),
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  setState(() {
                                                                                    _txtHanhKiem.text = "Khá";
                                                                                  });
                                                                                },
                                                                                child: Text(
                                                                                  "Khá",
                                                                                  style: TextStyle(color: Colors.black),
                                                                                )),
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  setState(() {
                                                                                    _txtHanhKiem.text = "Trung bình";
                                                                                  });
                                                                                },
                                                                                child: Text(
                                                                                  "Trung bình",
                                                                                  style: TextStyle(color: Colors.black),
                                                                                )),
                                                                            TextButton(
                                                                                onPressed: () {
                                                                                  setState(() {
                                                                                    _txtHanhKiem.text = "Yếu";
                                                                                  });
                                                                                },
                                                                                child: Text(
                                                                                  "Yếu",
                                                                                  style: TextStyle(color: Colors.black),
                                                                                ))
                                                                          ]),
                                                                    ),
                                                                    actions: <Widget>[
                                                                      TextButton(
                                                                        style: TextButton
                                                                            .styleFrom(
                                                                          textStyle: Theme.of(context)
                                                                              .textTheme
                                                                              .labelLarge,
                                                                        ),
                                                                        child: const Text(
                                                                            'Cancel'),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              )
                                                            : null;
                                                      },
                                                      readOnly: disabled,
                                                      controller: _txtHanhKiem,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(),
                                                        isDense:
                                                            true, // Added this
                                                        contentPadding:
                                                            EdgeInsets.all(
                                                                8), // Added this
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "TK lớp 9: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    child: TextField(
                                                      readOnly: disabled,
                                                      controller: _txtTKLop9,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(),
                                                        isDense:
                                                            true, // Added this
                                                        contentPadding:
                                                            EdgeInsets.all(
                                                                8), // Added this
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Năm tốt nghiệp: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    child: TextField(
                                                      readOnly: disabled,
                                                      controller:
                                                          _txtNamTotNghiep,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(),
                                                        isDense:
                                                            true, // Added this
                                                        contentPadding:
                                                            EdgeInsets.all(
                                                                8), // Added this
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Địa chỉ liên lạc: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    child: TextField(
                                                      readOnly: disabled,
                                                      controller:
                                                          _txtDiaChiLienLac,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(),
                                                        isDense:
                                                            true, // Added this
                                                        contentPadding:
                                                            EdgeInsets.all(
                                                                8), // Added this
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Dân tộc: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    child: TextField(
                                                      readOnly: disabled,
                                                      controller: _txtNDanToc,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(),
                                                        isDense:
                                                            true, // Added this
                                                        contentPadding:
                                                            EdgeInsets.all(
                                                                8), // Added this
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Tôn giáo: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    child: TextField(
                                                      readOnly: disabled,
                                                      controller: _txtTonGiao,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(),
                                                        isDense:
                                                            true, // Added this
                                                        contentPadding:
                                                            EdgeInsets.all(
                                                                8), // Added this
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Đối tượng: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    child: TextField(
                                                      readOnly: disabled,
                                                      controller: _txtDoiTuong,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(),
                                                        isDense:
                                                            true, // Added this
                                                        contentPadding:
                                                            EdgeInsets.all(
                                                                8), // Added this
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Khu vực: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    child: TextField(
                                                      readOnly: disabled,
                                                      controller: _txtKhuVuc,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(),
                                                        isDense:
                                                            true, // Added this
                                                        contentPadding:
                                                            EdgeInsets.all(
                                                                8), // Added this
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "CMND: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    child: TextField(
                                                      readOnly: disabled,
                                                      controller: _txtCMND,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(),
                                                        isDense:
                                                            true, // Added this
                                                        contentPadding:
                                                            EdgeInsets.all(
                                                                8), // Added this
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Nơi cấp: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    child: TextField(
                                                      readOnly: disabled,
                                                      controller: _txtNoiCap,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(),
                                                        isDense:
                                                            true, // Added this
                                                        contentPadding:
                                                            EdgeInsets.all(
                                                                8), // Added this
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Ngày cấp: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    child: TextField(
                                                      readOnly: disabled,
                                                      onTap: disabled == true
                                                          ? null
                                                          : () async {
                                                              DateTime? datimePickerStart = await showDatePicker(
                                                                  context:
                                                                      context,
                                                                  initialDate:
                                                                      DateTime
                                                                          .now(),
                                                                  firstDate:
                                                                      DateTime(
                                                                          2000),
                                                                  lastDate:
                                                                      DateTime(
                                                                          2101));
                                                              if (datimePickerStart !=
                                                                  null) {
                                                                setState(() {
                                                                  txtDateRange =
                                                                      datimePickerStart;
                                                                  _txtNgayCap
                                                                      .text = DateFormat(
                                                                          'dd/MM/yyyy')
                                                                      .format(
                                                                          datimePickerStart);
                                                                });
                                                              }
                                                            },
                                                      controller: _txtNgayCap,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(),
                                                        isDense:
                                                            true, // Added this
                                                        contentPadding:
                                                            EdgeInsets.all(
                                                                8), // Added this
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Họ và tên Ba: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    child: TextField(
                                                      readOnly: disabled,
                                                      controller: _txtHoTenBo,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(),
                                                        isDense:
                                                            true, // Added this
                                                        contentPadding:
                                                            EdgeInsets.all(
                                                                8), // Added this
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Họ và tên Mẹ: ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    child: TextField(
                                                      readOnly: disabled,
                                                      controller: _txtHoTenMe,
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(),
                                                        isDense:
                                                            true, // Added this
                                                        contentPadding:
                                                            EdgeInsets.all(
                                                                8), // Added this
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ))
                              ///////////------------------------------------
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _dialogBuilderQueQuan(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Chọn quê quán'),
          content: SingleChildScrollView(
            child: Column(
              children: _getProvince!.data.data
                  .map((e) => TextButton(
                      onPressed: () {
                        setState(() {
                          _txtQueQuan.text = e.name;
                        });
                        Navigator.pop(context);
                      },
                      child: Text(
                        "${e.name}",
                        style: TextStyle(color: Colors.black),
                      )))
                  .toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _dialogBuilderNoiSinh(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Chọn nơi sinh'),
          content: SingleChildScrollView(
            child: Column(
              children: _getProvince!.data.data
                  .map((e) => TextButton(
                      onPressed: () {
                        setState(() {
                          _txtNoiCap.text = e.name;
                        });
                        Navigator.pop(context);
                      },
                      child: Text(
                        "${e.name}",
                        style: TextStyle(color: Colors.black),
                      )))
                  .toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
