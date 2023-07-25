import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../controller/writeMoney.controller.dart';
import '../../../model/getDetailStudent.model.dart';
import 'list_payments_page.dart';

class Print_Payments_page extends StatefulWidget {
  const Print_Payments_page(
      {super.key, required this.listPayments, required this.studentOtd});
  final List<listPayment> listPayments;
  final GetDetailStudentOtd? studentOtd;
  @override
  State<Print_Payments_page> createState() => _Print_Payments_pageState();
}

class _Print_Payments_pageState extends State<Print_Payments_page> {
  List<listPayment> _listViewsPauments = [];
  int total = 0;
  String gender = "";
  String title = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.studentOtd!.trinhDo == "TRUNG_CAP") {
      setState(() {
        title = "TRUNG CẤP";
      });
    } else {
      setState(() {
        title = "CAO ĐẲNG";
      });
    }
    for (var i in widget.listPayments) {
      if (i.checked == true) {
        _listViewsPauments.add(i);
        total += i.price;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.chevron_left_outlined,
              color: Color.fromARGB(255, 0, 61, 110),
            )),
      ),
      body: PdfPreview(
        build: (format) => _generatePdf(format),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    var myTheme = pw.ThemeData.withFont(
      base:
          pw.Font.ttf(await rootBundle.load("fonts/SVN-Times-New-Roman-2.ttf")),
      // bold: pw.Font.ttf(await rootBundle.load("assets/OpenSans-Bold.ttf")),
      // italic: pw.Font.ttf(await rootBundle.load("assets/OpenSans-Italic.ttf")),
      // boldItalic:
      //     pw.Font.ttf(await rootBundle.load("assets/OpenSans-BoldItalic.ttf")),
    );
    final pdf = pw.Document(
        version: PdfVersion.pdf_1_5, compress: true, theme: myTheme);
    final fontTimesNewRoman = await pw.Font.ttf(
        await rootBundle.load("fonts/SVN-Times-New-Roman-2.ttf"));
    final fontTimesNewRomanBold = await pw.Font.ttf(
        await rootBundle.load("fonts/SVN-TimesNewRoman2-bold.ttf"));
    final fontTimesNewRomanItalic = await pw.Font.ttf(
        await rootBundle.load("fonts/SVN-TimesNewRoman2italic.ttf"));
    DateTime date = DateTime.now();
    // bool isCondition = true;
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Container(
                child: pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Container(
                          child: pw.Column(children: [
                        pw.Text("BỘ NÔNG NGHIỆP VÀ PTNT",
                            style: pw.TextStyle(
                                font: fontTimesNewRoman, fontSize: 12)),
                        pw.Text("TRƯỜNG CĐ CƠ GIỚI VÀ THỦY LỢI",
                            style: pw.TextStyle(
                                font: fontTimesNewRomanBold, fontSize: 12)),
                        pw.Container(
                            height: 1, width: 100, color: PdfColors.black),
                        pw.SizedBox(height: 7),
                        pw.Text("Số:        /PTHP-CG&TL",
                            style: pw.TextStyle(
                                font: fontTimesNewRomanItalic, fontSize: 12))
                      ])),
                      pw.Expanded(
                          child: pw.Column(children: [
                        pw.Text("CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM",
                            style: pw.TextStyle(
                                font: fontTimesNewRomanBold, fontSize: 12)),
                        pw.Text("Độc lập – Tự do – Hạnh phúc",
                            style: pw.TextStyle(
                                font: fontTimesNewRomanBold, fontSize: 12)),
                        pw.Container(
                            height: 1, width: 100, color: PdfColors.black),
                      ]))
                    ]),
              ),
              pw.SizedBox(height: 20),
              pw.Text("PHIẾU THU",
                  style:
                      pw.TextStyle(font: fontTimesNewRomanBold, fontSize: 20)),
              pw.Container(
                  child: pw.Row(children: [
                pw.Expanded(
                    flex: 2,
                    child: pw.Text(
                        "Họ và tên HSSV: ${widget.studentOtd!.hoTen}",
                        style: pw.TextStyle(
                            font: fontTimesNewRoman, fontSize: 11))),
                pw.Expanded(
                    flex: 1,
                    child: pw.Text(
                        "Ngày sinh: ${widget.studentOtd!.ngaySinh.day}/${widget.studentOtd!.ngaySinh.month}/${widget.studentOtd!.ngaySinh.year}",
                        style: pw.TextStyle(
                            font: fontTimesNewRoman, fontSize: 11)))
              ])),
              pw.SizedBox(
                height: 5,
              ),
              pw.Align(
                alignment: pw.Alignment.centerLeft,
                child: pw.Text(
                    "Hộ khẩu thường trú: ${widget.studentOtd!.diaChiThuongTru}",
                    style: pw.TextStyle(font: fontTimesNewRoman, fontSize: 11)),
              ),
              pw.SizedBox(
                height: 5,
              ),
              pw.Container(
                  child: pw.Row(children: [
                pw.Expanded(
                    flex: 2,
                    child: pw.Text(
                        "Nghề đăng ký: ${widget.studentOtd!.ngheDangKy}",
                        style: pw.TextStyle(
                            font: fontTimesNewRoman, fontSize: 11))),
                pw.Expanded(
                    flex: 1,
                    child: pw.Text("Trình độ: $title",
                        style: pw.TextStyle(
                            font: fontTimesNewRoman, fontSize: 11)))
              ])),
              pw.SizedBox(height: 20),
              pw.Text("THÔNG TIN HỌC PHÍ, LỆ PHÍ $title",
                  style: pw.TextStyle(font: fontTimesNewRoman, fontSize: 14)),
              pw.SizedBox(height: 7),
              pw.Table(
                //defaultColumnWidth: pw.FixedColumnWidth(120.0),
                border: pw.TableBorder.all(
                    color: PdfColors.black,
                    style: pw.BorderStyle.solid,
                    width: 0.5),
                children: [
                  pw.TableRow(
                      decoration:
                          pw.BoxDecoration(color: PdfColor.fromHex('#95B3D7')),
                      children: [
                        pw.Column(children: [
                          pw.Text('STT',
                              style: pw.TextStyle(
                                  font: fontTimesNewRoman, fontSize: 14))
                        ]),
                        pw.Column(children: [
                          pw.Text('Các khoản thu',
                              style: pw.TextStyle(
                                  font: fontTimesNewRoman, fontSize: 14))
                        ]),
                        pw.Column(children: [
                          pw.Text('Số tiền',
                              style: pw.TextStyle(
                                  font: fontTimesNewRoman, fontSize: 14))
                        ]),
                        pw.Column(children: [
                          pw.Text('ĐVT',
                              style: pw.TextStyle(
                                  font: fontTimesNewRoman, fontSize: 14))
                        ]),
                        pw.Column(children: [
                          pw.Text('Ghi chú',
                              style: pw.TextStyle(
                                  font: fontTimesNewRoman, fontSize: 14))
                        ]),
                      ]),
                  ..._listViewsPauments
                      .map((e) => pw.TableRow(children: [
                            pw.Column(children: [
                              pw.Text(e.y.toString(),
                                  style: pw.TextStyle(
                                      font: fontTimesNewRoman, fontSize: 14))
                            ]),
                            pw.Column(children: [
                              pw.Text(e.name,
                                  style: pw.TextStyle(
                                      font: fontTimesNewRoman, fontSize: 14))
                            ]),
                            pw.Column(children: [
                              pw.Text(
                                  WriteMoney().writedMoney(e.price.toString()),
                                  style: pw.TextStyle(
                                      font: fontTimesNewRoman, fontSize: 14))
                            ]),
                            pw.Column(children: [
                              pw.Text(e.quantiy,
                                  style: pw.TextStyle(
                                      font: fontTimesNewRoman, fontSize: 14))
                            ]),
                            pw.Column(children: [
                              pw.Text(e.note,
                                  style: pw.TextStyle(
                                      font: fontTimesNewRoman, fontSize: 14))
                            ]),
                          ]))
                      .toList(),
                  pw.TableRow(children: [
                    pw.Column(children: [
                      pw.Text('',
                          style: pw.TextStyle(
                              font: fontTimesNewRoman, fontSize: 14))
                    ]),
                    pw.Column(children: [
                      pw.Text('Tổng cộng',
                          style: pw.TextStyle(
                              font: fontTimesNewRomanBold, fontSize: 14))
                    ]),
                    pw.Column(children: [
                      pw.Text(WriteMoney().writedMoney(total.toString()),
                          style: pw.TextStyle(
                              font: fontTimesNewRomanBold, fontSize: 14))
                    ]),
                    pw.Column(children: [
                      pw.Text('',
                          style: pw.TextStyle(
                              font: fontTimesNewRoman, fontSize: 14))
                    ]),
                    pw.Column(children: [
                      pw.Text('',
                          style: pw.TextStyle(
                              font: fontTimesNewRoman, fontSize: 14))
                    ]),
                  ]),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Expanded(
                child: pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Expanded(
                          child: pw.Column(children: [
                        pw.Text("Người lập phiếu",
                            style: pw.TextStyle(
                                font: fontTimesNewRoman, fontSize: 13)),
                        pw.Text("(Ký, ghi rõ họ tên) ",
                            style: pw.TextStyle(
                                font: fontTimesNewRoman, fontSize: 11)),
                      ])),
                      pw.Expanded(
                          child: pw.Column(children: [
                        pw.Text(
                            "Đồng Nai, ngày ${date.day} tháng ${date.month} năm ${date.year}",
                            style: pw.TextStyle(
                                font: fontTimesNewRomanItalic, fontSize: 11)),
                        pw.Text("Người nộp đơn",
                            style: pw.TextStyle(
                                font: fontTimesNewRoman, fontSize: 13)),
                        pw.Text("(Ký, ghi rõ họ tên) ",
                            style: pw.TextStyle(
                                font: fontTimesNewRoman, fontSize: 11)),
                      ]))
                    ]),
              ),
              pw.Text(
                  "Thông tin chi tiết vui lòng liên hệ: Trường Cao đẳng cơ giới và Thủy lợi",
                  style: pw.TextStyle(font: fontTimesNewRoman, fontSize: 13)),
              pw.Text(
                  "Địa chỉ : Km 44 –QL 1A – Hố Nai 3 – Trảng Bom – Đồng Nai",
                  style: pw.TextStyle(font: fontTimesNewRoman, fontSize: 13)),
              pw.Text(
                  "Cơ sở đào tạo: 453A, TL768 -  Thiện Tân – Vĩnh Cửu – Đồng Nai",
                  style: pw.TextStyle(font: fontTimesNewRoman, fontSize: 13)),
              pw.Text("Điện thoại : 02518.971.407 –  0968.241.116",
                  style: pw.TextStyle(font: fontTimesNewRoman, fontSize: 13)),
              pw.Text("Website : https://vcmi.edu.vn",
                  style: pw.TextStyle(font: fontTimesNewRoman, fontSize: 13))
              // pw.Container(
              //     width: double.infinity,
              //     child: pw.Column(children: [
              //       pw.Text("HÓA ĐƠN",
              //           style: pw.TextStyle(font: fontH1, fontSize: 24),
              //           textAlign: pw.TextAlign.center),
              //       pw.SizedBox(
              //         height: 10,
              //       ),
              //       pw.Text(
              //         "Ngày ${date.day} tháng ${date.month} năm ${date.year}",
              //         textAlign: pw.TextAlign.center,
              //         style: pw.TextStyle(font: fontDate, fontSize: 12),
              //       ),
              //     ])),
              // pw.SizedBox(
              //   height: 20,
              // ),
              // pw.Container(
              //   child: pw.Row(children: [
              //     pw.Text("Tên HSSV: ${widget.studentOtd!.hoTen}",
              //         style: pw.TextStyle(
              //             font: fontTitle,
              //             fontSize: 16,
              //             fontWeight: pw.FontWeight.bold)),
              //   ]),
              // ),
              // pw.SizedBox(height: 10),
              // pw.Text("Mã HSSV: ${widget.studentOtd!.maHocSinh}",
              //     style: pw.TextStyle(
              //         font: fontTitle,
              //         fontSize: 16,
              //         fontWeight: pw.FontWeight.bold)),
              // pw.SizedBox(height: 10),
              // pw.Text(
              //     "Ngày sinh: ${widget.studentOtd!.ngaySinh.day}/${widget.studentOtd!.ngaySinh.month}/${widget.studentOtd!.ngaySinh.year}",
              //     style: pw.TextStyle(
              //         font: fontTitle,
              //         fontSize: 16,
              //         fontWeight: pw.FontWeight.bold)),
              // pw.SizedBox(height: 20),
              // pw.Container(
              //     child: pw.Column(
              //         children: _listViewsPauments
              //             .map((e) => pw.Container(
              //                 padding: pw.EdgeInsets.only(bottom: 20),
              //                 child: pw.Row(
              //                   mainAxisAlignment:
              //                       pw.MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     pw.Text(e.name,
              //                         style: pw.TextStyle(font: font)),
              //                     pw.Text(e.price.toString()),
              //                   ],
              //                 )))
              //             .toList())),
              // pw.Container(
              //     color: PdfColors.black, height: 1, width: double.infinity),
              // pw.SizedBox(height: 20),
              // pw.Container(
              //     child: pw.Row(
              //         mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              //         children: [
              //       pw.Text("Thành tiền:", style: pw.TextStyle(font: font)),
              //       pw.Text(total.toString(), style: pw.TextStyle(font: font))
              //     ]))
            ],
          );
        },
      ),
    );
    return pdf.save();
  }
}
