import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/models/tip.dart';
import 'package:meditation_app/providers/auth_providers.dart';
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meditation Tips'),
          elevation: 10,
          backgroundColor: Colors.red,
          bottom: TabBar(tabs: [
            Tab(
              text: "All Tips",
            ),
            Tab(
              text: "My Tips",
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pushNamed('addTip');
          },
          child: Icon(Icons.add),
        ),
        body: TabBarView(children: [
          AllTipsTab(),
          MyTipsTab(),
        ]),
      ),
    );
  }
}

class AllTipsTab extends StatelessWidget {
  const AllTipsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
    );
  }
}

class MyTipsTab extends StatelessWidget {
  MyTipsTab({super.key});

  @override
  Widget build(BuildContext context) {
    // print(context.watch<AuthProvider>().user.username);
    return FutureBuilder(
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
    );
  }
}
