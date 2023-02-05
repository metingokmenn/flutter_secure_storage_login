import 'package:flutter/material.dart';

import 'package:flutter_secure_auth/screens/signin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.deepPurple,
            elevation: 0,
            centerTitle: false,
            titleTextStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          primarySwatch: Colors.cyan,
          scaffoldBackgroundColor: Colors.deepPurple),
      home: const SigninPage(),
    );
  }
}
