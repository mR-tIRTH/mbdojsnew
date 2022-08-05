import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mbtl/dashboardPage.dart';
import 'package:mbtl/datain.dart';
import 'package:mbtl/loginPage.dart';
import 'package:mbtl/navigationBar/homePage.dart';
import 'eventinput.dart';
import 'tabsview/member.dart' as mem;
import 'tabsview/commitee.dart' as com;
import 'package:flutter_downloader/flutter_downloader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
  await Firebase.initializeApp();
  mem.set(); //for memberdetails to have call permit
  com.set(); //--
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
