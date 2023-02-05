import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_auth/screens/signin_page.dart';

import '../screens/login_page.dart';

class InfoText extends StatelessWidget {
  final String type;
  const InfoText({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(type == 'Signin'
            ? 'Do you have an account already ?'
            : "Don't you have an account yet?"),
        TextButton(
            onPressed: () {
              if (type == 'Signin') {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: ((context) => const LoginPage()),
                  ),
                );
              } else if (type == 'Login') {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: ((context) => const SigninPage()),
                  ),
                );
              }
            },
            child: Text(type == 'Signin' ? 'LOGIN' : 'SIGN-IN')),
      ],
    );
  }
}
