// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:firepostnew/pages/home_page.dart';
import 'package:firepostnew/pages/signin_page.dart';
import 'package:firepostnew/pages/signup_page.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const SignInPage(),
      routes: {
        HomePage.id:(context)=>const HomePage(),
        SignInPage.id:(context)=>const SignInPage(),
        SignUpPage.id:(context)=>const SignUpPage(),
      },
    );
  }
}


