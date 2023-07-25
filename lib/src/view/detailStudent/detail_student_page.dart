import 'package:flutter/material.dart';

import '../../controller/getDetailStudent.controller.dart';
import '../../model/getDetailStudent.model.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _studentController = DetailStudentController(context: context);
    _studentController!.getStudent(widget.id).then((value) {
      setState(() {
        print("----------------------------${value!.maHocSinh}");
        print(value.daNhapHoc);
        _studentOtd = value;
        _txtFathername.text = value.hoTenCha;
        _txtMothername.text = value.hoTenMe;
        _txtSurname.text = value.hoVaTenDem;
        _txtName.text = value.ten;
        _txtCode.text = value.maHocSinh;
        if (_studentOtd!.gioiTinh == true) {
          _txtGender.text = "Nam";
        } else {
          _txtGender.text = "Nữ";
        }
        _txtBirthday.text =
            "${_studentOtd!.ngaySinh.day}/${_studentOtd!.ngaySinh.month}/${_studentOtd!.ngaySinh.year}";
        _txtBirthplace.text = _studentOtd!.noiSinh;
        _txtProvince.text = _studentOtd!.queQuan;
        _txtProfession.text = _studentOtd!.diaChiThuongTru;
        _txtNgheDk.text = _studentOtd!.ngheDangKy;
        _txtClass.text = _studentOtd!.lop;
        _txtNumberPhoneStudent.text = _studentOtd!.sdtHocSinh;
        _txtNumberPhone.text = _studentOtd!.sdtLienLac;
        _txtLevel.text = _studentOtd!.trinhDo;
        _txtCertification.text = _studentOtd!.giayCntnTruong;
        _txtAcademicAbility.text = _studentOtd!.hocLuc;
        _txtConduct.text = _studentOtd!.hanhKiem;
        _txtTKclass9.text = _studentOtd!.diemTongKetLop9;
        _txtGraduationyear.text = _studentOtd!.namTotNghiep;
        _txtContactAddress.text = _studentOtd!.diaChiLienLac;
        _txtNation.text = _studentOtd!.danToc;
        _txtReligion.text = _studentOtd!.tonGiao;
        _txtObject.text = _studentOtd!.doiTuong;
        _txtArea.text = _studentOtd!.khuVuc;
        _txtCMND.text = _studentOtd!.cccd;
        _txtIssuedby.text = _studentOtd!.noiCap;
        if (value.ngayCap == null) {
          _txtDateRange.text = "";
        } else {
          _txtDateRange.text =
              "${DateTime.parse(_studentOtd!.ngayCap).day}/${DateTime.parse(_studentOtd!.ngayCap).month}/${DateTime.parse(_studentOtd!.ngayCap).year}";
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
  }

  TextEditingController _txtTinhTrang = TextEditingController();
  TextEditingController _txtSurname = TextEditingController();
  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtCode = TextEditingController();
  TextEditingController _txtGender = TextEditingController();
  TextEditingController _txtBirthday = TextEditingController();
  TextEditingController _txtBirthplace = TextEditingController();
  TextEditingController _txtProvince = TextEditingController();
  TextEditingController _txtProfession = TextEditingController();
  TextEditingController _txtNgheDk = TextEditingController();
  TextEditingController _txtClass = TextEditingController();
  TextEditingController _txtNumberPhoneStudent = TextEditingController();
  TextEditingController _txtNumberPhone = TextEditingController();
  TextEditingController _txtLevel = TextEditingController();
  TextEditingController _txtCertification = TextEditingController();
  TextEditingController _txtAcademicAbility = TextEditingController();
  TextEditingController _txtConduct = TextEditingController();
  TextEditingController _txtTKclass9 = TextEditingController();
  TextEditingController _txtGraduationyear = TextEditingController();
  TextEditingController _txtContactAddress = TextEditingController();
  TextEditingController _txtNation = TextEditingController();
  TextEditingController _txtReligion = TextEditingController();
  TextEditingController _txtObject = TextEditingController();
  TextEditingController _txtArea = TextEditingController();
  TextEditingController _txtCMND = TextEditingController();
  TextEditingController _txtDateRange = TextEditingController();
  TextEditingController _txtIssuedby = TextEditingController();
  TextEditingController _txtFathername = TextEditingController();
  TextEditingController _txtMothername = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                                Navigator.pop(context);
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
                                    "Xác nhận chứng nhận",
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
                                child: TextField(
                              controller: _txtTinhTrang,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true, // Added this
                                contentPadding: EdgeInsets.all(8), // Added this
                              ),
                            )),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
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
                                                controller: _txtSurname,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  isDense: true, // Added this
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
                                                controller: _txtName,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  isDense: true, // Added this
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
                                                controller: _txtCode,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  isDense: true, // Added this
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
                                    height: 15,
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
                                                  child: TextField(
                                                controller: _txtGender,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  isDense: true, // Added this
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
                                                "Ngày sinh: ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Container(
                                                  child: TextField(
                                                controller: _txtBirthday,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  isDense: true, // Added this
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
                                                controller: _txtBirthplace,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  isDense: true, // Added this
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
                                    height: 15,
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
                                                controller: _txtProvince,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  isDense: true, // Added this
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
                                                controller: _txtProfession,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  isDense: true, // Added this
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
                                                controller: _txtNgheDk,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  isDense: true, // Added this
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
                                    height: 15,
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
                                                controller: _txtClass,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  isDense: true, // Added this
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
                                                controller:
                                                    _txtNumberPhoneStudent,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  isDense: true, // Added this
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
                                                controller: _txtNumberPhone,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  isDense: true, // Added this
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
                                    height: 15,
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
                                                controller: _txtLevel,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  isDense: true, // Added this
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
                                                controller: _txtCertification,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  isDense: true, // Added this
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
                                                controller: _txtAcademicAbility,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  isDense: true, // Added this
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
                                    height: 15,
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
                                                  controller: _txtConduct,
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    isDense: true, // Added this
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
                                                  controller: _txtTKclass9,
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    isDense: true, // Added this
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
                                                  controller:
                                                      _txtGraduationyear,
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    isDense: true, // Added this
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
                                    height: 15,
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
                                                  controller:
                                                      _txtContactAddress,
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    isDense: true, // Added this
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
                                                  controller: _txtNation,
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    isDense: true, // Added this
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
                                                  controller: _txtReligion,
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    isDense: true, // Added this
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
                                    height: 15,
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
                                                  controller: _txtObject,
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    isDense: true, // Added this
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
                                                  controller: _txtArea,
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    isDense: true, // Added this
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
                                                  controller: _txtCMND,
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    isDense: true, // Added this
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
                                    height: 15,
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
                                                  controller: _txtIssuedby,
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    isDense: true, // Added this
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
                                                  controller: _txtDateRange,
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    isDense: true, // Added this
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
                                    height: 15,
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
                                                  controller: _txtFathername,
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    isDense: true, // Added this
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
                                                  controller: _txtMothername,
                                                  decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    isDense: true, // Added this
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
                              ),
                            ),
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
    );
  }
}
