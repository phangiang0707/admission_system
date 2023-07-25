import 'package:flutter/material.dart';

import '../../../model/getListStudent.model.dart';
import '../../detailStudent/detail_student_page.dart';

// class List_Student_page extends StatefulWidget {
//   const List_Student_page({super.key});

//   @override
//   State<List_Student_page> createState() => _List_Student_pageState();
// }

// class _List_Student_pageState extends State<List_Student_page> {
//   List<User> userList = [
//     User(int: "1", name: "Phan Trung Giang"),
//     User(int: "2", name: "Phan Thị Hường"),
//     User(int: "3", name: "Nguyễn Minh Sơn"),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           child: Row(
//             children: [
//               Text(
//                 "STT",
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Text(
//                 "Họ và tên",
//                 style: TextStyle(fontSize: 16),
//               )
//             ],
//           ),
//         ),
//         Container(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: userList
//                 .map(
//                   (e) => InkWell(
//                     onTap: () {},
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical: 10),
//                       child: Row(
//                         children: [
//                           Text(
//                             e.int,
//                             style: TextStyle(fontSize: 16),
//                           ),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           Text(
//                             e.name,
//                             style: TextStyle(fontSize: 16),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//                 .toList(),
//           ),
//         )
//       ],
//     );
//   }
// }

class List_Student_page extends StatefulWidget {
  const List_Student_page({super.key, required this.listStudentOTD});
  final List<GetStudentOtd>? listStudentOTD;
  @override
  State<List_Student_page> createState() => _List_Student_pageState();
}

class _List_Student_pageState extends State<List_Student_page> {
  @override
  Widget build(BuildContext context) {
    return widget.listStudentOTD == null
        ? CircularProgressIndicator()
        : SingleChildScrollView(
            child: DataTable(
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
                DataColumn(
                  label: Expanded(
                    child: Text(
                      '',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
              rows: widget.listStudentOTD!
                  .map(
                    (e) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(e.maHocSinh)),
                        DataCell(Text(e.hoTen)),
                        DataCell(Text(e.cccd)),
                        DataCell(Text(e.sdtHocSinh)),
                        DataCell(IconButton(
                            onPressed: () {
                              // showDialog(
                              //     context: context,
                              //     builder: (BuildContext co) {
                              //       return Detail_Student_page(id: e.id);
                              //     });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Detail_Student_page(
                                            id: e.id,
                                          )));
                            },
                            icon: Icon(
                              Icons.skip_next,
                              color: Color.fromRGBO(23, 161, 250, 1),
                            ))),
                      ],
                    ),
                  )
                  .toList(),
            ),
          );
  }
}
