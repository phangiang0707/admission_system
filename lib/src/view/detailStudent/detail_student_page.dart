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
        _txtDateRange.text = "_studentOtd!.ngayCap";
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(23, 161, 250, 1),
                  blurRadius: 1,
                  spreadRadius: 2)
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
            //----------------------------Họ - Tên - Mã HSSV-----------------
            Container(
                child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Text("Họ: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtSurname,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "Giang",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Tên: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtName,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Mã HSSV: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtCode,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
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
                  height: 20,
                ),
                //--------------------------------Giới tính - Ngày sinh - Nơi sinh - Quê quán --------------------
                Container(
                  child: Row(
                    children: [
                      Text("Giới tính: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtGender,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Ngày sinh: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtBirthday,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Nơi sinh: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtBirthplace,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Quê quán: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtProvince,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
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
                  height: 20,
                ),
                //--------------------------------Địa chỉ thường trú --------------------
                Container(
                  child: Row(
                    children: [
                      Text("Địa chỉ thường trú: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtProfession,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
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
                  height: 20,
                ),
                //--------------------------------Nghề đăng ký - Lớp - SĐT HS- SĐT liên lạc--------------------
                Container(
                  child: Row(
                    children: [
                      Text("Nghề đăng ký: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtNgheDk,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Lớp: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtClass,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("SĐT học sinh: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtNumberPhoneStudent,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("SĐT liên lạc: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtNumberPhone,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
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
                  height: 20,
                ),
                //--------------------------------Trình độ - Giấy CN tốt nghiệp tại trường - Học lực- Hạnh kiểm--------------------
                Container(
                  child: Row(
                    children: [
                      Text("Trình độ: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtLevel,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Giấy CN tốt nghiệp tại trường: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtCertification,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Học lực: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtAcademicAbility,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Hạnh kiểm: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtConduct,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
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
                  height: 20,
                ),
                //--------------------------------TK lớp 9 - Năm tốt nghiệp - Địa chỉ liên lạc - Dân tộc-------------------
                Container(
                  child: Row(
                    children: [
                      Text("TK lớp 9: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtTKclass9,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Năm tốt nghiệp: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtGraduationyear,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Địa chỉ liên lạc: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtContactAddress,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Dân tộc: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtNation,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
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
                  height: 20,
                ),
                //--------------------------------Tôn giáo - Đối tượng - Khu vực - CMND - Ngày cấp-------------------
                Container(
                  child: Row(
                    children: [
                      Text("Tôn giáo: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtReligion,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Đối tượng: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtObject,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Khu vực: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtArea,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("CMND: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtCMND,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Ngày cấp: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtDateRange,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
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
                  height: 20,
                ),
                //--------------------------------Nơi cấp - Họ và tên Ba - Họ và tên Mẹ -------------------
                Container(
                  child: Row(
                    children: [
                      Text("Nơi cấp: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtIssuedby,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Họ và tên Ba: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtFathername,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            border: OutlineInputBorder(),
                            hintText: "",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Họ và tên Mẹ: "),
                      Expanded(
                        child: TextFormField(
                          controller: _txtMothername,
                          decoration: InputDecoration(
                            enabled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
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
            ))
          ],
        ),
      ),
    );
  }
}
