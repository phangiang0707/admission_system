import 'package:flutter/material.dart';

import '../../infoStudent/info_student_page.dart';
import '../../price/price_page.dart';
import '../../report/report_page.dart';
import '../../uniform/uniform_page.dart';

class Drawar_page extends StatefulWidget {
  const Drawar_page({super.key});

  @override
  State<Drawar_page> createState() => _Drawar_pageState();
}

class _Drawar_pageState extends State<Drawar_page> {
  final List _isHovering = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: Color.fromARGB(255, 0, 61, 110),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          InkWell(
            onHover: (value) {
              setState(() {
                value ? _isHovering[0] = true : _isHovering[0] = false;
              });
            },
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Info_Student_page()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.people,
                        color: Color.fromARGB(255, 0, 61, 110),
                        size: 24,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Thông tin học sinh',
                        style: TextStyle(
                          color: _isHovering[0]
                              ? Color.fromARGB(255, 0, 61, 110)
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Visibility(
                  maintainAnimation: true,
                  maintainState: true,
                  maintainSize: true,
                  visible: _isHovering[0],
                  child: Container(
                    height: 20,
                    width: 2,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onHover: (value) {
              setState(() {
                value ? _isHovering[1] = true : _isHovering[1] = false;
              });
            },
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Price_page(
                      checkRole: "price_page",
                    ),
                  ));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.price_check,
                        color: Color.fromARGB(255, 0, 61, 110),
                        size: 24,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Học phí',
                        style: TextStyle(
                          color: _isHovering[1]
                              ? Color.fromARGB(255, 0, 61, 110)
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Visibility(
                  maintainAnimation: true,
                  maintainState: true,
                  maintainSize: true,
                  visible: _isHovering[1],
                  child: Container(
                    height: 20,
                    width: 2,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onHover: (value) {
              setState(() {
                value ? _isHovering[2] = true : _isHovering[2] = false;
              });
            },
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Price_page(
                      checkRole: "uniform_page",
                    ),
                  ));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.layers_outlined,
                        color: Color.fromARGB(255, 0, 61, 110),
                        size: 24,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Đồng phục',
                        style: TextStyle(
                          color: _isHovering[2]
                              ? Color.fromARGB(255, 0, 61, 110)
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Visibility(
                  maintainAnimation: true,
                  maintainState: true,
                  maintainSize: true,
                  visible: _isHovering[2],
                  child: Container(
                    height: 20,
                    width: 2,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onHover: (value) {
              setState(() {
                value ? _isHovering[3] = true : _isHovering[3] = false;
              });
            },
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Report_page()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.report,
                        color: Color.fromARGB(255, 0, 61, 110),
                        size: 24,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Báo cáo',
                        style: TextStyle(
                          color: _isHovering[3]
                              ? Color.fromARGB(255, 0, 61, 110)
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Visibility(
                  maintainAnimation: true,
                  maintainState: true,
                  maintainSize: true,
                  visible: _isHovering[3],
                  child: Container(
                    height: 20,
                    width: 2,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
