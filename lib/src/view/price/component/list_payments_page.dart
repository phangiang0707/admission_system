import 'package:flutter/material.dart';

import '../../../controller/getListPayments.controller.dart';
import '../../../controller/getPaymentStudent.controller.dart';
import '../../../model/getDetailStudent.model.dart';
import '../../../model/getListPayments.model.dart';
import '../../../model/getPaymentStudent.model.dart';
import 'print_payments_page.dart';

class List_Payments_page extends StatefulWidget {
  const List_Payments_page({super.key, required this.studentOtd});
  final GetDetailStudentOtd? studentOtd;
  @override
  State<List_Payments_page> createState() => _List_Payments_pageState();
}

class _List_Payments_pageState extends State<List_Payments_page> {
  List<GetPaymentsOtd>? _getPaymentsOtd;
  List<listPayment> _listPayments = [];
  PaymentsController? _paymentsController;
  GetPaymentStudentController? _getStudentController;
  GetPaymentStudentOtd? _getStudentOtd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _paymentsController = PaymentsController();
    _getStudentController = GetPaymentStudentController();
    _paymentsController!.getPayments(widget.studentOtd!.trinhDo).then((value) {
      setState(() {
        _getPaymentsOtd = value;
      });
      _getStudentController!.getStudent(widget.studentOtd!.id).then((value) {
        setState(() {
          _getStudentOtd = value;
        });
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
          : Container(
              // // height: double.infinity,
              // // width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 700,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Danh sách học phí",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 61, 110),
                              fontSize: 20,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 3,
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Print_Payments_page(
                                          listPayments: _listPayments,
                                          studentOtd: widget.studentOtd,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.print,
                                    color: Color.fromRGBO(23, 161, 250, 1),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(23, 161, 250, 1),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.white),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  23, 161, 250, 1),
                                              blurRadius: 1,
                                              spreadRadius: 2)
                                        ]),
                                    child: Text(
                                      "Xách nhận học phí",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Mã HSSV: ${widget.studentOtd!.maHocSinh}",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text("CCCD: ${widget.studentOtd!.cccd}",
                                        style: TextStyle(fontSize: 18)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        child: Text(""),
                                      ))
                                    ],
                                  rows: _listPayments
                                      .map((e) => DataRow(cells: <DataCell>[
                                            DataCell(Text(
                                              e.name,
                                              style: TextStyle(fontSize: 24),
                                            )),
                                            DataCell(Checkbox(
                                              checkColor: Colors.white,
                                              //fillColor: MaterialStateProperty.resolveWith(getColor),
                                              value: e.checked,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  e.checked = value!;
                                                });
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
