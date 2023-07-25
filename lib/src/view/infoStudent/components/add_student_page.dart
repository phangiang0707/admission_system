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
                                            controller: _txtDoiTuong,
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
                      // Container(
                      //     child: Column(
                      //   children: [
                      //     Container(
                      //       child: Row(
                      //         children: [
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(flex: 1, child: Text("Họ: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     controller: _txtHo,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "Giang",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: 20,
                      //           ),
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(flex: 1, child: Text("Tên: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     controller: _txtTen,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 20,
                      //     ),
                      //     Container(
                      //       child: Row(
                      //         children: [
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(flex: 1, child: Text("Mã HSSV: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     controller: _txtMaHSSV,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: 20,
                      //           ),
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(
                      //                     flex: 1, child: Text("Giới tính: ")),
                      //                 Expanded(
                      //                     flex: 3,
                      //                     child: Row(
                      //                       children: [
                      //                         Container(
                      //                             child: Row(
                      //                           children: [
                      //                             Text("Nam"),
                      //                             Radio(
                      //                               value: true,
                      //                               groupValue: _txtGioiTinh,
                      //                               onChanged: (value) {
                      //                                 setState(() {
                      //                                   _txtGioiTinh = value!;
                      //                                 });
                      //                               },
                      //                             ),
                      //                           ],
                      //                         )),
                      //                         SizedBox(
                      //                           width: 50,
                      //                         ),
                      //                         Container(
                      //                             child: Row(
                      //                           children: [
                      //                             Text("Nữ"),
                      //                             Radio(
                      //                               value: false,
                      //                               groupValue: _txtGioiTinh,
                      //                               onChanged: (value) {
                      //                                 setState(() {
                      //                                   _txtGioiTinh = value!;
                      //                                 });
                      //                               },
                      //                             ),
                      //                           ],
                      //                         )),
                      //                       ],
                      //                     )
                      //                     // TextFormField(
                      //                     //   controller: _txtGender,
                      //                     //   decoration: InputDecoration(
                      //                     //     enabledBorder: OutlineInputBorder(
                      //                     //       borderSide: const BorderSide(
                      //                     //           width: 1,
                      //                     //           color: Color.fromRGBO(
                      //                     //               23,
                      //                     //               161,
                      //                     //               250,
                      //                     //               1)), //<-- SEE HERE
                      //                     //       borderRadius:
                      //                     //           BorderRadius.circular(15),
                      //                     //     ),
                      //                     //     focusedBorder: OutlineInputBorder(
                      //                     //       borderSide: const BorderSide(
                      //                     //           width: 1,
                      //                     //           color: Color.fromRGBO(
                      //                     //               23, 161, 250, 1)),
                      //                     //       borderRadius:
                      //                     //           BorderRadius.circular(15),
                      //                     //     ),
                      //                     //     border: OutlineInputBorder(),
                      //                     //     hintText: "",
                      //                     //   ),
                      //                     // ),
                      //                     ),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 20,
                      //     ),
                      //     Container(
                      //       child: Row(
                      //         children: [
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(
                      //                     flex: 1, child: Text("Ngày sinh: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     onTap: () async {
                      //                       DateTime? datimePickerStart =
                      //                           await showDatePicker(
                      //                               context: context,
                      //                               initialDate: DateTime.now(),
                      //                               firstDate: DateTime(2000),
                      //                               lastDate: DateTime(2101));
                      //                       if (datimePickerStart != null) {
                      //                         setState(() {
                      //                           txtBirthday = datimePickerStart;
                      //                           _txtBirthday.text = DateFormat(
                      //                                   'dd/MM/yyyy')
                      //                               .format(datimePickerStart);
                      //                         });
                      //                       }
                      //                     },
                      //                     controller: _txtBirthday,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: 20,
                      //           ),
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(
                      //                     flex: 1, child: Text("Nơi sinh: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     controller: _txtNoiSinh,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 20,
                      //     ),
                      //     Container(
                      //       child: Row(
                      //         children: [
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(
                      //                     flex: 1, child: Text("Quê quán: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     controller: _txtQueQuan,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: 20,
                      //           ),
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(
                      //                     flex: 1,
                      //                     child: Text("Địa chỉ thường trú: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     controller: _txtDiaChiThuongTru,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 20,
                      //     ),
                      //     Container(
                      //       child: Row(
                      //         children: [
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(
                      //                     flex: 1, child: Text("Nghề đăng ký: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     controller: _txtNgheDk,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: 20,
                      //           ),
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(flex: 1, child: Text("Lớp: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     controller: _txtLop,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 20,
                      //     ),
                      //     Container(
                      //       child: Row(
                      //         children: [
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(
                      //                     flex: 1, child: Text("SĐT học sinh: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     controller: _txtSDTHocSinh,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: 20,
                      //           ),
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(
                      //                     flex: 1, child: Text("SĐT liên lạc: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     controller: _txtSDTLienLac,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 20,
                      //     ),
                      //     Container(
                      //       child: Row(
                      //         children: [
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(
                      //                     flex: 1, child: Text("Trình độ: ")),
                      //                 Expanded(
                      //                     flex: 3,
                      //                     child: Row(
                      //                       children: [
                      //                         Container(
                      //                             child: Row(
                      //                           children: [
                      //                             Text("Trung cấp"),
                      //                             Radio(
                      //                               value: false,
                      //                               groupValue: txtTrinhDo,
                      //                               onChanged: (value) {
                      //                                 setState(() {
                      //                                   txtTrinhDo = value!;
                      //                                   _txtTrinhDo.text =
                      //                                       "TRUNG_CAP";
                      //                                 });
                      //                               },
                      //                             ),
                      //                           ],
                      //                         )),
                      //                         SizedBox(
                      //                           width: 50,
                      //                         ),
                      //                         Container(
                      //                             child: Row(
                      //                           children: [
                      //                             Text("Cao đẳng"),
                      //                             Radio(
                      //                               value: true,
                      //                               groupValue: txtTrinhDo,
                      //                               onChanged: (value) {
                      //                                 setState(() {
                      //                                   txtTrinhDo = value!;
                      //                                   _txtTrinhDo.text =
                      //                                       "CAO_DANG";
                      //                                 });
                      //                               },
                      //                             ),
                      //                           ],
                      //                         )),
                      //                       ],
                      //                     )
                      //                     // TextFormField(
                      //                     //   controller: _txtTrinhDo,
                      //                     //   decoration: InputDecoration(
                      //                     //     enabledBorder: OutlineInputBorder(
                      //                     //       borderSide: const BorderSide(
                      //                     //           width: 1,
                      //                     //           color: Color.fromRGBO(23, 161,
                      //                     //               250, 1)), //<-- SEE HERE
                      //                     //       borderRadius:
                      //                     //           BorderRadius.circular(15),
                      //                     //     ),
                      //                     //     focusedBorder: OutlineInputBorder(
                      //                     //       borderSide: const BorderSide(
                      //                     //           width: 1,
                      //                     //           color: Color.fromRGBO(
                      //                     //               23, 161, 250, 1)),
                      //                     //       borderRadius:
                      //                     //           BorderRadius.circular(15),
                      //                     //     ),
                      //                     //     border: OutlineInputBorder(),
                      //                     //     hintText: "",
                      //                     //   ),
                      //                     // ),
                      //                     ),
                      //               ],
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: 20,
                      //           ),
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(
                      //                     flex: 1,
                      //                     child: Text("Giấy CNTN tại trường: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     controller: _txtGiayCNtaiTruong,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 20,
                      //     ),
                      //     Container(
                      //       child: Row(
                      //         children: [
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(flex: 1, child: Text("Học lực: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     controller: _txtHocLuc,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: 20,
                      //           ),
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(
                      //                     flex: 1, child: Text("Hạnh kiểm: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     controller: _txtHanhKiem,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 20,
                      //     ),
                      //     Container(
                      //       child: Row(
                      //         children: [
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(
                      //                     flex: 1, child: Text("TK lớp 9: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     controller: _txtTKLop9,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: 20,
                      //           ),
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(
                      //                     flex: 1,
                      //                     child: Text("Năm tốt nghiệp: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     controller: _txtNamTotNghiep,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 20,
                      //     ),
                      //     Container(
                      //       child: Row(
                      //         children: [
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(
                      //                     flex: 1,
                      //                     child: Text("Địa chỉ liên lạc: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     controller: _txtDiaChiLienLac,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: 20,
                      //           ),
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(flex: 1, child: Text("Dân tộc: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     controller: _txtNDanToc,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 20,
                      //     ),
                      //     Container(
                      //       child: Row(
                      //         children: [
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(
                      //                     flex: 1, child: Text("Tôn giáo: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     controller: _txtTonGiao,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: 20,
                      //           ),
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(
                      //                     flex: 1, child: Text("Đối tượng: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     controller: _txtDoiTuong,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 20,
                      //     ),
                      //     Container(
                      //       child: Row(
                      //         children: [
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(flex: 1, child: Text("Khu vực: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     controller: _txtKhuVuc,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: 20,
                      //           ),
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(flex: 1, child: Text("CMND: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     controller: _txtCMND,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 20,
                      //     ),
                      //     Container(
                      //       child: Row(
                      //         children: [
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(flex: 1, child: Text("Nơi cấp: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     controller: _txtNoiCap,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: 20,
                      //           ),
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(
                      //                     flex: 1, child: Text("Ngày cấp: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     onTap: () async {
                      //                       DateTime? datimePickerStart =
                      //                           await showDatePicker(
                      //                               context: context,
                      //                               initialDate: DateTime.now(),
                      //                               firstDate: DateTime(2000),
                      //                               lastDate: DateTime(2101));
                      //                       if (datimePickerStart != null) {
                      //                         setState(() {
                      //                           txtDateRange = datimePickerStart;
                      //                           _txtNgayCap.text = DateFormat(
                      //                                   'dd/MM/yyyy')
                      //                               .format(datimePickerStart);
                      //                         });
                      //                       }
                      //                     },
                      //                     controller: _txtNgayCap,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 20,
                      //     ),
                      //     Container(
                      //       child: Row(
                      //         children: [
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(
                      //                     flex: 1, child: Text("Họ và tên Ba: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     controller: _txtHoTenBo,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             width: 20,
                      //           ),
                      //           Expanded(
                      //             child: Row(
                      //               children: [
                      //                 Expanded(
                      //                     flex: 1, child: Text("Họ và tên Mẹ: ")),
                      //                 Expanded(
                      //                   flex: 3,
                      //                   child: TextFormField(
                      //                     controller: _txtHoTenMe,
                      //                     decoration: InputDecoration(
                      //                       enabledBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(23, 161,
                      //                                 250, 1)), //<-- SEE HERE
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       focusedBorder: OutlineInputBorder(
                      //                         borderSide: const BorderSide(
                      //                             width: 1,
                      //                             color: Color.fromRGBO(
                      //                                 23, 161, 250, 1)),
                      //                         borderRadius:
                      //                             BorderRadius.circular(15),
                      //                       ),
                      //                       border: OutlineInputBorder(),
                      //                       hintText: "",
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 20,
                      //     ),
                      //   ],
                      // ))
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
