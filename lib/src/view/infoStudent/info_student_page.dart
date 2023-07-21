import 'package:flutter/material.dart';
import '../../controller/getListStudent.controller.dart';
import '../../model/getListStudent.model.dart';
import 'components/list_student_page.dart';

class Info_Student_page extends StatefulWidget {
  const Info_Student_page({super.key});

  @override
  State<Info_Student_page> createState() => _Info_Student_pageState();
}

class _Info_Student_pageState extends State<Info_Student_page> {
  final TextEditingController _txtFind = TextEditingController();
  List<GetStudentOtd>? listStudentOTD;
  StudentController? getStudent;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStudent = StudentController();

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
                  child: List_Student_page(
                listStudentOTD: listStudentOTD,
              ))
              // ResponsiveWidget.isSmallScreen(context)
              //     ? Column(
              //         children: [
              //           Container(
              //             height: 200,
              //             width: double.infinity,
              //             child: SingleChildScrollView(
              //               child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [List_Student_page(), Text("Giang")]),
              //             ),
              //           ),
              //           SizedBox(
              //             height: 30,
              //           ),
              //           Container(
              //             child: Detail_Student_page(),
              //           )
              //         ],
              //       )
              //     : Row(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Container(
              //             child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [List_Student_page(), Text("Giang")]),
              //           ),
              //           SizedBox(
              //             width: 30,
              //           ),
              //           Expanded(
              //             child: Detail_Student_page(),
              //           )
              //         ],
              //       )
            ],
          ),
        ),
      ),
    );
  }
}
