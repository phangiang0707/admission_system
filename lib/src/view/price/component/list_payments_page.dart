import 'package:admission_system/src/model/putPaymentStudent.model.dart';
import 'package:flutter/material.dart';

import '../../../controller/getListPayments.controller.dart';
import '../../../controller/getPaymentStudent.controller.dart';
import '../../../controller/postDelivery.controller.dart';
import '../../../controller/putPaymentStudent.controller.dart';
import '../../../controller/writeMoney.controller.dart';
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
  int total = 0;
  String title = '';
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
                      delivered: _getStudentOtd!.items[j].checked,
                      checked: _getStudentOtd!.items[j].checked,
                      quantiy: _getPaymentsOtd![i].quantity,
                      type: _getPaymentsOtd![i].type,
                      price: _getPaymentsOtd![i].price,
                      note: _getPaymentsOtd![i].note));
                });
              }
            }
          }
          _listPayments.forEach((element) {
            if (element.checked == true) {
              setState(() {
                total += element.price;
              });
            }
          });
        } else {
          for (int j = 0; j < _getStudentOtd!.items.length; j++) {
            for (int i = 0; i < _getPaymentsOtd!.length; i++) {
              print(
                  "--------------------------------------------${_getStudentOtd!.items[j].id}");
              print(
                  "--------------------------------------------${_getPaymentsOtd![i].id}------------------------------------");
              if (_getStudentOtd!.items[j].id == _getPaymentsOtd![i].id) {
                if (_getStudentOtd!.items[j].delivered == false &&
                    _getStudentOtd!.items[j].checked == true) {
                  setState(() {
                    _listPayments.add(listPayment(
                        y: j + 1,
                        id: _getPaymentsOtd![i].id,
                        name: _getPaymentsOtd![i].name,
                        delivered: _getStudentOtd!.items[j].checked,
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
          if (_listPayments.length == 0) {
            title = "Học sinh đã nhận đồng phục";
          } else {
            title = "";
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
      body: _getPaymentsOtd == [] && _listPayments == []
          ? CircularProgressIndicator()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                                      widget.checkRole == "price_page"
                                          ? _getStudentOtd!.debt == 0
                                              ? Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Colors.white),
                                                  ),
                                                  child: Text(
                                                    "Học sinh đã đóng tất cả học phí",
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 0, 61, 110)),
                                                  ))
                                              : InkWell(
                                                  onTap: () {
                                                    for (int i = 0;
                                                        i <
                                                            _listPayments
                                                                .length;
                                                        i++) {
                                                      if (_listPayments[i]
                                                              .checked ==
                                                          true) {
                                                        items.add(Item1(
                                                            id: _listPayments[i]
                                                                .id,
                                                            checked: true));
                                                        print(
                                                            "-----${_getStudentOtd!.id}------${_listPayments[i].id}--------$type");
                                                      }
                                                      ;
                                                      if (i + 1 ==
                                                          _listPayments
                                                              .length) {
                                                        _putStudentController!
                                                            .putPaymentStudentController(
                                                                _getStudentOtd!
                                                                    .id,
                                                                PutPaymentStudentOtd(
                                                                    items:
                                                                        items,
                                                                    type: type,
                                                                    note:
                                                                        "note"))
                                                            .then((value) {});
                                                        _dialogBuilder(context);
                                                        final snackBar =
                                                            SnackBar(
                                                          content: const Text(
                                                              'Xác nhận thành công'),
                                                          action:
                                                              SnackBarAction(
                                                            label: 'Undo',
                                                            onPressed: () {
                                                              // Some code to undo the change.
                                                            },
                                                          ),
                                                        );
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                snackBar);
                                                      }
                                                    }
                                                  },
                                                  child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10,
                                                              vertical: 5),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      child: Text(
                                                        "Xác nhận học phí",
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    61,
                                                                    110)),
                                                      )),
                                                )
                                          : InkWell(
                                              onTap: () {
                                                for (int i = 0;
                                                    i < _listPayments.length;
                                                    i++) {
                                                  if (_listPayments[i]
                                                          .checked ==
                                                      true) {
                                                    print(
                                                        "-----${_getStudentOtd!.id}------${_listPayments[i].id}--------$type");
                                                    _postDeliveryController!
                                                        .postPDeliveryController(
                                                            _getStudentOtd!.id,
                                                            _listPayments[i]
                                                                .id);
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          title: const Text(
                                                              'Nhận đồng phục thành công bạn có muốn rời trang'),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                textStyle: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .labelLarge,
                                                              ),
                                                              child: const Text(
                                                                  'Đóng'),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                            TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                textStyle: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .labelLarge,
                                                              ),
                                                              child: const Text(
                                                                  'Rời trang'),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    final snackBar = SnackBar(
                                                      content: const Text(
                                                          'Bạn chưa chọn đồng phục'),
                                                    );
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(snackBar);
                                                  }
                                                }
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 5),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.white),
                                                ),
                                                child: Text(
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
                                              child: Text(
                                                "Học phí",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            )),
                                            DataColumn(
                                                label: Expanded(
                                              child: Text(
                                                "Số tiền",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            )),
                                            DataColumn(
                                                label: Expanded(
                                              child: Text(
                                                "Tình trạng",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            )),
                                            DataColumn(
                                                label: Row(
                                              children: [
                                                Text(
                                                  "Chọn tất cả",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Checkbox(
                                                  value: check,
                                                  onChanged: (value) {
                                                    check = value!;
                                                    setState(() {
                                                      total = 0;
                                                    });
                                                    _listPayments
                                                        .forEach((element) {
                                                      setState(() {
                                                        element.checked = check;
                                                        if (check == true) {
                                                          total +=
                                                              element.price;
                                                        } else {
                                                          total = 0;
                                                        }
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
                                                    WriteMoney().writedMoney(
                                                        e.price.toString()),
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  )),
                                                  DataCell(e.delivered == false
                                                      ? Text(
                                                          "Chưa đóng tiền",
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        )
                                                      : Text(
                                                          "Đã đóng tiền",
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        )),
                                                  DataCell(Checkbox(
                                                    checkColor: Colors.white,
                                                    //fillColor: MaterialStateProperty.resolveWith(getColor),
                                                    value: e.checked,
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        if (e.checked == true) {
                                                          total -= e.price;
                                                        } else {
                                                          total += e.price;
                                                        }
                                                        e.checked = value!;
                                                      });
                                                      print(
                                                          "-----------${e.name}----------------${e.checked}");
                                                    },
                                                  )),
                                                ]))
                                            .toList()),
                                Text(
                                  title,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.blue),
                                ),
                                widget.checkRole == "price_page"
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Học sinh đã thanh toán: ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          _getStudentOtd!.total == 0
                                              ? Text(
                                                  "0 VNĐ",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              : Text(
                                                  "${WriteMoney().writedMoney(_getStudentOtd!.total.toString())}",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            "Học sinh còn nợ: ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          _getStudentOtd!.debt == 0
                                              ? Text(
                                                  "0 VNĐ",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              : Text(
                                                  "${WriteMoney().writedMoney(_getStudentOtd!.debt.toString())} ",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            "Học sinh cần đóng thêm: ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          total - _getStudentOtd!.total == 0
                                              ? Text(
                                                  "0 VNĐ",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              : Text(
                                                  "${WriteMoney().writedMoney((total - _getStudentOtd!.total).toString())} ",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                        ],
                                      )
                                    : SizedBox(),
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

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
              'Xác nhận thành toán thành công bạn có muốn in hóa đơn'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Ở lại'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Về trang trước'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('In'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Print_Payments_page(
                      listPayments: _listPayments,
                      studentOtd: widget.studentOtd,
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class listPayment {
  int y;
  String id;
  String name;
  bool delivered;
  bool checked;
  String quantiy;
  String type;
  int price;
  String note;
  listPayment(
      {required this.y,
      required this.id,
      required this.name,
      required this.delivered,
      required this.checked,
      required this.quantiy,
      required this.type,
      required this.price,
      required this.note});
}
