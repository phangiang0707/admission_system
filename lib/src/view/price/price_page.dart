import 'package:flutter/material.dart';
import '../../controller/getDetailStudent.controller.dart';
import '../../controller/getListStudent.controller.dart';
import '../../model/getDetailStudent.model.dart';
import '../../model/getListStudent.model.dart';
import 'component/list_payments_page.dart';

class Price_page extends StatefulWidget {
  const Price_page({super.key});

  @override
  State<Price_page> createState() => _Price_pageState();
}

class _Price_pageState extends State<Price_page> {
  final TextEditingController _txtFind = TextEditingController();
  List<GetStudentOtd>? listStudentOTD;
  StudentController? getStudent;
  DetailStudentController? _detailStudentController;
  GetDetailStudentOtd? _studentOtd;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStudent = StudentController();
    _detailStudentController = DetailStudentController();
    getStudent!.getStudent().then((value) {
      setState(() {
        listStudentOTD = value;
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
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: listStudentOTD == null
                    ? SizedBox()
                    : DataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Mã học sinh',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
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
                        ],
                        rows: listStudentOTD!
                            .map(
                              (e) => DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(e.maHocSinh)),
                                  DataCell(Text(e.hoTen)),
                                  DataCell(Text(e.cccd)),
                                  DataCell(Text(e.sdtHocSinh)),
                                ],
                                onLongPress: () {
                                  _detailStudentController!
                                      .getStudent(e.id)
                                      .then((value) {
                                    setState(() {
                                      _studentOtd = value;
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                List_Payments_page(
                                                  studentOtd: _studentOtd,
                                                )));
                                  });
                                },
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
}
