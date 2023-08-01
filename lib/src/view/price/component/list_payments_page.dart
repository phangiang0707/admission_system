import 'package:admission_system/src/model/putPaymentStudent.model.dart';
import 'package:flutter/material.dart';

import '../../../controller/getListPayments.controller.dart';
import '../../../controller/getPaymentStudent.controller.dart';
import '../../../controller/postDelivery.controller.dart';
import '../../../controller/putPaymentStudent.controller.dart';
import '../../../model/getDetailStudent.model.dart';
import '../../../model/getListPayments.model.dart';
import '../../../model/getPaymentStudent.model.dart';
import 'print_payments_page.dart';

class List_Payments_page extends StatefulWidget {
  const List_Payments_page(
      {super.key, required this.studentOtd, required this.checkRole});
  final GetDetailStudentOtd? studentOtd;
  final String checkRole;
  @override
  State<List_Payments_page> createState() => _List_Payments_pageState();
}

class _List_Payments_pageState extends State<List_Payments_page> {
  List<GetPaymentsOtd>? _getPaymentsOtd;
  List<listPayment> _listPayments = [];
  PaymentsController? _paymentsController;
  GetPaymentStudentController? _getStudentController;
  GetPaymentStudentOtd? _getStudentOtd;
  PutPaymentStudentController? _putStudentController;
  PostDeliveryController? _postDeliveryController;
  String type = 'TRUC_TIEP';
  bool check = false;
  List<Item1> items = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postDeliveryController = PostDeliveryController(context: context);
    _putStudentController = PutPaymentStudentController(context: context);
    _paymentsController = PaymentsController(context: context);
    _getStudentController = GetPaymentStudentController(context: context);
    _paymentsController!.getPayments(widget.studentOtd!.trinhDo).then((value) {
      setState(() {
        _getPaymentsOtd = value;
      });
      _getStudentController!.getStudent(widget.studentOtd!.id).then((value) {
        setState(() {
          _getStudentOtd = value;
        });
        if (widget.checkRole == "price_page") {
          for (int j = 0; j < _getStudentOtd!.items.length; j++) {
            for (int i = 0; i < _getPaymentsOtd!.length; i++) {
              print(
                  "--------------------------------------------${_getStudentOtd!.items[j].id}");
              print(
                  "--------------------------------------------${_getPaymentsOtd![i].id}------------------------------------");
              if (_getStudentOtd!.items[j].id == _getPaymentsOtd![i].id) {
                setState(() {
                  _listPayments.add(listPayment(
                      y: j + 1,
                      id: _getPaymentsOtd![i].id,
                      name: _getPaymentsOtd![i].name,
                      checked: _getStudentOtd!.items[j].checked,
                      quantiy: _getPaymentsOtd![i].quantity,
                      type: _getPaymentsOtd![i].type,
                      price: _getPaymentsOtd![i].price,
                      note: _getPaymentsOtd![i].note));
                });
              }
            }
          }
        } else {
          for (int j = 0; j < _getStudentOtd!.items.length; j++) {
            for (int i = 0; i < _getPaymentsOtd!.length; i++) {
              print(
                  "--------------------------------------------${_getStudentOtd!.items[j].id}");
              print(
                  "--------------------------------------------${_getPaymentsOtd![i].id}------------------------------------");
              if (_getStudentOtd!.items[j].id == _getPaymentsOtd![i].id) {
                if (_getStudentOtd!.items[j].delivered == false) {
                  setState(() {
                    _listPayments.add(listPayment(
                        y: j + 1,
                        id: _getPaymentsOtd![i].id,
                        name: _getPaymentsOtd![i].name,
                        checked: _getStudentOtd!.items[j].delivered,
                        quantiy: _getPaymentsOtd![i].quantity,
                        type: _getPaymentsOtd![i].type,
                        price: _getPaymentsOtd![i].price,
                        note: _getPaymentsOtd![i].note));
                  });
                }
              }
            }
          }
        }

        print(_listPayments.length);
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPaymentsOtd == []
          ? CircularProgressIndicator()
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // // height: double.infinity,
                    // // width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 1300,
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
                                widget.checkRole == "price_page"
                                    ? Text(
                                        "Danh sách học phí",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 3,
                                        ),
                                      )
                                    : Text(
                                        "Danh sách đồng phục",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 3,
                                        ),
                                      ),
                                Container(
                                  child: Row(
                                    children: [
                                      widget.checkRole == "price_page"
                                          ? InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Print_Payments_page(
                                                      listPayments:
                                                          _listPayments,
                                                      studentOtd:
                                                          widget.studentOtd,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Icon(
                                                Icons.print,
                                                color: Colors.white,
                                              ),
                                            )
                                          : SizedBox(),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (widget.checkRole ==
                                              "price_page") {
                                            for (int i = 0;
                                                i < _listPayments.length;
                                                i++) {
                                              if (_listPayments[i].checked ==
                                                  true) {
                                                items.add(Item1(
                                                    id: _listPayments[i].id,
                                                    checked: true));
                                                print(
                                                    "-----${_getStudentOtd!.id}------${_listPayments[i].id}--------$type");
                                              }
                                              ;
                                              if (i + 1 ==
                                                  _listPayments.length) {
                                                _putStudentController!
                                                    .putPaymentStudentController(
                                                        _getStudentOtd!.id,
                                                        PutPaymentStudentOtd(
                                                            items: items,
                                                            type: type,
                                                            note: "note"))
                                                    .then((value) {
                                                  // Navigator.pop(context);
                                                });
                                                final snackBar = SnackBar(
                                                  content: const Text(
                                                      'Xác nhận thành công'),
                                                  action: SnackBarAction(
                                                    label: 'Undo',
                                                    onPressed: () {
                                                      // Some code to undo the change.
                                                    },
                                                  ),
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              }
                                            }
                                          } else {
                                            for (int i = 0;
                                                i < _listPayments.length;
                                                i++) {
                                              if (_listPayments[i].checked ==
                                                  true) {
                                                print(
                                                    "-----${_getStudentOtd!.id}------${_listPayments[i].id}--------$type");
                                                _postDeliveryController!
                                                    .postPDeliveryController(
                                                        _getStudentOtd!.id,
                                                        _listPayments[i].id);
                                                Navigator.pop(context);
                                              }
                                            }
                                          }
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border:
                                                Border.all(color: Colors.white),
                                          ),
                                          child:
                                              widget.checkRole == "price_page"
                                                  ? Text(
                                                      "Xác nhận học phí",
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 61, 110)),
                                                    )
                                                  : Text(
                                                      "Xác nhận đồng phục",
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 0, 61, 110)),
                                                    ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Mã HSSV: ${widget.studentOtd!.maHocSinh}",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                              "CCCD: ${widget.studentOtd!.cccd}",
                                              style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Số điện thoại HSSV: ${widget.studentOtd!.sdtHocSinh}",
                                              style: TextStyle(fontSize: 18)),
                                          Text(
                                              "Tên HSSV: ${widget.studentOtd!.hoTen}",
                                              style: TextStyle(fontSize: 18)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    widget.checkRole == "price_page"
                                        ? Container(
                                            width: 150,
                                            child: DropdownButton(
                                              isExpanded: true,
                                              items: [
                                                DropdownMenuItem(
                                                  child: Text("Chuyển khoản"),
                                                  value: "CHUYEN_KHOAN",
                                                ),
                                                DropdownMenuItem(
                                                  child: Text("Đóng trực tiếp"),
                                                  value: "TRUC_TIEP",
                                                )
                                              ],
                                              onChanged: (value) {
                                                setState(() {
                                                  type = value as String;
                                                });
                                                print("aaaaa  +$value");
                                              },
                                              value: type,
                                              hint: Text("Chọn kiểu"),
                                              alignment: Alignment.center,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          )
                                        : Text('')
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                _listPayments.length == []
                                    ? CircularProgressIndicator()
                                    : DataTable(
                                        columns: [
                                            DataColumn(
                                                label: Expanded(
                                              child: Text("Học phí"),
                                            )),
                                            DataColumn(
                                                label: Expanded(
                                              child: Text("Số tiền"),
                                            )),
                                            DataColumn(
                                                label: Row(
                                              children: [
                                                Text("Chọn tất cả"),
                                                Checkbox(
                                                  value: check,
                                                  onChanged: (value) {
                                                    check = value!;
                                                    _listPayments
                                                        .forEach((element) {
                                                      setState(() {
                                                        element.checked = check;
                                                      });
                                                    });
                                                  },
                                                ),
                                              ],
                                            ))
                                          ],
                                        rows: _listPayments
                                            .map((e) =>
                                                DataRow(cells: <DataCell>[
                                                  DataCell(Text(
                                                    e.name,
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  )),
                                                  DataCell(Text(
                                                    e.price.toString(),
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  )),
                                                  DataCell(Checkbox(
                                                    checkColor: Colors.white,
                                                    //fillColor: MaterialStateProperty.resolveWith(getColor),
                                                    value: e.checked,
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        e.checked = value!;
                                                      });
                                                      print(
                                                          "-----------${e.name}----------------${e.checked}");
                                                    },
                                                  )),
                                                ]))
                                            .toList())
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class listPayment {
  int y;
  String id;
  String name;
  bool checked;
  String quantiy;
  String type;
  int price;
  String note;
  listPayment(
      {required this.y,
      required this.id,
      required this.name,
      required this.checked,
      required this.quantiy,
      required this.type,
      required this.price,
      required this.note});
}
