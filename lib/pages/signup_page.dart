import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/providers/auth_providers.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controllers when the state is disposed
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            // gradient: LinearGradient(
            //     begin: Alignment.topRight,
            //     end: Alignment.bottomLeft,
            //     colors: [
            //   Colors.white,
            //   Colors.blueGrey,
            // ])
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Register',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(top: 35, right: 35, left: 35),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  labelText: 'Username',
                  hintText: 'Your Username',
                ),
                controller: usernameController,
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
                  hintText: 'Enter Password',
                ),
                controller: passwordController,
              ),
            ),
            SizedBox(height: 25),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    final User user = User(
                      username: usernameController.text,
                      password: passwordController.text,
                    );
                    context
                        .read<AuthProvider>()
                        .register(user: user)
                        .then((token) {
                      print(token);
                      if (token.isNotEmpty) {
                        context.push("/home");
                      }
                    });
                  },
                  child: Text("Register"),
                ),
                SizedBox(height: 25),
                RichText(
                  text: TextSpan(
                    text: "Have an account? ",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Login',
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
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
