import 'package:flutter/material.dart';
import 'package:meditation_app/models/tip.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:provider/provider.dart';

class TipCard extends StatelessWidget {
  TipCard({super.key, required this.tip, required this.user});
  final String user;
  final Tip tip;
  final titleStyle = TextStyle(
    fontSize: 17,
    color: Colors.black,
  );
  final authorStyle = TextStyle(
    fontSize: 13,
    color: const Color.fromARGB(255, 38, 38, 38),
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.numbers,
                color: Colors.deepPurple,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tip.text!,
                      style: titleStyle,
                    ),
                    Text(
                      "Author: ${tip.author!}",
                      style: authorStyle,
                    ),
                  ],
                ),
              ),
              tip.author == user
                  ? IconButton(
                      onPressed: () {
                        context.read<TipsProvider>().deleteTip(tip.id!);
                      },
                      icon: Icon(
                        Icons.delete_rounded,
                        color: Colors.red[800],
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
