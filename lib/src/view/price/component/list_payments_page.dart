import 'package:flutter/material.dart';

import '../../../controller/getListPayments.controller.dart';
import '../../../model/getDetailStudent.model.dart';
import '../../../model/getListPayments.model.dart';
import 'print_payments_page.dart';

class List_Payments_page extends StatefulWidget {
  const List_Payments_page({super.key, required this.studentOtd});
  final GetDetailStudentOtd? studentOtd;
  @override
  State<List_Payments_page> createState() => _List_Payments_pageState();
}

class _List_Payments_pageState extends State<List_Payments_page> {
  List<GetPaymentsOtd> _getPaymentsOtd = [];
  PaymentsController? _paymentsController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _paymentsController = PaymentsController();
    _paymentsController!.getPayments(widget.studentOtd!.trinhDo).then((value) {
      setState(() {
        _getPaymentsOtd = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: double.infinity,
        // width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                                builder: (context) => Print_Payments_page(
                                  getPaymentsOtd: _getPaymentsOtd,
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
                                      color: Color.fromRGBO(23, 161, 250, 1),
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
                        Text(
                          "Mã HSSV: ",
                        ),
                        Text(
                          widget.studentOtd!.maHocSinh,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Tên HSSV: ",
                        ),
                        Text(
                          widget.studentOtd!.hoTen,
                        ),
                      ],
                    ),
                    _getPaymentsOtd == []
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
                            rows: _getPaymentsOtd
                                .map((e) => DataRow(cells: <DataCell>[
                                      DataCell(Text(
                                        e.name,
                                        style: TextStyle(fontSize: 24),
                                      )),
                                      DataCell(Checkbox(
                                        checkColor: Colors.white,
                                        //fillColor: MaterialStateProperty.resolveWith(getColor),
                                        value: e.delivered,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            e.delivered = value!;
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
