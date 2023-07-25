import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/model/sponsorModel.dart';
import 'src/view/home/home_page.dart';
import 'src/view/login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SponsorModel())],
      child: MaterialApp(
          theme: ThemeData(backgroundColor: Colors.white),
          debugShowCheckedModeBanner: false,
          home: SafeArea(child: Login_page())),
    );
  }
}
