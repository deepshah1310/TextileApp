import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_course/app/dashboard/constants.dart';
import 'package:flutter_course/app/landing_page.dart';
import 'package:flutter_course/app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_course/app/services/database.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'timetracker',
        theme: ThemeData(
          primarySwatch: color1,
        ),
        home: landing_page(
           auth : Auth()
        )

      );
  }
}
