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
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TipsProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ExcercisesProvider()),
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
      path: '/details',
      name: "details",
      builder: (BuildContext context, GoRouterState state) {
        return TipsDetails();
      },
    ),
    GoRoute(
      path: '/details1',
      name: "details1",
      builder: (BuildContext context, GoRouterState state) {
        return MeditationDetails();
      },
    ),
    GoRoute(
      path: '/details2',
      name: "details2",
      builder: (BuildContext context, GoRouterState state) {
        return ExerciseDetails();
      },
    ),
    GoRoute(
      path: '/details3',
      name: "details3",
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: _router, debugShowCheckedModeBanner: false);
  }
}
