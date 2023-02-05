import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
   
  const HomePage({super.key, required this.username});

  final String username;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ${widget.username}'),
      ),
    );
  }
}
