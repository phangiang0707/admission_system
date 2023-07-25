import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../controller/getReportStudent.controller.dart';
import '../../model/getReportStudent.model.dart';

class Report_page extends StatefulWidget {
  const Report_page({super.key});

  @override
  State<Report_page> createState() => _Report_pageState();
}

class _Report_pageState extends State<Report_page> {
  GetReportStudentController? _getReportStudentController;
  GetReportStudentController1? _getReportStudentController1;
  List<GetReportStudentOtd> _listOfReportStudent = [];
  List<GetReportStudentOtd> data = [];
  String? text = 'ngày';
  GetReportAllStudentOtd? _getReportAllStudentOtd;
  List<ChartData> chartData = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getReportStudentController = GetReportStudentController(context: context);
    _getReportStudentController1 =
        GetReportStudentController1(context: context);
    _getReportStudentController!.getReportStudent('day').then((value) {
      setState(() {
        _listOfReportStudent = value!;
        data = _listOfReportStudent;
      });
      _getReportStudentController1!.getReportStudent1().then((value) {
        setState(() {
          _getReportAllStudentOtd = value!;
          chartData = [
            ChartData("Đã nhập học", _getReportAllStudentOtd!.daNhapHoc),
            ChartData("Chưa nhập học", _getReportAllStudentOtd!.chuaNhapHoc)
          ];
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _listOfReportStudent == [] && _getReportAllStudentOtd == null
            ? CircularProgressIndicator()
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                //Initialize the chart widget
                // SfCartesianChart(
                //   primaryXAxis: CategoryAxis(),
                //   title: ChartTitle(text: "Báo cáo theo ngày"),
                //   legend: Legend(isVisible: true),
                //   tooltipBehavior: TooltipBehavior(enable: true),
                //   series: <ChartSeries<>>,
                // ),
                Container(
                  width: 200,
                  child: DropdownButton(
                    isExpanded: true,
                    items: [
                      DropdownMenuItem(
                        onTap: () {
                          _getReportStudentController!
                              .getReportStudent('day')
                              .then((value) {
                            setState(() {
                              _listOfReportStudent = value!;
                              data = _listOfReportStudent;
                            });
                          });
                        },
                        child: Text("Báo cáo theo ngày"),
                        value: "ngày",
                      ),
                      DropdownMenuItem(
                        onTap: () {
                          _getReportStudentController!
                              .getReportStudent('month')
                              .then((value) {
                            setState(() {
                              _listOfReportStudent = value!;
                              data = _listOfReportStudent;
                            });
                          });
                        },
                        child: Text("Báo cáo theo tháng"),
                        value: "tháng",
                      ),
                      DropdownMenuItem(
                        onTap: () {
                          _getReportStudentController!
                              .getReportStudent('year')
                              .then((value) {
                            setState(() {
                              _listOfReportStudent = value!;
                              data = _listOfReportStudent;
                            });
                          });
                        },
                        child: Text("Báo cáo theo năm"),
                        value: "năm",
                      )
                    ],
                    onChanged: (value) {
                      setState(() {
                        text = value as String?;
                      });
                      print("aaaaa  +$value");
                    },
                    value: text,
                    hint: Text("Chọn kiểu"),
                    alignment: Alignment.center,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: SfCartesianChart(
                            primaryXAxis: CategoryAxis(),
                            // Chart title
                            title: ChartTitle(
                                text: 'Báo cáo số lượng sinh viên theo $text'),
                            // Enable legend
                            legend: Legend(isVisible: true),
                            // Enable tooltip
                            tooltipBehavior: TooltipBehavior(enable: true),
                            series: <ChartSeries<GetReportStudentOtd, String>>[
                              LineSeries<GetReportStudentOtd, String>(
                                  dataSource: data,
                                  xValueMapper:
                                      (GetReportStudentOtd sales, _) =>
                                          sales.title,
                                  yValueMapper:
                                      (GetReportStudentOtd sales, _) =>
                                          sales.total,
                                  name: 'Số lượng',
                                  // Enable data label
                                  dataLabelSettings:
                                      DataLabelSettings(isVisible: true))
                            ]),
                      ),
                      Expanded(
                          flex: 1,
                          child: _getReportAllStudentOtd == null
                              ? Center(
                                  child: Container(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator()),
                                )
                              : Center(
                                  child: Container(
                                      child: SfCircularChart(
                                          margin: EdgeInsets.all(5),
                                          title: ChartTitle(
                                              text:
                                                  'Báo cáo tổng số lượng sinh viên ${_getReportAllStudentOtd!.tongSo}'),
                                          tooltipBehavior:
                                              TooltipBehavior(enable: true),
                                          legend: Legend(isVisible: true),
                                          series: <CircularSeries>[
                                      // Render pie chart
                                      PieSeries<ChartData, String>(
                                          dataSource: chartData,
                                          pointColorMapper: (ChartData data,
                                                  _) =>
                                              Colors.primaries[Random().nextInt(
                                                  Colors.primaries.length)],
                                          xValueMapper: (ChartData data, _) =>
                                              data.name,
                                          yValueMapper: (ChartData data, _) =>
                                              data.total)
                                    ]))))
                    ],
                  ),
                ),
              ]));
  }
}

class ChartData {
  ChartData(this.name, this.total);
  final String name;
  final int total;
}
