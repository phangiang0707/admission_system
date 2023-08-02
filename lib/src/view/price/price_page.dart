import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/getDetailStudent.controller.dart';
import '../../controller/getListPaymentStudent.controller.dart';
import '../../controller/postPayment.controller.dart';
import '../../controller/searchStudent.controller.dart';
import '../../model/getDetailStudent.model.dart';
import '../../model/getListPaymentsStudent.model.dart';
import '../../model/getListSearchStudent.model.dart';
import '../../model/sponsorModel.dart';
import '../../utils/url.dart';
import 'component/list_payments_page.dart';
import 'package:http/http.dart' as http;

class Price_page extends StatefulWidget {
  const Price_page({super.key, required this.checkRole});
  final String checkRole;
  @override
  State<Price_page> createState() => _Price_pageState();
}

class _Price_pageState extends State<Price_page> {
  SponsorModel? model;
  final TextEditingController _txtFind = TextEditingController();
  DetailStudentController? _detailStudentController;
  GetDetailStudentOtd? _studentOtd;
  GetListPaymentStudentController? _getPaymentStudentController;
  List<GetListPaymentStudentOtd>? _listGetPaymentStudentOTD;
  List<GetListPaymentStudentOtd>? listGetPaymentStudentOTD;
  List<GetListSearchStudentOtd> listSearchGetSearchStudent = [];
  List<GetListSearchStudentOtd> _listSearchGetSearchStudent = [];
  TextEditingController _createPaymentStudent = TextEditingController();
  SearchStudentController? _searchStudent;
  String _txtErrorMessage = "";
  PostPaymentController? _postPaymentController;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postPaymentController = PostPaymentController(context: context);
    _searchStudent = SearchStudentController(context: context);
    _detailStudentController = DetailStudentController(context: context);
    _getPaymentStudentController =
        GetListPaymentStudentController(context: context);
    _getPaymentStudentController!.getListPaymentStudent().then((value) {
      setState(() {
        listGetPaymentStudentOTD = value;
        _listGetPaymentStudentOTD = listGetPaymentStudentOTD;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    model = Provider.of<SponsorModel>(context, listen: false);
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () async {
        _searchStudent!.searchStudent(_txtFind.text).then((value) {
          setState(() {
            _listSearchGetSearchStudent = value;
          });
        });
        // _getPaymentStudentController!.getListPaymentStudent().then((value) {
        //   setState(() {
        //     listGetPaymentStudentOTD = value;
        //     _listGetPaymentStudentOTD = listGetPaymentStudentOTD;
        //   });
        // });
      },
      child: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        widget.checkRole == "price_page"
                            ? Text(
                                "Xác nhận học phí",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 61, 110),
                                  fontSize: 20,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 3,
                                ),
                              )
                            : Text(
                                "Xác nhận đồng phục",
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
                            onFieldSubmitted: (value) {
                              _searchStudent!
                                  .searchStudent(_txtFind.text)
                                  .then((value) {
                                setState(() {
                                  listSearchGetSearchStudent = value;
                                  _listSearchGetSearchStudent =
                                      listSearchGetSearchStudent;
                                });
                              });
                            },
                            controller: _txtFind,
                            // onTap: () {
                            //   _refreshIndicatorKey.currentState?.show();
                            // },
                            onChanged: (value) {
                              // value = value.toLowerCase();
                              // setState(() {
                              //   _listGetPaymentStudentOTD =
                              //       listGetPaymentStudentOTD!.where((element) {
                              //     var postitle =
                              //         element.student.cccd.toLowerCase();
                              //     return postitle.contains(value);
                              //   }).toList();
                              // });
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
                        // SizedBox(
                        //   width: 20,
                        // ),
                        // InkWell(
                        //   onTap: () {},
                        //   child: Container(
                        //     padding:
                        //         EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        //     decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.circular(10),
                        //         border: Border.all(
                        //             color: Color.fromRGBO(23, 161, 250, 1)),
                        //         boxShadow: [
                        //           BoxShadow(
                        //               color: Color.fromARGB(255, 226, 223, 223),
                        //               blurRadius: 1,
                        //               spreadRadius: 2)
                        //         ]),
                        //     child: Text(
                        //       "Tìm kiếm",
                        //       style: TextStyle(
                        //           fontSize: 12, fontWeight: FontWeight.bold),
                        //       textAlign: TextAlign.center,
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            _searchStudent!
                                .searchStudent(_txtFind.text)
                                .then((value) {
                              setState(() {
                                listSearchGetSearchStudent = value;
                                _listSearchGetSearchStudent =
                                    listSearchGetSearchStudent;
                              });
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
                            child: Text(
                              "Tìm kiếm",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                        // widget.checkRole == "price_page"
                        //     ? InkWell(
                        //         onTap: () {
                        //           showDialog<void>(
                        //             context: context,
                        //             barrierDismissible:
                        //                 true, // user must tap button!
                        //             builder: (BuildContext context) {
                        //               return AlertDialog(
                        //                 title:
                        //                     const Text('Tạo hóa đơn học sinh'),
                        //                 content: TextFormField(
                        //                   controller: _createPaymentStudent,
                        //                   decoration: InputDecoration(
                        //                       errorText:
                        //                           _txtErrorMessage.isEmpty
                        //                               ? null
                        //                               : _txtErrorMessage,
                        //                       hintText: "Nhập CCCD"),
                        //                 ),
                        //                 actions: <Widget>[
                        //                   Row(
                        //                     mainAxisAlignment:
                        //                         MainAxisAlignment.spaceBetween,
                        //                     children: [
                        //                       TextButton(
                        //                         child: const Text('Đóng'),
                        //                         onPressed: () {
                        //                           Navigator.of(context).pop();
                        //                         },
                        //                       ),
                        //                       InkWell(
                        //                         onTap: () {
                        //                           _searchStudent!
                        //                               .searchStudent(
                        //                                   _createPaymentStudent
                        //                                       .text
                        //                                       .toString())
                        //                               .then((value) {
                        //                             String id = value[0].id;
                        //                             print(value.length);
                        //                             if (value.isEmpty ||
                        //                                 value.length > 1) {
                        //                               Navigator.pop(context);
                        //                               _refreshIndicatorKey
                        //                                   .currentState
                        //                                   ?.show();
                        //                               final snackBar = SnackBar(
                        //                                 content: const Text(
                        //                                     'Tạo không thành công mời quay lại phòng đào tạo'),
                        //                                 action: SnackBarAction(
                        //                                   label: 'Undo',
                        //                                   onPressed: () {
                        //                                     // Some code to undo the change.
                        //                                   },
                        //                                 ),
                        //                               );
                        //                               ScaffoldMessenger.of(
                        //                                       context)
                        //                                   .showSnackBar(
                        //                                       snackBar);
                        //                             } else {
                        //                               print(
                        //                                   _createPaymentStudent
                        //                                       .text
                        //                                       .toString());
                        //                               _postPaymentController!
                        //                                   .postPaymentController(
                        //                                       id)
                        //                                   .then((value) {
                        //                                 _detailStudentController!
                        //                                     .getStudent(id)
                        //                                     .then((value) {
                        //                                   setState(() {
                        //                                     _studentOtd = value;
                        //                                   });

                        //                                   // _studentOtd == null
                        //                                   //     ? CircularProgressIndicator()
                        //                                   //     : Navigator.push(
                        //                                   //         context,
                        //                                   //         MaterialPageRoute(
                        //                                   //             builder:
                        //                                   //                 (context) =>
                        //                                   //                     List_Payments_page(
                        //                                   //                       studentOtd:
                        //                                   //                           _studentOtd,
                        //                                   //                       checkRole:
                        //                                   //                           "price_page",
                        //                                   //                     )));
                        //                                 });
                        //                               });
                        //                               // setState(() {
                        //                               //   _listGetStudent = value;
                        //                               // });
                        //                               //Navigator.pop(context);
                        //                               _refreshIndicatorKey
                        //                                   .currentState
                        //                                   ?.show();
                        //                               Navigator.pop(context);
                        //                               final snackBar = SnackBar(
                        //                                 content: const Text(
                        //                                     'Tạo thành công'),
                        //                                 action: SnackBarAction(
                        //                                   label: 'Undo',
                        //                                   onPressed: () {
                        //                                     // Some code to undo the change.
                        //                                   },
                        //                                 ),
                        //                               );
                        //                               ScaffoldMessenger.of(
                        //                                       context)
                        //                                   .showSnackBar(
                        //                                       snackBar);
                        //                             }
                        //                           });
                        //                         },
                        //                         child: Container(
                        //                             padding:
                        //                                 EdgeInsets.symmetric(
                        //                                     horizontal: 10,
                        //                                     vertical: 5),
                        //                             decoration: BoxDecoration(
                        //                                 borderRadius:
                        //                                     BorderRadius
                        //                                         .circular(10),
                        //                                 color: Color.fromRGBO(
                        //                                     23, 161, 250, 1)),
                        //                             child: Text(
                        //                               "Xác nhận",
                        //                               style: TextStyle(
                        //                                   color: Colors.white),
                        //                             )),
                        //                       ),
                        //                     ],
                        //                   )
                        //                 ],
                        //               );
                        //             },
                        //           );
                        //         },
                        //         child: Container(
                        //           padding: EdgeInsets.symmetric(
                        //               horizontal: 20, vertical: 15),
                        //           decoration: BoxDecoration(
                        //               color: Colors.white,
                        //               borderRadius: BorderRadius.circular(10),
                        //               border: Border.all(
                        //                   color:
                        //                       Color.fromRGBO(23, 161, 250, 1)),
                        //               boxShadow: [
                        //                 BoxShadow(
                        //                     color: Color.fromARGB(
                        //                         255, 226, 223, 223),
                        //                     blurRadius: 1,
                        //                     spreadRadius: 2)
                        //               ]),
                        //           child: Text(
                        //             "Tạo hóa đơn",
                        //             style: TextStyle(
                        //                 fontSize: 12,
                        //                 fontWeight: FontWeight.bold),
                        //             textAlign: TextAlign.center,
                        //           ),
                        //         ),
                        //       )
                        //     : SizedBox()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: _listSearchGetSearchStudent == []
                        ? SizedBox()
                        : DataTable(
                            columns: const <DataColumn>[
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Mã học sinh',
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Họ và tên đệm',
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Tên',
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'CCCD',
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Giấy CNTN tại Trường',
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Số điện thoại',
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Ngày đăng ký',
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    '',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                            ],
                            rows: _listSearchGetSearchStudent
                                .map(
                                  (e) => DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text(
                                        e.maHocSinh,
                                        style: TextStyle(fontSize: 18),
                                      )),
                                      DataCell(Text(
                                        e.hoVaTenDem,
                                        style: TextStyle(fontSize: 18),
                                      )),
                                      DataCell(Text(
                                        e.ten,
                                        style: TextStyle(fontSize: 18),
                                      )),
                                      DataCell(Text(
                                        e.cccd,
                                        style: TextStyle(fontSize: 18),
                                      )),
                                      DataCell(Text(
                                        e.giayCntnTruong,
                                        style: TextStyle(fontSize: 18),
                                      )),
                                      DataCell(Text(
                                        e.sdtHocSinh,
                                        style: TextStyle(fontSize: 18),
                                      )),
                                      DataCell(Text(
                                          "${e.createdAt.day}/${e.createdAt.month}/${e.createdAt.year}")),
                                      DataCell(e.hasPayment == true
                                          ? IconButton(
                                              onPressed: () {
                                                _detailStudentController!
                                                    .getStudent(e.id)
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
                                                                    checkRole:
                                                                        widget
                                                                            .checkRole,
                                                                  )));
                                                });
                                              },
                                              icon: Icon(
                                                Icons.skip_next,
                                                color: Color.fromRGBO(
                                                    23, 161, 250, 1),
                                              ),
                                            )
                                          : IconButton(
                                              onPressed: () async {
                                                final response =
                                                    await http.post(
                                                  Uri.parse('${url}payments'),
                                                  body: jsonEncode(
                                                      {"studentId": e.id}),
                                                  headers: {
                                                    "Content-Type":
                                                        "application/json",
                                                    "Authorization":
                                                        "Bearer ${model!.getLogin!.accessToken}",
                                                  },
                                                );
                                                if (response.statusCode !=
                                                    201) {
                                                  final snackBar = SnackBar(
                                                    content: const Text(
                                                        'Học sinh chưa xác nhận nhập học mời quay lại phòng đào tạo'),
                                                  );
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                }
                                                _postPaymentController!
                                                    .postPaymentController(e.id)
                                                    .then((value) {
                                                  // _detailStudentController!
                                                  //     .getStudent(e.id)
                                                  //     .then((value) {
                                                  //   setState(() {
                                                  //     _studentOtd = value;
                                                  //   });
                                                  // });
                                                });
                                                _refreshIndicatorKey
                                                    .currentState
                                                    ?.show();
                                                // _postPaymentController!
                                                //                                   .postPaymentController(
                                                //                                       id)
                                                //                                   .then((value) {
                                                //                                 _detailStudentController!
                                                //                                     .getStudent(id)
                                                //                                     .then((value) {
                                                //                                   setState(() {
                                                //                                     _studentOtd = value;
                                                //                                   });
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                color: Color.fromRGBO(
                                                    23, 161, 250, 1),
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
        ),
      ),
    );
  }
}
