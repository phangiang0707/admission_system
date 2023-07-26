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
    _postStudentController = PostStudentController(context: context);
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
        height: double.infinity,
        width: double.infinity,
        color: Color.fromRGBO(238, 239, 241, 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
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
                              "Thêm thông tin sinh viên mới",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                letterSpacing: 3,
                              ),
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
                                        diaChiThuongTru:
                                            _txtDiaChiThuongTru.text,
                                        ngheDangKy: _txtNgheDk.text,
                                        lop: _txtLop.text,
                                        sdtHocSinh: _txtSDTHocSinh.text,
                                        sdtLienLac: _txtSDTLienLac.text,
                                        trinhDo: _txtTrinhDo.text,
                                        giayCntnTruong:
                                            _txtGiayCNtaiTruong.text,
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
                                child: Row(
                                  children: [
                                    Text(
                                      "Thêm học sinh",
                                      style: TextStyle(color: Colors.white),
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                              child: TextField(
                                            controller: _txtHo,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              isDense: true, // Added this
                                              contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                              child: TextField(
                                            controller: _txtTen,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              isDense: true, // Added this
                                              contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                              child: TextField(
                                            controller: _txtMaHSSV,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              isDense: true, // Added this
                                              contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                              child: TextField(
                                            onTap: () async {
                                              DateTime? datimePickerStart =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime(2000),
                                                      lastDate: DateTime(2101));
                                              if (datimePickerStart != null) {
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
                                              border: OutlineInputBorder(),
                                              isDense: true, // Added this
                                              contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                              child: TextField(
                                            controller: _txtNoiSinh,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              isDense: true, // Added this
                                              contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                              child: TextField(
                                            controller: _txtQueQuan,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              isDense: true, // Added this
                                              contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                              child: TextField(
                                            controller: _txtDiaChiThuongTru,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              isDense: true, // Added this
                                              contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                              child: TextField(
                                            controller: _txtNgheDk,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              isDense: true, // Added this
                                              contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                              child: TextField(
                                            controller: _txtLop,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              isDense: true, // Added this
                                              contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                              child: TextField(
                                            controller: _txtSDTHocSinh,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              isDense: true, // Added this
                                              contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                              child: TextField(
                                            controller: _txtSDTLienLac,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              isDense: true, // Added this
                                              contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                              child: TextField(
                                            controller: _txtTrinhDo,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              isDense: true, // Added this
                                              contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                              child: TextField(
                                            controller: _txtGiayCNtaiTruong,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              isDense: true, // Added this
                                              contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                              child: TextField(
                                            controller: _txtHocLuc,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              isDense: true, // Added this
                                              contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            child: TextField(
                                              controller: _txtHanhKiem,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                isDense: true, // Added this
                                                contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            child: TextField(
                                              controller: _txtTKLop9,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                isDense: true, // Added this
                                                contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            child: TextField(
                                              controller: _txtNamTotNghiep,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                isDense: true, // Added this
                                                contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            child: TextField(
                                              controller: _txtDiaChiLienLac,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                isDense: true, // Added this
                                                contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            child: TextField(
                                              controller: _txtNDanToc,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                isDense: true, // Added this
                                                contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            child: TextField(
                                              controller: _txtTonGiao,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                isDense: true, // Added this
                                                contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            child: TextField(
                                              controller: _txtDoiTuong,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                isDense: true, // Added this
                                                contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            child: TextField(
                                              controller: _txtKhuVuc,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                isDense: true, // Added this
                                                contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            child: TextField(
                                              controller: _txtCMND,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                isDense: true, // Added this
                                                contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            child: TextField(
                                              controller: _txtNoiCap,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                isDense: true, // Added this
                                                contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            child: TextField(
                                              onTap: () async {
                                                DateTime? datimePickerStart =
                                                    await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime(2000),
                                                        lastDate:
                                                            DateTime(2101));
                                                if (datimePickerStart != null) {
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
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                isDense: true, // Added this
                                                contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            child: TextField(
                                              controller: _txtHoTenBo,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                isDense: true, // Added this
                                                contentPadding: EdgeInsets.all(
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            child: TextField(
                                              controller: _txtHoTenMe,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                isDense: true, // Added this
                                                contentPadding: EdgeInsets.all(
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
