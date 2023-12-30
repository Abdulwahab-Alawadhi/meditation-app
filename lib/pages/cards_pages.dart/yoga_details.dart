import 'package:flutter/material.dart';

class YogaDetails extends StatelessWidget {
  const YogaDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          backgroundColor: Colors.red,
        ),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("hello")],
        ));
  }
}
