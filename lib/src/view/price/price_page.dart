import 'package:flutter/material.dart';
import '../../controller/getDetailStudent.controller.dart';
import '../../controller/getListPaymentStudent.controller.dart';
import '../../controller/postPayment.controller.dart';
import '../../controller/searchStudent.controller.dart';
import '../../model/getDetailStudent.model.dart';
import '../../model/getListStudent.model.dart';
import '../../model/getListPaymentsStudent.model.dart';
import '../../model/getPaymentStudent.model.dart';
import 'component/list_payments_page.dart';

class Price_page extends StatefulWidget {
  const Price_page({super.key});

  @override
  State<Price_page> createState() => _Price_pageState();
}

class _Price_pageState extends State<Price_page> {
  final TextEditingController _txtFind = TextEditingController();
  DetailStudentController? _detailStudentController;
  GetDetailStudentOtd? _studentOtd;
  GetListPaymentStudentController? _getPaymentStudentController;
  List<GetListPaymentStudentOtd>? _listGetPaymentStudentOTD;
  List<GetListPaymentStudentOtd>? listGetPaymentStudentOTD;
  TextEditingController _createPaymentStudent = TextEditingController();
  List<GetStudentOtd>? _listGetStudent;
  SearchStudentController? _searchStudent;
  String _txtErrorMessage = "";
  GetPaymentStudentOtd? _getPaymentStudent;
  PostPaymentController? _postPaymentController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postPaymentController = PostPaymentController();
    _searchStudent = SearchStudentController();
    _detailStudentController = DetailStudentController();
    _getPaymentStudentController = GetListPaymentStudentController();
    _getPaymentStudentController!.getListPaymentStudent().then((value) {
      setState(() {
        listGetPaymentStudentOTD = value;
        _listGetPaymentStudentOTD = listGetPaymentStudentOTD;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    Text(
                      "Xác nhận học phí",
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
                            _listGetPaymentStudentOTD =
                                listGetPaymentStudentOTD!.where((element) {
                              var postitle = element.student.cccd.toLowerCase();
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
                          labelText: "Tìm kiếm",
                          border: InputBorder.none,
                          //border: const OutlineInputBorder(),
                          hintText: "Tìm kiếm",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                        child: Text(
                          "Tìm kiếm",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: true, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Tạo hóa đơn học sinh'),
                              content: TextFormField(
                                controller: _createPaymentStudent,
                                decoration: InputDecoration(
                                    errorText: _txtErrorMessage.isEmpty
                                        ? null
                                        : _txtErrorMessage,
                                    hintText: "Nhập CCCD"),
                              ),
                              actions: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      child: const Text('Đóng'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _searchStudent!
                                            .searchStudent(_createPaymentStudent
                                                .text
                                                .toString())
                                            .then((value) {
                                          String id = value[0].id;
                                          print(value.length);
                                          if (value.isEmpty) {
                                            print(_createPaymentStudent.text
                                                .toString());
                                            _txtErrorMessage =
                                                "Không tìm thấy thông tin học sinh";
                                            setState(() {});
                                          } else {
                                            print(_createPaymentStudent.text
                                                .toString());
                                            _postPaymentController!
                                                .postPaymentController(id)
                                                .then((value) {
                                              _detailStudentController!
                                                  .getStudent(id)
                                                  .then((value) {
                                                setState(() {
                                                  _studentOtd = value;
                                                });
                                                _studentOtd == null
                                                    ? CircularProgressIndicator()
                                                    : Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                List_Payments_page(
                                                                  studentOtd:
                                                                      _studentOtd,
                                                                )));
                                              });
                                            });
                                            // setState(() {
                                            //   _listGetStudent = value;
                                            // });
                                            //Navigator.pop(context);
                                          }
                                        });
                                      },
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1)),
                                          child: Text(
                                            "Xác nhận",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                        child: Text(
                          "Tạo hóa đơn",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: _listGetPaymentStudentOTD == null
                    ? SizedBox()
                    : DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Họ và Tên',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'CCCD',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Số điện thoại',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                '',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                        ],
                        rows: _listGetPaymentStudentOTD!
                            .map(
                              (e) => DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(e.student.hoTen)),
                                  DataCell(Text(e.student.cccd)),
                                  DataCell(Text(e.student.sdtHocSinh)),
                                  DataCell(IconButton(
                                    onPressed: () {
                                      _detailStudentController!
                                          .getStudent(e.student.id)
                                          .then((value) {
                                        setState(() {
                                          _studentOtd = value;
                                        });
                                        _studentOtd == null
                                            ? CircularProgressIndicator()
                                            : Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        List_Payments_page(
                                                          studentOtd:
                                                              _studentOtd,
                                                        )));
                                      });
                                    },
                                    icon: Icon(
                                      Icons.skip_next,
                                      color: Color.fromRGBO(23, 161, 250, 1),
                                    ),
                                  )),
                                ],
                              ),
                            )
                            .toList(),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> _showMyDialog() async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Tạo học phí học sinh'),
  //         content: TextFormField(
  //           controller: _createPaymentStudent,
  //           decoration: InputDecoration(
  //               errorText: _txtErrorMessage.isEmpty ? null : _txtErrorMessage),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('Xác nhận'),
  //             onPressed: () {
  //               _searchStudent!
  //                   .searchStudent(_createPaymentStudent.toString())
  //                   .then((value) {
  //                 print(value!.length);
  //                 if (value.isEmpty) {
  //                   _txtErrorMessage = "Không tìm thấy thông tin học sinh";
  //                   setState(() {});
  //                 } else {
  //                   print(_createPaymentStudent.toString());
  //                   setState(() {
  //                     _listGetStudent = value;
  //                   });
  //                   Navigator.pop(context);
  //                 }
  //               });
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
