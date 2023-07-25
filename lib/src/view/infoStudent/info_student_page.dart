import 'package:admission_system/src/model/postStudent.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../controller/getListStudent.controller.dart';
import '../../controller/postStudent.controller.dart';
import '../../model/getListStudent.model.dart';
import 'components/add_student_page.dart';
import 'components/list_student_page.dart';

class Info_Student_page extends StatefulWidget {
  const Info_Student_page({super.key});

  @override
  State<Info_Student_page> createState() => _Info_Student_pageState();
}

List<String> option = ["Nam", "Nữ"];

class _Info_Student_pageState extends State<Info_Student_page> {
  final TextEditingController _txtFind = TextEditingController();
  List<GetStudentOtd>? listStudentOTD;
  List<GetStudentOtd>? _listStudentOTD;
  StudentController? getStudent;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_postStudentController = PostStudentController();
    getStudent = StudentController(context: context);

    getStudent!.getStudent().then((value) {
      setState(() {
        listStudentOTD = value;
        _listStudentOTD = listStudentOTD;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return SingleChildScrollView(
          child: Center(
            child: RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: () async {
                getStudent!.getStudent().then((value) {
                  setState(() {
                    listStudentOTD = value;
                    _listStudentOTD = listStudentOTD;
                  });
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
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
                          SizedBox(
                            width: 100,
                          ),
                          Expanded(
                            flex: 5,
                            child: TextFormField(
                              controller: _txtFind,
                              onChanged: (value) {
                                value = value.toLowerCase();
                                setState(() {
                                  _listStudentOTD =
                                      listStudentOTD!.where((element) {
                                    var postitle = element.cccd.toLowerCase();
                                    return postitle.contains(value);
                                  }).toList();
                                });
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color: Color.fromRGBO(23, 161, 250, 1)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color: Color.fromRGBO(23, 161, 250, 1)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                labelText: "Tìm kiếm bằng CCCD",
                                border: InputBorder.none,
                                //border: const OutlineInputBorder(),
                                hintText: "Tìm kiếm bằng CCCD",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () async {
                              // _dialogBuilder(context);
                              String refresh = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Add_Student_page()));
                              if (refresh == 'refresh') {
                                _refreshIndicatorKey.currentState?.show();
                              }
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
                                        color:
                                            Color.fromARGB(255, 226, 223, 223),
                                        blurRadius: 1,
                                        spreadRadius: 2)
                                  ]),
                              child: Text(
                                "Thêm học sinh",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                        child: List_Student_page(
                      listStudentOTD: _listStudentOTD,
                    ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Future<void> _dialogBuilder(BuildContext context) {
  //   return showDialog<void>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Thêm học sinh'),
  //         content: Container(
  //           child: SingleChildScrollView(
  //             child: Column(
  //               children: [
  //                 Container(
  //                   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
  //                   child: Column(
  //                     children: [
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Text(
  //                             "Thêm thông tin sinh viên mới",
  //                             style: TextStyle(
  //                               color: Color.fromARGB(255, 0, 61, 110),
  //                               fontSize: 20,
  //                               fontFamily: 'Montserrat',
  //                               fontWeight: FontWeight.w400,
  //                               letterSpacing: 3,
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             width: 5,
  //                           )
  //                           // InkWell(
  //                           //   onTap: () {},
  //                           //   child: Container(
  //                           //     padding: EdgeInsets.symmetric(
  //                           //         horizontal: 20, vertical: 15),
  //                           //     decoration: BoxDecoration(
  //                           //         color: Colors.white,
  //                           //         borderRadius: BorderRadius.circular(10),
  //                           //         border: Border.all(
  //                           //             color: Color.fromRGBO(23, 161, 250, 1)),
  //                           //         boxShadow: [
  //                           //           BoxShadow(
  //                           //               color: Color.fromARGB(
  //                           //                   255, 226, 223, 223),
  //                           //               blurRadius: 1,
  //                           //               spreadRadius: 2)
  //                           //         ]),
  //                           //     child: Text("Thêm học sinh"),
  //                           //   ),
  //                           // )
  //                         ],
  //                       ),
  //                       SizedBox(
  //                         height: 50,
  //                       ),
  //                       Container(
  //                           child: Column(
  //                         children: [
  //                           Container(
  //                             child: Row(
  //                               children: [
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(flex: 1, child: Text("Họ: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtHo,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "Giang",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   width: 20,
  //                                 ),
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(flex: 1, child: Text("Tên: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtTen,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: 20,
  //                           ),
  //                           Container(
  //                             child: Row(
  //                               children: [
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1, child: Text("Mã HSSV: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtMaHSSV,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   width: 20,
  //                                 ),
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1,
  //                                           child: Text("Giới tính: ")),
  //                                       Expanded(
  //                                           flex: 3,
  //                                           child: Row(
  //                                             children: [
  //                                               Container(
  //                                                   child: Row(
  //                                                 children: [
  //                                                   Text("Nam"),
  //                                                   Radio(
  //                                                     value: true,
  //                                                     groupValue: _txtGioiTinh,
  //                                                     onChanged: (value) {
  //                                                       setState(() {
  //                                                         _txtGioiTinh = value!;
  //                                                       });
  //                                                     },
  //                                                   ),
  //                                                 ],
  //                                               )),
  //                                               SizedBox(
  //                                                 width: 50,
  //                                               ),
  //                                               Container(
  //                                                   child: Row(
  //                                                 children: [
  //                                                   Text("Nữ"),
  //                                                   Radio(
  //                                                     value: false,
  //                                                     groupValue: _txtGioiTinh,
  //                                                     onChanged: (value) {
  //                                                       setState(() {
  //                                                         _txtGioiTinh = value!;
  //                                                       });
  //                                                     },
  //                                                   ),
  //                                                 ],
  //                                               )),
  //                                             ],
  //                                           )
  //                                           // TextFormField(
  //                                           //   controller: _txtGender,
  //                                           //   decoration: InputDecoration(
  //                                           //     enabledBorder: OutlineInputBorder(
  //                                           //       borderSide: const BorderSide(
  //                                           //           width: 1,
  //                                           //           color: Color.fromRGBO(
  //                                           //               23,
  //                                           //               161,
  //                                           //               250,
  //                                           //               1)), //<-- SEE HERE
  //                                           //       borderRadius:
  //                                           //           BorderRadius.circular(15),
  //                                           //     ),
  //                                           //     focusedBorder: OutlineInputBorder(
  //                                           //       borderSide: const BorderSide(
  //                                           //           width: 1,
  //                                           //           color: Color.fromRGBO(
  //                                           //               23, 161, 250, 1)),
  //                                           //       borderRadius:
  //                                           //           BorderRadius.circular(15),
  //                                           //     ),
  //                                           //     border: OutlineInputBorder(),
  //                                           //     hintText: "",
  //                                           //   ),
  //                                           // ),
  //                                           ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: 20,
  //                           ),
  //                           Container(
  //                             child: Row(
  //                               children: [
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1,
  //                                           child: Text("Ngày sinh: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           onTap: () async {
  //                                             DateTime? datimePickerStart =
  //                                                 await showDatePicker(
  //                                                     context: context,
  //                                                     initialDate:
  //                                                         DateTime.now(),
  //                                                     firstDate: DateTime(2000),
  //                                                     lastDate: DateTime(2101));
  //                                             if (datimePickerStart != null) {
  //                                               setState(() {
  //                                                 txtBirthday =
  //                                                     datimePickerStart;
  //                                                 _txtBirthday
  //                                                     .text = DateFormat(
  //                                                         'dd/MM/yyyy')
  //                                                     .format(
  //                                                         datimePickerStart);
  //                                               });
  //                                             }
  //                                           },
  //                                           controller: _txtBirthday,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   width: 20,
  //                                 ),
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1, child: Text("Nơi sinh: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtNoiSinh,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: 20,
  //                           ),
  //                           Container(
  //                             child: Row(
  //                               children: [
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1, child: Text("Quê quán: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtQueQuan,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   width: 20,
  //                                 ),
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1,
  //                                           child:
  //                                               Text("Địa chỉ thường trú: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtDiaChiThuongTru,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: 20,
  //                           ),
  //                           Container(
  //                             child: Row(
  //                               children: [
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1,
  //                                           child: Text("Nghề đăng ký: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtNgheDk,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   width: 20,
  //                                 ),
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(flex: 1, child: Text("Lớp: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtLop,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: 20,
  //                           ),
  //                           Container(
  //                             child: Row(
  //                               children: [
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1,
  //                                           child: Text("SĐT học sinh: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtSDTHocSinh,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   width: 20,
  //                                 ),
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1,
  //                                           child: Text("SĐT liên lạc: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtSDTLienLac,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: 20,
  //                           ),
  //                           Container(
  //                             child: Row(
  //                               children: [
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1, child: Text("Trình độ: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtTrinhDo,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   width: 20,
  //                                 ),
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1,
  //                                           child:
  //                                               Text("Giấy CNTN tại trường: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtGiayCNtaiTruong,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: 20,
  //                           ),
  //                           Container(
  //                             child: Row(
  //                               children: [
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1, child: Text("Học lực: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtHocLuc,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   width: 20,
  //                                 ),
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1,
  //                                           child: Text("Hạnh kiểm: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtHanhKiem,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: 20,
  //                           ),
  //                           Container(
  //                             child: Row(
  //                               children: [
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1, child: Text("TK lớp 9: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtTKLop9,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   width: 20,
  //                                 ),
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1,
  //                                           child: Text("Năm tốt nghiệp: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtNamTotNghiep,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: 20,
  //                           ),
  //                           Container(
  //                             child: Row(
  //                               children: [
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1,
  //                                           child: Text("Địa chỉ liên lạc: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtDiaChiLienLac,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   width: 20,
  //                                 ),
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1, child: Text("Dân tộc: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtNDanToc,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: 20,
  //                           ),
  //                           Container(
  //                             child: Row(
  //                               children: [
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1, child: Text("Tôn giáo: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtTonGiao,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   width: 20,
  //                                 ),
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1,
  //                                           child: Text("Đối tượng: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtDoiTuong,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: 20,
  //                           ),
  //                           Container(
  //                             child: Row(
  //                               children: [
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1, child: Text("Khu vực: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtKhuVuc,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   width: 20,
  //                                 ),
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1, child: Text("CMND: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtCMND,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: 20,
  //                           ),
  //                           Container(
  //                             child: Row(
  //                               children: [
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1, child: Text("Nơi cấp: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtNoiCap,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   width: 20,
  //                                 ),
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1, child: Text("Ngày cấp: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           onTap: () async {
  //                                             DateTime? datimePickerStart =
  //                                                 await showDatePicker(
  //                                                     context: context,
  //                                                     initialDate:
  //                                                         DateTime.now(),
  //                                                     firstDate: DateTime(2000),
  //                                                     lastDate: DateTime(2101));
  //                                             if (datimePickerStart != null) {
  //                                               setState(() {
  //                                                 txtDateRange =
  //                                                     datimePickerStart;
  //                                                 _txtNgayCap.text = DateFormat(
  //                                                         'dd/MM/yyyy')
  //                                                     .format(
  //                                                         datimePickerStart);
  //                                               });
  //                                             }
  //                                           },
  //                                           controller: _txtNgayCap,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: 20,
  //                           ),
  //                           Container(
  //                             child: Row(
  //                               children: [
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1,
  //                                           child: Text("Họ và tên Ba: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtHoTenBo,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   width: 20,
  //                                 ),
  //                                 Expanded(
  //                                   child: Row(
  //                                     children: [
  //                                       Expanded(
  //                                           flex: 1,
  //                                           child: Text("Họ và tên Mẹ: ")),
  //                                       Expanded(
  //                                         flex: 3,
  //                                         child: TextFormField(
  //                                           controller: _txtHoTenMe,
  //                                           decoration: InputDecoration(
  //                                             enabledBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23,
  //                                                       161,
  //                                                       250,
  //                                                       1)), //<-- SEE HERE
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             focusedBorder: OutlineInputBorder(
  //                                               borderSide: const BorderSide(
  //                                                   width: 1,
  //                                                   color: Color.fromRGBO(
  //                                                       23, 161, 250, 1)),
  //                                               borderRadius:
  //                                                   BorderRadius.circular(15),
  //                                             ),
  //                                             border: OutlineInputBorder(),
  //                                             hintText: "",
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: 20,
  //                           ),
  //                         ],
  //                       ))
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  // actions: <Widget>[
  //   TextButton(
  //     style: TextButton.styleFrom(
  //       textStyle: Theme.of(context).textTheme.labelLarge,
  //     ),
  //     child: const Text('Thêm học sinh'),
  //     onPressed: () {
  //       _postStudentController!.postStudentController(PostStudentOtd(
  //           maHocSinh: _txtMaHSSV.text,
  //           hoVaTenDem: _txtHo.text,
  //           ten: _txtTen.text,
  //           gioiTinh: _txtGioiTinh,
  //           ngaySinh: txtBirthday,
  //           noiSinh: _txtNoiSinh.text,
  //           queQuan: _txtQueQuan.text,
  //           diaChiThuongTru: _txtDiaChiThuongTru.text,
  //           ngheDangKy: _txtNgheDk.text,
  //           lop: _txtLop.text,
  //           sdtHocSinh: _txtSDTHocSinh.text,
  //           sdtLienLac: _txtSDTLienLac.text,
  //           trinhDo: _txtTrinhDo.text,
  //           giayCntnTruong: _txtGiayCNtaiTruong.text,
  //           hocLuc: _txtHocLuc.text,
  //           hanhKiem: _txtHanhKiem.text,
  //           diemTongKetLop9: _txtTKLop9.text,
  //           namTotNghiep: _txtNamTotNghiep.text,
  //           diaChiLienLac: _txtDiaChiLienLac.text,
  //           danToc: _txtNDanToc.text,
  //           tonGiao: _txtTonGiao.text,
  //           doiTuong: _txtDoiTuong.text,
  //           khuVuc: _txtKhuVuc.text,
  //           cccd: _txtCMND.text,
  //           ngayCap: txtDateRange,
  //           noiCap: _txtNoiCap.text,
  //           hoTenCha: _txtHoTenBo.text,
  //           hoTenMe: _txtHoTenMe.text,
  //           ghiChu: ""));
  //     },
  //   ),
  // ],
  //       );
  //     },
  //   );
  // }
}
