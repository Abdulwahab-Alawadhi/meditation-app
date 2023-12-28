import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Colors.white,
              Colors.blueGrey,
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //ElevatedButton(onPressed: () {}, child: Text("Welcome!")),
            Text('Register',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                )),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(top: 35, right: 35, left: 35),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Username',
                    hintText: 'Your Username'),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 35, right: 35, left: 35),
              child: TextField(
                cursorColor: Colors.amber,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Email',
                    hintText: 'Enter your Email'),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 35, right: 35, left: 35),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Password',
                    hintText: 'Enter Password'),
              ),
            ),
            SizedBox(height: 25),
            Column(
              children: [
                ElevatedButton(
                    onPressed: () => (context.pushNamed("signup")),
                    child: Text("Register")),
                SizedBox(height: 25),
                RichText(
                  text: TextSpan(
                      text: "Have an account? ",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      children: [
                        TextSpan(
                            text: 'Login',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                ;
                              },
                            style: TextStyle(color: Colors.blue))
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
