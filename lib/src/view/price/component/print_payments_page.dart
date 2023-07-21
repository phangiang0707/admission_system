import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../model/getDetailStudent.model.dart';
import '../../../model/getListPayments.model.dart';

class Print_Payments_page extends StatefulWidget {
  const Print_Payments_page(
      {super.key, required this.getPaymentsOtd, required this.studentOtd});
  final List<GetPaymentsOtd> getPaymentsOtd;
  final GetDetailStudentOtd? studentOtd;
  @override
  State<Print_Payments_page> createState() => _Print_Payments_pageState();
}

class _Print_Payments_pageState extends State<Print_Payments_page> {
  List<GetPaymentsOtd> _listViewsPauments = [];
  int total = 0;
  String gender = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (var i in widget.getPaymentsOtd) {
      if (i.delivered == true) {
        _listViewsPauments.add(i);
        total += i.price;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (format) => _generatePdf(format),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();
    final fontTitle = await PdfGoogleFonts.cabinItalic();
    final fontH1 = await PdfGoogleFonts.cabinBold();
    final fontDate = await PdfGoogleFonts.nunitoItalic();
    DateTime date = DateTime.now();
    // bool isCondition = true;
    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Container(
                  width: double.infinity,
                  child: pw.Column(children: [
                    pw.Text("HÓA ĐƠN",
                        style: pw.TextStyle(font: fontH1, fontSize: 24),
                        textAlign: pw.TextAlign.center),
                    pw.SizedBox(
                      height: 10,
                    ),
                    pw.Text(
                      "Ngày ${date.day} tháng ${date.month} năm ${date.year}",
                      textAlign: pw.TextAlign.center,
                      style: pw.TextStyle(font: fontDate, fontSize: 12),
                    ),
                  ])),
              pw.SizedBox(
                height: 20,
              ),
              pw.Container(
                child: pw.Row(children: [
                  pw.Text("Tên HSSV: ${widget.studentOtd!.hoTen}",
                      style: pw.TextStyle(
                          font: fontTitle,
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold)),
                ]),
              ),
              pw.SizedBox(height: 10),
              pw.Text("Mã HSSV: ${widget.studentOtd!.maHocSinh}",
                  style: pw.TextStyle(
                      font: fontTitle,
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Text(
                  "Ngày sinh: ${widget.studentOtd!.ngaySinh.day}/${widget.studentOtd!.ngaySinh.month}/${widget.studentOtd!.ngaySinh.year}",
                  style: pw.TextStyle(
                      font: fontTitle,
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold)),
              // pw.Container(
              //     child: pw.Row(
              //   children: [
              //     pw.Container(
              //         child: pw.Column(children: [
              //       pw.Text("Tên HSSV: ${widget.studentOtd!.hoTen}",
              //           style: pw.TextStyle(
              //               font: fontTitle,
              //               fontSize: 16,
              //               fontWeight: pw.FontWeight.bold)),
              //       pw.SizedBox(height: 10),
              //       pw.Text("Mã HSSV: ${widget.studentOtd!.maHocSinh}",
              //           style: pw.TextStyle(
              //               font: fontTitle,
              //               fontSize: 16,
              //               fontWeight: pw.FontWeight.bold)),
              //     ])),
              //     pw.Container(
              //         child: pw.Column(children: [
              //       pw.Text("Giới tính: $gender}",
              //           style: pw.TextStyle(
              //               font: fontTitle,
              //               fontSize: 16,
              //               fontWeight: pw.FontWeight.bold)),
              //       pw.SizedBox(height: 10),
              //       pw.Text(
              //           "Ngày sinh: ${widget.studentOtd!.ngaySinh.day}/${widget.studentOtd!.ngaySinh.month}/${widget.studentOtd!.ngaySinh.year}",
              //           style: pw.TextStyle(
              //               font: fontTitle,
              //               fontSize: 16,
              //               fontWeight: pw.FontWeight.bold)),
              //     ]))
              //   ],
              // )),
              pw.SizedBox(height: 20),
              pw.Container(
                  child: pw.Column(
                      children: _listViewsPauments
                          .map((e) => pw.Container(
                              padding: pw.EdgeInsets.only(bottom: 20),
                              child: pw.Row(
                                mainAxisAlignment:
                                    pw.MainAxisAlignment.spaceBetween,
                                children: [
                                  pw.Text(e.name,
                                      style: pw.TextStyle(font: font)),
                                  pw.Text(e.price.toString()),
                                ],
                              )))
                          .toList())),
              pw.Container(
                  color: PdfColors.black, height: 1, width: double.infinity),
              pw.SizedBox(height: 20),
              pw.Container(
                  child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                    pw.Text("Thành tiền:", style: pw.TextStyle(font: font)),
                    pw.Text(total.toString(), style: pw.TextStyle(font: font))
                  ]))
            ],
          );
        },
      ),
    );
    return pdf.save();
  }
}
