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
            Container(
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
