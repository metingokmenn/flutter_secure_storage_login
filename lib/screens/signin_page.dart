import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_auth/screens/login_page.dart';
import 'package:flutter_secure_auth/widgets/custom_textformfield.dart';
import 'package:flutter_secure_auth/widgets/info_text.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final formKey = GlobalKey<FormState>();

  final storage = const FlutterSecureStorage();

  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign-in'),
        ),
        body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextFormField(
                  controller: usernameController, type: 'Username'),
              CustomTextFormField(
                  controller: passwordController, type: 'Password'),
              const InfoText(type: 'Signin'),
              ElevatedButton(onPressed: signin, child: const Text('SIGN-IN'))
            ],
          ),
        ),
      ),
    );
  }

  void signin() async {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      await storage.write(key: 'username', value: usernameController.text);
      await storage.write(key: 'password', value: usernameController.text);
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .push(CupertinoPageRoute(builder: ((context) => const LoginPage())));
    }
  }
}
