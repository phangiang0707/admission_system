import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/sponsorModel.dart';
import '../help/help_page.dart';
import '../infoStudent/info_student_page.dart';
import '../price/price_page.dart';
import '../report/report_page.dart';
import '../responvice.dart';
import 'components/top_bar_contents.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  late ScrollController _scrollController;
  SponsorModel? model;
  final List _isHovering = [false, false, false, false, false];
  int isChoice = 0;
  List<Widget> listWidget = [
    Info_Student_page(),
    Price_page(
      checkRole: "price_page",
    ),
    Price_page(
      checkRole: "uniform_page",
    ),
    //Uniform_page(),
    Report_page(),
    Help_page(),
  ];
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    model = Provider.of<SponsorModel>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Color.fromARGB(255, 0, 61, 110),
              elevation: 0,
              centerTitle: true,
              title: Text(
                'HỆ THỐNG HỖ TRỢ NHẬP HỌC',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(_opacity),
            ),
      drawer: ResponsiveWidget.isSmallScreen(context)
          ? Drawer(
              shadowColor: Color.fromARGB(255, 0, 61, 110),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Provider.of<SponsorModel>(context, listen: false)
                                  .getUser!
                                  .roles[1] ==
                              "ROLE_ADMIN" ||
                          Provider.of<SponsorModel>(context, listen: false)
                                  .getUser!
                                  .roles[1] ==
                              "ROLE_PDT"
                      ? InkWell(
                          onHover: (value) {
                            setState(() {
                              value
                                  ? _isHovering[0] = true
                                  : _isHovering[0] = false;
                            });
                          },
                          onTap: () {
                            setState(() {
                              isChoice = 0;
                            });
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
                        )
                      : SizedBox(),
                  SizedBox(
                    height: 20,
                  ),
                  Provider.of<SponsorModel>(context, listen: false)
                                  .getUser!
                                  .roles[1] ==
                              "ROLE_ADMIN" ||
                          Provider.of<SponsorModel>(context, listen: false)
                                  .getUser!
                                  .roles[1] ==
                              "ROLE_PKT"
                      ? InkWell(
                          onHover: (value) {
                            setState(() {
                              value
                                  ? _isHovering[1] = true
                                  : _isHovering[1] = false;
                            });
                          },
                          onTap: () {
                            setState(() {
                              isChoice = 1;
                            });
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
                        )
                      : SizedBox(),
                  SizedBox(
                    height: 20,
                  ),
                  Provider.of<SponsorModel>(context, listen: false)
                                  .getUser!
                                  .roles[1] ==
                              "ROLE_ADMIN" ||
                          Provider.of<SponsorModel>(context, listen: false)
                                  .getUser!
                                  .roles[1] ==
                              "ROLE_PCTSV"
                      ? InkWell(
                          onHover: (value) {
                            setState(() {
                              value
                                  ? _isHovering[2] = true
                                  : _isHovering[2] = false;
                            });
                          },
                          onTap: () {
                            setState(() {
                              isChoice = 2;
                            });
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
                        )
                      : SizedBox(),
                  SizedBox(
                    height: 20,
                  ),
                  Provider.of<SponsorModel>(context, listen: false)
                              .getUser!
                              .roles[1] ==
                          "ROLE_ADMIN"
                      ? InkWell(
                          onHover: (value) {
                            setState(() {
                              value
                                  ? _isHovering[3] = true
                                  : _isHovering[3] = false;
                            });
                          },
                          onTap: () {
                            setState(() {
                              isChoice = 3;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add_chart,
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
                        )
                      : SizedBox(),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value ? _isHovering[4] = true : _isHovering[4] = false;
                      });
                    },
                    onTap: () {
                      setState(() {
                        isChoice = 4;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.help,
                                color: Color.fromARGB(255, 0, 61, 110),
                                size: 24,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Hỗ trợ',
                                style: TextStyle(
                                  color: _isHovering[4]
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
                          visible: _isHovering[4],
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
            )
          : SizedBox(),
      body:
          // Provider.of<SponsorModel>(context, listen: false)
          //             .getUser!
          //             .roles[1] ==
          //         "ROLE_PCTSV"
          //     ? Price_page(
          //         checkRole: "uniform_page",
          //       )
          //     : Provider.of<SponsorModel>(context, listen: false)
          //                 .getUser!
          //                 .roles[1] ==
          //             "ROLE_PKT"
          //         ? Price_page(
          //             checkRole: "price_page",
          //           )
          //         : Provider.of<SponsorModel>(context, listen: false)
          //                     .getUser!
          //                     .roles[1] ==
          //                 "ROLE_PDT"
          //             ? Info_Student_page()
          //             : Provider.of<SponsorModel>(context, listen: false)
          //                         .getUser!
          //                         .roles[1] ==
          //                     "ROLE_ADMIN"
          //                 ?
          Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveWidget.isSmallScreen(context)
              ? SizedBox()
              : Container(
                  width: 200,
                  height: double.infinity,
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(
                              color: Color.fromARGB(255, 0, 61, 110)))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Provider.of<SponsorModel>(context, listen: false)
                                        .getUser!
                                        .roles[1] ==
                                    "ROLE_ADMIN" ||
                                Provider.of<SponsorModel>(context,
                                            listen: false)
                                        .getUser!
                                        .roles[1] ==
                                    "ROLE_PDT"
                            ? Container(
                                child: Column(
                                  children: [
                                    InkWell(
                                      onHover: (value) {
                                        setState(() {
                                          value
                                              ? _isHovering[0] = true
                                              : _isHovering[0] = false;
                                        });
                                      },
                                      onTap: () {
                                        setState(() {
                                          isChoice = 0;
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.people,
                                                  color: Color.fromARGB(
                                                      255, 0, 61, 110),
                                                  size: 24,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Thông tin học sinh',
                                                  style: TextStyle(
                                                    fontWeight: isChoice == 0
                                                        ? FontWeight.bold
                                                        : null,
                                                    color: isChoice == 0
                                                        ? Color.fromARGB(
                                                            255, 0, 61, 110)
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
                                              height: 40,
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
                                  ],
                                ),
                              )
                            : SizedBox(),
                        Provider.of<SponsorModel>(context, listen: false)
                                        .getUser!
                                        .roles[1] ==
                                    "ROLE_ADMIN" ||
                                Provider.of<SponsorModel>(context,
                                            listen: false)
                                        .getUser!
                                        .roles[1] ==
                                    "ROLE_PKT"
                            ? Container(
                                child: Column(
                                  children: [
                                    InkWell(
                                      onHover: (value) {
                                        setState(() {
                                          value
                                              ? _isHovering[1] = true
                                              : _isHovering[1] = false;
                                        });
                                      },
                                      onTap: () {
                                        setState(() {
                                          isChoice = 1;
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.price_check,
                                                  color: Color.fromARGB(
                                                      255, 0, 61, 110),
                                                  size: 24,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Học phí',
                                                  style: TextStyle(
                                                    fontWeight: isChoice == 1
                                                        ? FontWeight.bold
                                                        : null,
                                                    color: isChoice == 1
                                                        ? Color.fromARGB(
                                                            255, 0, 61, 110)
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
                                              height: 40,
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
                                  ],
                                ),
                              )
                            : SizedBox(),
                        Provider.of<SponsorModel>(context, listen: false)
                                        .getUser!
                                        .roles[1] ==
                                    "ROLE_ADMIN" ||
                                Provider.of<SponsorModel>(context,
                                            listen: false)
                                        .getUser!
                                        .roles[1] ==
                                    "ROLE_PCTSV"
                            ? Container(
                                child: Column(
                                  children: [
                                    InkWell(
                                      onHover: (value) {
                                        setState(() {
                                          value
                                              ? _isHovering[2] = true
                                              : _isHovering[2] = false;
                                        });
                                      },
                                      onTap: () {
                                        setState(() {
                                          isChoice = 2;
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.layers_outlined,
                                                  color: Color.fromARGB(
                                                      255, 0, 61, 110),
                                                  size: 24,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Đồng phục',
                                                  style: TextStyle(
                                                    fontWeight: isChoice == 2
                                                        ? FontWeight.bold
                                                        : null,
                                                    color: isChoice == 2
                                                        ? Color.fromARGB(
                                                            255, 0, 61, 110)
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
                                              height: 40,
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
                                  ],
                                ),
                              )
                            : SizedBox(),
                        Provider.of<SponsorModel>(context, listen: false)
                                    .getUser!
                                    .roles[1] ==
                                "ROLE_ADMIN"
                            ? Container(
                                child: Column(
                                  children: [
                                    InkWell(
                                      onHover: (value) {
                                        setState(() {
                                          value
                                              ? _isHovering[3] = true
                                              : _isHovering[3] = false;
                                        });
                                      },
                                      onTap: () {
                                        setState(() {
                                          isChoice = 3;
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.bar_chart,
                                                  color: Color.fromARGB(
                                                      255, 0, 61, 110),
                                                  size: 24,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Báo cáo',
                                                  style: TextStyle(
                                                    fontWeight: isChoice == 3
                                                        ? FontWeight.bold
                                                        : null,
                                                    color: isChoice == 3
                                                        ? Color.fromARGB(
                                                            255, 0, 61, 110)
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
                                              height: 40,
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
                                  ],
                                ),
                              )
                            : SizedBox(),
                        InkWell(
                          onHover: (value) {
                            setState(() {
                              value
                                  ? _isHovering[4] = true
                                  : _isHovering[4] = false;
                            });
                          },
                          onTap: () {
                            setState(() {
                              isChoice = 4;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.help,
                                      color: Color.fromARGB(255, 0, 61, 110),
                                      size: 24,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Hỗ trợ',
                                      style: TextStyle(
                                        fontWeight: isChoice == 4
                                            ? FontWeight.bold
                                            : null,
                                        color: isChoice == 4
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
                                visible: _isHovering[4],
                                child: Container(
                                  height: 40,
                                  width: 2,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              // flex: 7,
              child: listWidget[isChoice])
        ],
      ),
    );
  }
}
