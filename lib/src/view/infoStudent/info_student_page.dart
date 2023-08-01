import 'package:flutter/material.dart';
import '../../controller/getListStudent.controller.dart';
import '../../model/getListStudent.model.dart';
import '../detailStudent/detail_student_page.dart';
import 'components/add_student_page.dart';

class Info_Student_page extends StatefulWidget {
  const Info_Student_page({super.key});

  @override
  State<Info_Student_page> createState() => _Info_Student_pageState();
}

class _Info_Student_pageState extends State<Info_Student_page> {
  final TextEditingController _txtFind = TextEditingController();
  List<GetStudentOtd>? listStudentOTD;
  List<GetStudentOtd>? _listStudentOTD;
  StudentController? getStudent;
  String trinhDo = 'Lọc';
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
                            width: 20,
                          ),
                          Container(
                            width: 150,
                            child: DropdownButton(
                              isExpanded: true,
                              hint: Text(trinhDo),
                              items: [
                                DropdownMenuItem(
                                  child: Text("Tất cả"),
                                  value: "TAT_CA",
                                ),
                                DropdownMenuItem(
                                  child: Text("Trung cấp"),
                                  value: "TRUNG_CAP",
                                ),
                                DropdownMenuItem(
                                  child: Text("Cao đẳng"),
                                  value: "CAO_DANG",
                                )
                              ],
                              onChanged: (value) {
                                trinhDo = value as String;
                                if (value == "TAT_CA") {
                                  getStudent!.getStudent().then((value) {
                                    setState(() {
                                      listStudentOTD = value;
                                      _listStudentOTD = listStudentOTD;
                                    });
                                  });
                                } else {
                                  getStudent!
                                      .getStudentSort(value as String)
                                      .then((value) {
                                    setState(() {
                                      listStudentOTD = value;
                                      _listStudentOTD = listStudentOTD;
                                    });
                                  });
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: 20,
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
                                    var postitle = element.hoTen.toLowerCase();
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
                                labelText: "Tìm kiếm bằng tên học sinh",
                                border: InputBorder.none,
                                //border: const OutlineInputBorder(),
                                hintText: "Tìm kiếm bằng tên học sinh",
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
                    _listStudentOTD == null
                        ? CircularProgressIndicator()
                        : Column(
                            children: [
                              SingleChildScrollView(
                                child: Center(
                                  child: DataTable(
                                    columns: const <DataColumn>[
                                      DataColumn(
                                        label: Expanded(
                                          child: Text(
                                            'Mã học sinh',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Text(
                                            'Họ và Tên',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Text(
                                            'CCCD',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Text(
                                            'Số điện thoại',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Text(
                                            'Giấy CNTN Trường',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Text(
                                            'Ngày đăng ký',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Expanded(
                                          child: Text(
                                            '',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                      ),
                                    ],
                                    rows: _listStudentOTD!
                                        .map(
                                          (e) => DataRow(
                                            cells: <DataCell>[
                                              DataCell(Text(
                                                e.maHocSinh,
                                                style: TextStyle(fontSize: 18),
                                              )),
                                              DataCell(Text(
                                                e.hoTen,
                                                style: TextStyle(fontSize: 18),
                                              )),
                                              DataCell(Text(
                                                e.cccd,
                                                style: TextStyle(fontSize: 18),
                                              )),
                                              DataCell(Text(
                                                e.sdtHocSinh,
                                                style: TextStyle(fontSize: 18),
                                              )),
                                              DataCell(Text(
                                                e.giayCntnTruong,
                                                style: TextStyle(fontSize: 18),
                                              )),
                                              DataCell(Text(
                                                "${e.createdAt.day}/${e.createdAt.month}/${e.createdAt.year}",
                                                style: TextStyle(fontSize: 18),
                                              )),
                                              DataCell(IconButton(
                                                  onPressed: () async {
                                                    String refresh =
                                                        await Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        Detail_Student_page(
                                                                          id: e
                                                                              .id,
                                                                        )));
                                                    if (refresh == 'refresh') {
                                                      _refreshIndicatorKey
                                                          .currentState
                                                          ?.show();
                                                    }
                                                  },
                                                  icon: Icon(
                                                    Icons.skip_next,
                                                    color: Color.fromRGBO(
                                                        23, 161, 250, 1),
                                                  ))),
                                            ],
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              )
                            ],
                          )
                    // Center(
                    //     child: List_Student_page(
                    //   listStudentOTD: _listStudentOTD,
                    // ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
