import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/pages/home_page.dart';
import 'package:meditation_app/pages/signin_page.dart';
import 'package:meditation_app/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: "signin",
      builder: (BuildContext context, GoRouterState state) {
        return SigninPage();
      },
    ),
    GoRoute(
      path: '/signup',
      name: "signup",
      builder: (BuildContext context, GoRouterState state) {
        return SignupPage();
      },
    ),
    GoRoute(
      path: '/home',
      name: "home",
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: _router, debugShowCheckedModeBanner: false);
  }
}
