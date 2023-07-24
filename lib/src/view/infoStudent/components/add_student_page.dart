import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../controller/postStudent.controller.dart';
import '../../../model/postStudent.model.dart';

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
  bool txtTrinhDo = true;
  bool _txtGioiTinh = true;
  DateTime txtBirthday = DateTime.now();
  DateTime txtDateRange = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
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
                          "Thêm thông tin sinh viên mới",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 61, 110),
                            fontSize: 20,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 3,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            _postStudentController!
                                .postStudentController(PostStudentOtd(
                                    maHocSinh: _txtMaHSSV.text,
                                    hoVaTenDem: _txtHo.text,
                                    ten: _txtTen.text,
                                    gioiTinh: _txtGioiTinh,
                                    ngaySinh: txtBirthday,
                                    noiSinh: _txtNoiSinh.text,
                                    queQuan: _txtQueQuan.text,
                                    diaChiThuongTru: _txtDiaChiThuongTru.text,
                                    ngheDangKy: _txtNgheDk.text,
                                    lop: _txtLop.text,
                                    sdtHocSinh: _txtSDTHocSinh.text,
                                    sdtLienLac: _txtSDTLienLac.text,
                                    trinhDo: _txtTrinhDo.text,
                                    giayCntnTruong: _txtGiayCNtaiTruong.text,
                                    hocLuc: _txtHocLuc.text,
                                    hanhKiem: _txtHanhKiem.text,
                                    diemTongKetLop9: _txtTKLop9.text,
                                    namTotNghiep: _txtNamTotNghiep.text,
                                    diaChiLienLac: _txtDiaChiLienLac.text,
                                    danToc: _txtNDanToc.text,
                                    tonGiao: _txtTonGiao.text,
                                    doiTuong: _txtDoiTuong.text,
                                    khuVuc: _txtKhuVuc.text,
                                    cccd: _txtCMND.text,
                                    ngayCap: txtDateRange,
                                    noiCap: _txtNoiCap.text,
                                    hoTenCha: _txtHoTenBo.text,
                                    hoTenMe: _txtHoTenMe.text,
                                    ghiChu: ""))
                                .then((value) {
                              Navigator.pop(context, 'refresh');
                            });
                          },
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
                                        controller: _txtHo,
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
                                        controller: _txtTen,
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
                                        controller: _txtMaHSSV,
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
                                        flex: 1, child: Text("Giới tính: ")),
                                    Expanded(
                                        flex: 3,
                                        child: Row(
                                          children: [
                                            Container(
                                                child: Row(
                                              children: [
                                                Text("Nam"),
                                                Radio(
                                                  value: true,
                                                  groupValue: _txtGioiTinh,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _txtGioiTinh = value!;
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
                                                  groupValue: _txtGioiTinh,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _txtGioiTinh = value!;
                                                    });
                                                  },
                                                ),
                                              ],
                                            )),
                                          ],
                                        )
                                        // TextFormField(
                                        //   controller: _txtGender,
                                        //   decoration: InputDecoration(
                                        //     enabledBorder: OutlineInputBorder(
                                        //       borderSide: const BorderSide(
                                        //           width: 1,
                                        //           color: Color.fromRGBO(
                                        //               23,
                                        //               161,
                                        //               250,
                                        //               1)), //<-- SEE HERE
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
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1, child: Text("Ngày sinh: ")),
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
                                              _txtBirthday.text = DateFormat(
                                                      'dd/MM/yyyy')
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
                                    Expanded(
                                        flex: 1, child: Text("Nơi sinh: ")),
                                    Expanded(
                                      flex: 3,
                                      child: TextFormField(
                                        controller: _txtNoiSinh,
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
                                        flex: 1, child: Text("Quê quán: ")),
                                    Expanded(
                                      flex: 3,
                                      child: TextFormField(
                                        controller: _txtQueQuan,
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
                                        controller: _txtDiaChiThuongTru,
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
                                        controller: _txtLop,
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
                                        controller: _txtSDTHocSinh,
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
                                        controller: _txtSDTLienLac,
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
                                        flex: 1, child: Text("Trình độ: ")),
                                    Expanded(
                                        flex: 3,
                                        child: Row(
                                          children: [
                                            Container(
                                                child: Row(
                                              children: [
                                                Text("Trung cấp"),
                                                Radio(
                                                  value: false,
                                                  groupValue: txtTrinhDo,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      txtTrinhDo = value!;
                                                      _txtTrinhDo.text =
                                                          "TRUNG_CAP";
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
                                                Text("Cao đẳng"),
                                                Radio(
                                                  value: true,
                                                  groupValue: txtTrinhDo,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      txtTrinhDo = value!;
                                                      _txtTrinhDo.text =
                                                          "CAO_DANG";
                                                    });
                                                  },
                                                ),
                                              ],
                                            )),
                                          ],
                                        )
                                        // TextFormField(
                                        //   controller: _txtTrinhDo,
                                        //   decoration: InputDecoration(
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
                                      flex: 3,
                                      child: TextFormField(
                                        controller: _txtGiayCNtaiTruong,
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
                                        controller: _txtHocLuc,
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
                                        flex: 1, child: Text("Hạnh kiểm: ")),
                                    Expanded(
                                      flex: 3,
                                      child: TextFormField(
                                        controller: _txtHanhKiem,
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
                                        flex: 1, child: Text("TK lớp 9: ")),
                                    Expanded(
                                      flex: 3,
                                      child: TextFormField(
                                        controller: _txtTKLop9,
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
                                        child: Text("Năm tốt nghiệp: ")),
                                    Expanded(
                                      flex: 3,
                                      child: TextFormField(
                                        controller: _txtNamTotNghiep,
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
                                        controller: _txtDiaChiLienLac,
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
                                        controller: _txtNDanToc,
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
                                        flex: 1, child: Text("Tôn giáo: ")),
                                    Expanded(
                                      flex: 3,
                                      child: TextFormField(
                                        controller: _txtTonGiao,
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
                                        flex: 1, child: Text("Đối tượng: ")),
                                    Expanded(
                                      flex: 3,
                                      child: TextFormField(
                                        controller: _txtDoiTuong,
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
                                        controller: _txtKhuVuc,
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
                                        controller: _txtNoiCap,
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
                                        flex: 1, child: Text("Ngày cấp: ")),
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
                                              _txtNgayCap.text = DateFormat(
                                                      'dd/MM/yyyy')
                                                  .format(datimePickerStart);
                                            });
                                          }
                                        },
                                        controller: _txtNgayCap,
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
                                        controller: _txtHoTenBo,
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
                                        controller: _txtHoTenMe,
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
      ),
    );
  }
}
