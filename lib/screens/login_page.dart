import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_auth/screens/home_page.dart';
import 'package:flutter_secure_auth/screens/signin_page.dart';
import 'package:flutter_secure_auth/widgets/custom_textformfield.dart';
import 'package:flutter_secure_auth/widgets/info_text.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Login',
          ),
        ),
        body: buildForm(context),
      ),
    );
  }

  Form buildForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomTextFormField(controller: usernameController, type: 'Username'),
          CustomTextFormField(controller: passwordController, type: 'Password'),
          const InfoText(type: 'Login'),
          ElevatedButton(onPressed: login, child: const Text('LOGIN'))
        ],
      ),
    );
  }

  void login() async {
    String? username = await storage.read(key: 'username');
    String? password = await storage.read(key: 'password');
    formKey.currentState!.save();

    if (formKey.currentState!.validate()) {
      if (username! == usernameController.text &&
          password! == passwordController.text) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(CupertinoPageRoute(
            builder: ((context) => HomePage(
                  username: username,
                ))));
      } else {
        Fluttertoast.showToast(msg: 'Incorrect username or password');
      }
    }
  }
}
