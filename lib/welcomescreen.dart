import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'register.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              height: MediaQuery.of(context).size.height - 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Image.asset("assets/images/welcome.JPG"),
                    ),
                  ),
                  Text(
                    "Take privacy with you.\nBe yourself in every\nmessage.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800]),
                  ),
                  Text(
                    "Terms & Privacy Policy",
                    style: TextStyle(color: Colors.grey[600], fontSize: 18),
                  ),
                  ButtonTheme(
                    height: 40,
                    minWidth: MediaQuery.of(context).size.width * 0.65,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      color: Colors.blue[700],
                      onPressed: () {
                        Get.offAll(Register());
                      },
                      child: Text(
                        "CONTINUE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Restore backup",
                      style: TextStyle(
                          color: Colors.blue[700],
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
