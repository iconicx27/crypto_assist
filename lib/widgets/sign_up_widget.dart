// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 80.0,
            ),
            Image.asset(
              "assets/images/signup_image.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 70.0,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(300, 50), primary: Colors.grey.shade800),
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.google),
                label: Text("Sign Up with Google"))
          ],
        ),
      ),
    );
  }
}
