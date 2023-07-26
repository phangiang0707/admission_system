import 'package:flutter/material.dart';

import '../../../controller/getListCertificate.controller.dart';
import '../../../controller/postCertificate.controller.dart';
import '../../../controller/postConfirm.controller.dart';
import '../../../model/getCertificate.model.dart';
import '../../../model/getDetailStudent.model.dart';
import '../../../model/postCertificate.model.dart';

class List_Certificate_page extends StatefulWidget {
  const List_Certificate_page({super.key, required this.studentOtd});
  final GetDetailStudentOtd? studentOtd;
  @override
  State<List_Certificate_page> createState() => _List_Certificate_pageState();
}

class _List_Certificate_pageState extends State<List_Certificate_page> {
  CertificateController? _certificateController;
  List<GetCertificateOtd> _listOfCertificates = [];
  List<GetCertificateOtd> listOfCertificates = [];
  PostCertificateController? _postCertificateController;
  PostConfirmController? _postConfirmController;
  List<ChungChi> _listOfChungChi = [];
  List<detailCertificate> _listOfDetailCertificates = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postConfirmController = PostConfirmController(context: context);
    _postCertificateController = PostCertificateController(context: context);
    _certificateController = CertificateController(context: context);
    _certificateController!.getCertificate().then((value) {
      setState(() {
        listOfCertificates = value;
        listOfCertificates.forEach((element) {
          element.trinhDo.forEach((trinhdo) {
            print(
                "--------------------------------------${trinhdo.name}------------------------------------");
            print(
                "--------------------------------------${widget.studentOtd!.trinhDo}");
            if (trinhdo.name == widget.studentOtd!.trinhDo) {
              _listOfCertificates.add(element);
            }
          });
        });
      });
      _listOfCertificates.forEach((element) {
        widget.studentOtd!.chungChi.forEach((element1) {
          if (element1.id == element.id) {
            setState(() {
              element.checked = element1.checked;
            });
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: double.infinity,
              // width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
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
                          Text(
                            "Danh sách chứng nhận",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 3,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              for (int i = 0;
                                  i < _listOfCertificates.length;
                                  i++) {
                                if (_listOfCertificates[i].checked == true) {
                                  _listOfChungChi.add(ChungChi(
                                      id: _listOfCertificates[i].id,
                                      checked: _listOfCertificates[i].checked));
                                }
                                if (i + 1 == _listOfCertificates.length) {
                                  _postCertificateController!
                                      .postCertificateController(
                                          PostCertificateOtd(
                                              studentId: widget.studentOtd!.id,
                                              chungChi: _listOfChungChi));
                                }
                              }

                              // _postConfirmController!
                              //     .postConfirmController(widget.studentOtd!.id);
                              print(widget.studentOtd!.id);
                              widget.studentOtd!.daNhapHoc == true
                                  ? Navigator.of(context).pop()
                                  : showDialog<void>(
                                      context: context,
                                      barrierDismissible:
                                          false, // user must tap button!
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title:
                                              const Text('Xác nhận nhập học'),
                                          actions: <Widget>[
                                            InkWell(
                                              onTap: () {
                                                print(widget.studentOtd!.id);
                                                _postConfirmController!
                                                    .postConfirmController(
                                                        widget.studentOtd!.id);
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        23, 161, 250, 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 5),
                                                child: Text(
                                                  'Xác nhận',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  Text(
                                    "Xác nhận chứng nhận",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
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
                          _listOfCertificates == []
                              ? CircularProgressIndicator()
                              : DataTable(
                                  columns: [
                                      DataColumn(
                                          label: Expanded(
                                        child: Text("Tên chứng chỉ"),
                                      )),
                                      DataColumn(
                                          label: Expanded(
                                        child: Text("Tình trạng"),
                                      ))
                                    ],
                                  rows: _listOfCertificates
                                      .map((e) => DataRow(cells: <DataCell>[
                                            DataCell(Text(
                                              e.noiDung,
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
          ],
        ),
      ),
    );
  }
}

class detailCertificate {
  String name;
  String id;
  bool checked;
  detailCertificate(
      {required this.name, required this.id, required this.checked});
}
