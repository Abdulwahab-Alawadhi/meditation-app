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

class _SigninPageState extends State<SigninPage> {
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
            //   begin: Alignment.topRight,
            //   end: Alignment.bottomLeft,
            //   colors: [Colors.blueGrey, Colors.white],
            // ),
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign In',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: 'Email / Username',
                  hintText: 'Enter your email or username',
                  fillColor: Colors.white,
                  filled: true,
                ),
                controller: usernameController,
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: 'Password',
                  hintText: 'Enter password',
                  fillColor: Colors.white,
                  filled: true,
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
                        .signin(user: user)
                        .then((token) {
                      if (token.isNotEmpty) {
                        context.push("/home", extra: user);
                      }
                    });
                  },
                  child: Text("Login"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                ),
                SizedBox(height: 15),
                RichText(
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
