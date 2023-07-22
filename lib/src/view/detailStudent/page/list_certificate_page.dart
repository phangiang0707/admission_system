import 'package:flutter/material.dart';

import '../../../controller/getListCertificate.controller.dart';
import '../../../model/getCertificate.model.dart';
import '../../../model/getDetailStudent.model.dart';

class List_Certificate_page extends StatefulWidget {
  const List_Certificate_page({super.key, required this.studentOtd});
  final GetDetailStudentOtd? studentOtd;
  @override
  State<List_Certificate_page> createState() => _List_Certificate_pageState();
}

class _List_Certificate_pageState extends State<List_Certificate_page> {
  CertificateController? _certificateController;
  List<GetCertificateOtd>? _listOfCertificates;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _certificateController = CertificateController();
    _certificateController!.getCertificate().then((value) {
      setState(() {
        setState(() {
          _listOfCertificates = value;
        });
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
            Center(
              child: Container(
                width: 700,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Danh sách chứng nhận",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 61, 110),
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 3,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                          "Xách nhận chứng nhận",
                          style: TextStyle(color: Colors.white),
                        ),
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
                    DataTable(columns: [
                      DataColumn(
                          label: Expanded(
                        child: Text("Tên chứng chỉ"),
                      )),
                      DataColumn(
                          label: Expanded(
                        child: Text("Tình trạng"),
                      ))
                    ], rows: [
                      DataRow(cells: [
                        DataCell(Text("Nội dung chứng chỉ")),
                        DataCell(Checkbox(
                          checkColor: Colors.white,
                          //fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: true,
                          onChanged: (bool? value) {
                            // setState(() {
                            //   e.delivered = value!;
                            // });
                          },
                        )),
                      ])
                    ])
                    // _listOfCertificates == []
                    //     ? CircularProgressIndicator()
                    //     : DataTable(
                    //         columns: [
                    //             DataColumn(
                    //                 label: Expanded(
                    //               child: Text("Học phí"),
                    //             )),
                    //             DataColumn(
                    //                 label: Expanded(
                    //               child: Text(""),
                    //             ))
                    //           ],
                    //         rows: _listOfCertificates!
                    //             .map((e) => DataRow(cells: <DataCell>[
                    //                   DataCell(Text(
                    //                     e.noiDung,
                    //                     style: TextStyle(fontSize: 24),
                    //                   )),
                    //                   DataCell(Checkbox(
                    //                     checkColor: Colors.white,
                    //                     //fillColor: MaterialStateProperty.resolveWith(getColor),
                    //                     value: e.delivered,
                    //                     onChanged: (bool? value) {
                    //                       setState(() {
                    //                         e.delivered = value!;
                    //                       });
                    //                     },
                    //                   )),
                    //                 ]))
                    //             .toList())
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
