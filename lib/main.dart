import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jember_wisata/firebase_options.dart';
import 'package:jember_wisata/pages/login.dart';
import 'package:jember_wisata/pages/public/detail_event/details.dart';
import 'package:jember_wisata/pages/register.dart';
import 'package:jember_wisata/pages/splash.dart';
import 'package:jember_wisata/pages/public/buttonnav.dart';
import 'package:jember_wisata/pages/public/detail_wisata/details.dart';
import 'package:jember_wisata/pages/public/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[900],
      ),
      home: buttonNav(),
    );
  }
}
