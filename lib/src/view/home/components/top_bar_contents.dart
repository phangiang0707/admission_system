import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/sponsorModel.dart';
import '../../login/login_page.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;

  TopBarContents(this.opacity);

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [false];
  SponsorModel? model;
  @override
  Widget build(BuildContext context) {
    model = Provider.of<SponsorModel>(context, listen: false);
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Theme.of(context).bottomAppBarColor.withOpacity(widget.opacity),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                        width: 150,
                        height: 150,
                        child: Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.cover,
                        )),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      'HỆ THỐNG HỖ TRỢ NHẬP HỌC',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 61, 110),
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 3,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.people,
                      size: 24,
                      color: Color.fromARGB(255, 0, 61, 110),
                    ),
                    Text(
                      model!.getUser!.fullname,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("-"),
                    SizedBox(
                      width: 10,
                    ),
                    Text(model!.getUser!.roles[1]),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[0] = true
                              : _isHovering[0] = false;
                        });
                      },
                      onTap: () {
                        Provider.of<SponsorModel>(context, listen: false)
                            .getLogin
                            .isNull;
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login_page()));
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          color: _isHovering[0]
                              ? Colors.black
                              : Color.fromARGB(255, 0, 61, 110),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
