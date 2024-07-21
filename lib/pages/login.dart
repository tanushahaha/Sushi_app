import 'package:flutter/material.dart';
import 'package:sushi_app/themes/colors.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      backgroundColor: Colors.grey[300],
      appBar: AppBar
        (
        title: Text("User Login"),
        backgroundColor: primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
              Icon(Icons.lock_rounded,
                  size:72,
                  color: Colors.grey[800],
              ),
            const SizedBox(height: 25),

            //message
                Text("Sushi?At Your Doorstep!",
                style: TextStyle
                  (
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
                ),
            const SizedBox(height: 25),
            //email/phone
            TextField(),

            //password

            //sign in

            //not a member?register now
          ],
        ),
      ),
    );
  }
}
