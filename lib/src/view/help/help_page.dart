import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Help_page extends StatefulWidget {
  const Help_page({super.key});

  @override
  State<Help_page> createState() => _Help_pageState();
}

class _Help_pageState extends State<Help_page> {
  final Uri _url = Uri.parse(
      'https://docs.google.com/document/d/18CFLn6wb2JVRURK1LjLtn4iOxLXeXy4x/edit?usp=sharing&ouid=113631651750302924525&rtpof=true&sd=true');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "Liên hệ để được nhận hỗ trợ",
            style:
                TextStyle(fontSize: 24, color: Color.fromARGB(255, 0, 61, 110)),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 200),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      // Container(
                      //     height: 250,
                      //     width: 250,
                      //     child: Image.asset(
                      //       "assets/dat.png",
                      //       fit: BoxFit.fill,
                      //     )),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Hoàng Mai Công Đạt",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 61, 110))),
                      SizedBox(
                        height: 10,
                      ),
                      Text("SĐT: 0982785306",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 61, 110))),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Email: hmcdat@gmail.com",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 61, 110)))
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      // Container(
                      //     height: 250,
                      //     width: 250,
                      //     child: Image.asset(
                      //       "assets/son.png",
                      //       fit: BoxFit.fill,
                      //     )),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Nguyễn Minh Sơn",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 61, 110))),
                      SizedBox(
                        height: 10,
                      ),
                      Text("SĐT: 0946734111",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 61, 110))),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Email: son.nm@share4happy.com",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 61, 110)))
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      // Container(
                      //     height: 250,
                      //     width: 250,
                      //     child: Image.asset(
                      //       "assets/giang.png",
                      //       fit: BoxFit.fill,
                      //     )),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Phan Trung Giang",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 61, 110))),
                      SizedBox(
                        height: 10,
                      ),
                      Text("SĐT: 0353274035",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 61, 110))),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Email: giang.pt@share4happy.com",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 61, 110)))
                    ],
                  )),
                ],
              )),
          SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: _launchUrl, child: Text("Hướng dẫn sử dụng hệ thống")),
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
