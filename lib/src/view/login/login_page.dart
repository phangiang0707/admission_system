import 'package:admission_system/src/model/sponsorModel.dart';
import 'package:admission_system/src/view/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../controller/getUser.controller.dart';
import '../../controller/postLogin.controller.dart';
import '../../utils/url.dart';
import 'package:http/http.dart' as http;

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  TextEditingController _txtEmail = TextEditingController();
  TextEditingController _txtPass = TextEditingController();
  LoginControllerr? _loginControllerr;
  GetUserController? _getUserController;
  String errorEmail = '';
  String errorPass = '';
  String _txtError = '';

  bool isEmail(String string) {
    // Null or empty string is invalid
    if (string.isEmpty) {
      return false;
    }

    final regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!regExp.hasMatch(string)) {
      return false;
    }
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserController = GetUserController(context: context);
    _loginControllerr = LoginControllerr(context: context);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
            //color: Colors.amber,
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.only(top: 100),
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.fill,
                  ),
                ),
                // Text(
                //   "Hệ thống hỗ trợ nhập học",
                //   style: TextStyle(
                //       fontSize: 24,
                //       fontWeight: FontWeight.w700,
                //       color: Color.fromRGBO(23, 161, 250, 1)),
                // ),
                SizedBox(
                  height: 100,
                ),
                Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(23, 161, 250, 1)),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 400,
                  child: Column(
                    children: [
                      TextFormField(
                        onFieldSubmitted: (value) async {
                          var response = await http
                              .post(Uri.parse('${url}auth/login'), body: {
                            "email": _txtEmail.text,
                            "password": _txtPass.text
                          });
                          if (response.statusCode != 201) {
                            setState(() {
                              _txtError = "Email hoặc mật khẩu không hợp lệ";
                            });
                          } else {
                            setState(() {
                              _txtError = "";
                            });
                          }
                          if (isEmail(_txtEmail.text)) {
                            errorEmail = "";
                            setState(() {});
                          } else {
                            errorEmail = 'Email không hợp lệ';
                            setState(() {});
                          }
                          isEmail(_txtEmail.text)
                              ? _loginControllerr!
                                  .loginUser(_txtEmail.text, _txtPass.text)
                                  .then((value) {
                                  Provider.of<SponsorModel>(context,
                                          listen: false)
                                      .loginUser(value);
                                  _getUserController!.getUser().then((value) {
                                    Provider.of<SponsorModel>(context,
                                            listen: false)
                                        .GetUser(value);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Home_page()));
                                  });
                                })
                              : print("Error email");
                        },
                        controller: _txtEmail,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: "Email",
                            border: const OutlineInputBorder(),
                            hintText: "Email",
                            errorText: errorEmail.isEmpty ? null : errorEmail),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onFieldSubmitted: (value) async {
                          var response = await http
                              .post(Uri.parse('${url}auth/login'), body: {
                            "email": _txtEmail.text,
                            "password": _txtPass.text
                          });
                          if (response.statusCode != 201) {
                            setState(() {
                              _txtError = "Email hoặc mật khẩu không hợp lệ";
                            });
                          } else {
                            setState(() {
                              _txtError = "";
                            });
                          }
                          if (isEmail(_txtEmail.text)) {
                            errorEmail = "";
                            setState(() {});
                          } else {
                            errorEmail = 'Email không hợp lệ';
                            setState(() {});
                          }
                          isEmail(_txtEmail.text)
                              ? _loginControllerr!
                                  .loginUser(_txtEmail.text, _txtPass.text)
                                  .then((value) {
                                  Provider.of<SponsorModel>(context,
                                          listen: false)
                                      .loginUser(value);
                                  _getUserController!.getUser().then((value) {
                                    Provider.of<SponsorModel>(context,
                                            listen: false)
                                        .GetUser(value);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Home_page()));
                                  });
                                })
                              : print("Error email");
                        },
                        controller: _txtPass,
                        obscureText: true,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(
                                      23, 161, 250, 1)), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(23, 161, 250, 1)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            labelText: "Password",
                            border: const OutlineInputBorder(),
                            hintText: "Password",
                            errorText: errorPass.isEmpty ? null : errorPass),
                      ),
                      Text(
                        _txtError,
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    var response = await http
                        .post(Uri.parse('${url}auth/login'), body: {
                      "email": _txtEmail.text,
                      "password": _txtPass.text
                    });
                    if (response.statusCode != 201) {
                      setState(() {
                        _txtError = "Email hoặc mật khẩu không hợp lệ";
                      });
                    } else {
                      setState(() {
                        _txtError = "";
                      });
                    }
                    if (isEmail(_txtEmail.text)) {
                      errorEmail = "";
                      setState(() {});
                    } else {
                      errorEmail = 'Email không hợp lệ';
                      setState(() {});
                    }
                    isEmail(_txtEmail.text)
                        ? _loginControllerr!
                            .loginUser(_txtEmail.text, _txtPass.text)
                            .then((value) {
                            Provider.of<SponsorModel>(context, listen: false)
                                .loginUser(value);
                            _getUserController!.getUser().then((value) {
                              Provider.of<SponsorModel>(context, listen: false)
                                  .GetUser(value);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home_page()));
                            });
                          })
                        : print("Error email");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromRGBO(23, 161, 250, 1)),
                    child: Text(
                      "Đăng nhập",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            )),
      );
}
