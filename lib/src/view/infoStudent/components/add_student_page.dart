import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../controller/postStudent.controller.dart';

class Add_Student_page extends StatefulWidget {
  const Add_Student_page({super.key});
  @override
  State<Add_Student_page> createState() => _Add_Student_pageState();
}

class _Add_Student_pageState extends State<Add_Student_page> {
  PostStudentController? _postStudentController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postStudentController = PostStudentController();
  }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   _studentController = DetailStudentController();
  //   _studentController!.getStudent(widget.id).then((value) {
  //     setState(() {
  //       print("----------------------------${value!.maHocSinh}");
  //       _studentOtd = value;
  //       _txtFathername.text = value.hoTenCha;
  //       _txtMothername.text = value.hoTenMe;
  //       _txtSurname.text = value.hoVaTenDem;
  //       _txtName.text = value.ten;
  //       _txtCode.text = value.maHocSinh;
  //       if (_studentOtd!.gioiTinh == true) {
  //         _txtGender.text = "Nam";
  //       } else {
  //         _txtGender.text = "Nữ";
  //       }
  //       _txtBirthday.text =
  //           "${_studentOtd!.ngaySinh.day}/${_studentOtd!.ngaySinh.month}/${_studentOtd!.ngaySinh.year}";
  //       _txtBirthplace.text = _studentOtd!.noiSinh;
  //       _txtProvince.text = _studentOtd!.queQuan;
  //       _txtProfession.text = _studentOtd!.diaChiThuongTru;
  //       _txtNgheDk.text = _studentOtd!.ngheDangKy;
  //       _txtClass.text = _studentOtd!.lop;
  //       _txtNumberPhoneStudent.text = _studentOtd!.sdtHocSinh;
  //       _txtNumberPhone.text = _studentOtd!.sdtLienLac;
  //       _txtLevel.text = _studentOtd!.trinhDo;
  //       _txtCertification.text = _studentOtd!.giayCntnTruong;
  //       _txtAcademicAbility.text = _studentOtd!.hocLuc;
  //       _txtConduct.text = _studentOtd!.hanhKiem;
  //       _txtTKclass9.text = _studentOtd!.diemTongKetLop9;
  //       _txtGraduationyear.text = _studentOtd!.namTotNghiep;
  //       _txtContactAddress.text = _studentOtd!.diaChiLienLac;
  //       _txtNation.text = _studentOtd!.danToc;
  //       _txtReligion.text = _studentOtd!.tonGiao;
  //       _txtObject.text = _studentOtd!.doiTuong;
  //       _txtArea.text = _studentOtd!.khuVuc;
  //       _txtCMND.text = _studentOtd!.cccd;
  //       _txtIssuedby.text = _studentOtd!.noiCap;
  //       _txtDateRange.text = "_studentOtd!.ngayCap";
  //     });
  //   });
  // }

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
  DateTime txtBirthday = DateTime.now();
  DateTime txtDateRange = DateTime.now();
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
                      Text(
                        "Thêm thông tin sinh viên mới",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 61, 110),
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 3,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 226, 223, 223),
                                    blurRadius: 1,
                                    spreadRadius: 2)
                              ]),
                          child: Text("Thêm học sinh"),
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
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtSurname,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "Giang",
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
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Tên: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtName,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Mã HSSV: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtCode,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Giới tính: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtGender,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Ngày sinh: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      onTap: () async {
                                        DateTime? datimePickerStart =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2000),
                                                lastDate: DateTime(2101));
                                        if (datimePickerStart != null) {
                                          setState(() {
                                            txtBirthday = datimePickerStart;
                                            _txtBirthday.text =
                                                DateFormat('dd/MM/yyyy')
                                                    .format(datimePickerStart);
                                          });
                                        }
                                      },
                                      controller: _txtBirthday,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Nơi sinh: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtBirthplace,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Quê quán: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtProvince,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text("Địa chỉ thường trú: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtProfession,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1, child: Text("Nghề đăng ký: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtNgheDk,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Lớp: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtClass,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1, child: Text("SĐT học sinh: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtNumberPhoneStudent,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1, child: Text("SĐT liên lạc: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtNumberPhone,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Trình độ: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtLevel,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text("Giấy CNTN tại trường: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtCertification,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Học lực: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtAcademicAbility,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Hạnh kiểm: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtConduct,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("TK lớp 9: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtTKclass9,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1, child: Text("Năm tốt nghiệp: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtGraduationyear,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                        height: 20,
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
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtContactAddress,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Dân tộc: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtNation,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Tôn giáo: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtReligion,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Đối tượng: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtObject,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Khu vực: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtArea,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("CMND: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtCMND,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Nơi cấp: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtIssuedby,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("Ngày cấp: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      onTap: () async {
                                        DateTime? datimePickerStart =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2000),
                                                lastDate: DateTime(2101));
                                        if (datimePickerStart != null) {
                                          setState(() {
                                            txtDateRange = datimePickerStart;
                                            _txtDateRange.text =
                                                DateFormat('dd/MM/yyyy')
                                                    .format(datimePickerStart);
                                          });
                                        }
                                      },
                                      controller: _txtDateRange,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                        height: 20,
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
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtFathername,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1, child: Text("Họ và tên Mẹ: ")),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      controller: _txtMothername,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(23, 161,
                                                  250, 1)), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: "",
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
                        height: 20,
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
