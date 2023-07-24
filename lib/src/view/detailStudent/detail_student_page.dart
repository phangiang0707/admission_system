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

    _studentController = DetailStudentController();
    _studentController!.getStudent(widget.id).then((value) {
      setState(() {
        print("----------------------------${value!.maHocSinh}");
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
        _txtDateRange.text =
            "${DateTime.parse(_studentOtd!.ngayCap).day}/${DateTime.parse(_studentOtd!.ngayCap).month}/${DateTime.parse(_studentOtd!.ngayCap).year}";
      });
    });
  }

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.chevron_left_outlined,
                            color: Color.fromARGB(255, 0, 61, 110),
                          )),
                      Text(
                        "Thông tin sinh viên",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 61, 110),
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 3,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => List_Certificate_page(
                                      studentOtd: _studentOtd)));
                        },
                        child: Container(
                          child: Text("Xác nhận chứng nhận"),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Họ: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtSurname,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtSurname,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "Giang",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Tên: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtName,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )),
                                  // Expanded(
                                  //   flex: 3,
                                  //   child: SizedBox(
                                  //     height: 40,
                                  //     child: TextFormField(
                                  //       controller: _txtName,
                                  //       decoration: InputDecoration(
                                  //         enabled: false,
                                  //         enabledBorder: OutlineInputBorder(
                                  //           borderSide: const BorderSide(
                                  //               width: 1,
                                  //               color: Color.fromRGBO(23, 161,
                                  //                   250, 1)), //<-- SEE HERE
                                  //           borderRadius:
                                  //               BorderRadius.circular(15),
                                  //         ),
                                  //         focusedBorder: OutlineInputBorder(
                                  //           borderSide: const BorderSide(
                                  //               width: 1,
                                  //               color: Color.fromRGBO(
                                  //                   23, 161, 250, 1)),
                                  //           borderRadius:
                                  //               BorderRadius.circular(15),
                                  //         ),
                                  //         border: OutlineInputBorder(),
                                  //         hintText: "",
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Mã HSSV: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtCode,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtCode,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Giới tính: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtGender,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtGender,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Ngày sinh: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtBirthday,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtBirthday,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Nơi sinh: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtBirthplace,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtBirthplace,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Quê quán: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtProvince,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtProvince,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text("Địa chỉ thường trú: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtProfession,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtProfession,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1, child: Text("Nghề đăng ký: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtNgheDk,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtNgheDk,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Lớp: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtClass,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtClass,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1, child: Text("SĐT học sinh: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtNumberPhoneStudent,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtNumberPhoneStudent,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1, child: Text("SĐT liên lạc: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtNumberPhone,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtNumberPhone,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Trình độ: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtLevel,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtLevel,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text("Giấy CNTN tại trường: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtCertification,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtCertification,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Học lực: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtAcademicAbility,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtAcademicAbility,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Hạnh kiểm: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtConduct,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtConduct,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("TK lớp 9: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtTKclass9,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtTKclass9,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1, child: Text("Năm tốt nghiệp: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtGraduationyear,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtGraduationyear,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text("Địa chỉ liên lạc: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtContactAddress,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtContactAddress,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Dân tộc: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtNation,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtNation,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Tôn giáo: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtReligion,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtReligion,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Đối tượng: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtObject,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtObject,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Khu vực: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtArea,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtArea,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("CMND: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtCMND,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtCMND,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Nơi cấp: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtIssuedby,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtIssuedby,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Ngày cấp: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtDateRange,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtDateRange,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1, child: Text("Họ và tên Ba: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtFathername,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtFathername,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1, child: Text("Họ và tên Mẹ: ")),
                                  Expanded(
                                      flex: 4,
                                      child: TextField(
                                        controller: _txtMothername,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          isDense: true, // Added this
                                          contentPadding:
                                              EdgeInsets.all(8), // Added this
                                        ),
                                      )
                                      // TextFormField(
                                      //   controller: _txtMothername,
                                      //   decoration: InputDecoration(
                                      //     enabled: false,
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(23, 161,
                                      //               250, 1)), //<-- SEE HERE
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderSide: const BorderSide(
                                      //           width: 1,
                                      //           color: Color.fromRGBO(
                                      //               23, 161, 250, 1)),
                                      //       borderRadius:
                                      //           BorderRadius.circular(15),
                                      //     ),
                                      //     border: OutlineInputBorder(),
                                      //     hintText: "",
                                      //   ),
                                      // ),
                                      ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
