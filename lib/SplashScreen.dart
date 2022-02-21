import 'package:flutter/material.dart';

import 'LoginForm.dart';
import 'RegisterForm.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int pageState = 0;
  double loginScreenHeight = 0;
  double registerScreenHeight = 0;

  @override
  Widget build(BuildContext context) {
    switch (pageState) {
      case 0:
        loginScreenHeight = MediaQuery.of(context).size.height;
        registerScreenHeight = MediaQuery.of(context).size.height;
        break;
      case 1:
        loginScreenHeight = MediaQuery.of(context).size.height - 450;
        registerScreenHeight = MediaQuery.of(context).size.height;
        break;
      case 2:
        loginScreenHeight = MediaQuery.of(context).size.height - 450;
        registerScreenHeight = MediaQuery.of(context).size.height - 540;
        break;
    }

    return Material(
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    pageState = 0;
                  });
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(15),
                      child: Image.asset(
                        'assets/images/Online shopping-amico.png',
                        height: 300,
                        width: 300,
                      ),
                    ),
                    SizedBox(
                      height: 250,
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.deepPurple),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side:
                                        BorderSide(color: Colors.deepPurple)))),
                        onPressed: () {
                          setState(() {
                            pageState = 1;
                          });
                        },
                        child: const Text(
                          "Let's Go.",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            /// splashscreen
            AnimatedContainer(
              duration: Duration(milliseconds: 400),
              transform: Matrix4.translationValues(1, loginScreenHeight, 0),
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  LoginForm(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            pageState = 2;
                          });
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 400),
              transform: Matrix4.translationValues(1, registerScreenHeight, 0),
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RegisterForm(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account"),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            pageState = 1;
                          });
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
