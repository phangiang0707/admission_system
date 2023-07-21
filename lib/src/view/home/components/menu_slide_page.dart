import 'package:flutter/material.dart';

class Menu_slide_page extends StatefulWidget {
  const Menu_slide_page({super.key});

  @override
  State<Menu_slide_page> createState() => _Menu_slide_pageState();
}

class _Menu_slide_pageState extends State<Menu_slide_page> {
  final List _isHovering = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        InkWell(
          onHover: (value) {
            setState(() {
              value ? _isHovering[0] = true : _isHovering[0] = false;
            });
          },
          onTap: () {},
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
          onTap: () {},
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
          onTap: () {},
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
          onTap: () {},
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
      ]),
    );
  }
}
