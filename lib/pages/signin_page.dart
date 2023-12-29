import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Colors.blueGrey,
              Colors.white,
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //ElevatedButton(onPressed: () {}, child: Text("Welcome!")),
            Text('Sign in',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                )),
            Padding(
              padding: EdgeInsets.only(top: 35, right: 35, left: 35),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Email / Username',
                    hintText: 'Enter your email or username'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, right: 35, left: 35),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Password',
                    hintText: 'Enter password'),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              children: [
                ElevatedButton(
                    onPressed: () => context.pushNamed('home'),
                    child: Text("Login")),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: RichText(
                    text: TextSpan(
                        text: 'Not a user? ',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                        children: [
                          TextSpan(
                              text: 'Register',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.pushNamed('signup');
                                },
                              style: TextStyle(color: Colors.blue))
                        ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
