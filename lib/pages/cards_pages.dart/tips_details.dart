import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/models/tip.dart';
import 'package:meditation_app/pages/cards_pages.dart/add_tip.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:provider/provider.dart';

class TipsDetails extends StatefulWidget {
  const TipsDetails({super.key});

  @override
  State<TipsDetails> createState() => _TipsDetailsState();
}

class _TipsDetailsState extends State<TipsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meditation Tips'),
          elevation: 10,
          backgroundColor: Colors.red,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pushNamed('addTip');
          },
          child: Icon(Icons.add),
        ),
        body: FutureBuilder(
          future: context.read<TipsProvider>().gettingTips(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Consumer<TipsProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: context.watch<TipsProvider>().tipsList.length,
                  itemBuilder: (context, index) {
                    Tip tip = context.watch<TipsProvider>().tipsList[index];

                    return Card(
                      child: ListTile(
                        title: Text(tip.author ?? ''),
                        subtitle: Text(tip.text ?? ''),
                      ),
                    );
                  },
                );
              },
            );
          },
        ));
  }
}
