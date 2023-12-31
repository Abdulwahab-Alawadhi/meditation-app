import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/providers/auth_providers.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

final usernameController = TextEditingController();

final passwordController = TextEditingController();

class _SigninPageState extends State<SigninPage> {
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
                controller: usernameController,
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
                controller: passwordController,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      final User user = User(
                          username: usernameController.text,
                          password: passwordController.text);
                      context
                          .read<AuthProvider>()
                          .signin(user: user)
                          .then((token) {
                        if (token.isNotEmpty) {
                          context.push("/home", extra: user);
                        }
                      });
                    },
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
