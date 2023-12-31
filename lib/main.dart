import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/pages/cards_pages.dart/add_tip.dart';
import 'package:meditation_app/pages/cards_pages.dart/meditation_details.dart';
import 'package:meditation_app/pages/cards_pages.dart/music_details.dart';
import 'package:meditation_app/pages/cards_pages.dart/tips_details.dart';
import 'package:meditation_app/pages/cards_pages.dart/exercise_details.dart';
import 'package:meditation_app/pages/mother.dart';
import 'package:meditation_app/pages/signin_page.dart';
import 'package:meditation_app/pages/signup_page.dart';
import 'package:meditation_app/providers/auth_providers.dart';
import 'package:meditation_app/providers/excersise_provider.dart';
import 'package:meditation_app/providers/music_medi_provider.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TipsProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ExcercisesProvider()),
        ChangeNotifierProvider(create: (_) => MusicMediProvider()),
      ],
      child: MyApp(),
    ),
  );
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
        return MotherPage();
      },
    ),
    GoRoute(
      path: '/tips',
      name: "tips",
      builder: (BuildContext context, GoRouterState state) {
        return TipsDetails();
      },
    ),
    GoRoute(
      path: '/meditation',
      name: "meditation",
      builder: (BuildContext context, GoRouterState state) {
        return MeditationDetails();
      },
    ),
    GoRoute(
      path: '/exercise',
      name: "exercise",
      builder: (BuildContext context, GoRouterState state) {
        return ExcersisesDetails();
      },
    ),
    GoRoute(
      path: '/music',
      name: "music",
      builder: (BuildContext context, GoRouterState state) {
        return MusicDetails();
      },
    ),
    GoRoute(
      path: '/addTip',
      name: "addTip",
      builder: (BuildContext context, GoRouterState state) {
        return AddTip();
      },
    ),
  ],
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//         routerConfig: _router, debugShowCheckedModeBanner: false);
//   }
}
