import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" home page"),
      ),
      body: Container(
        child: Image.asset(
          'assets/images/Online shopping-amico.png',
          height: 300,
          width: 300,
        ),
      ),
    );
  }
}
