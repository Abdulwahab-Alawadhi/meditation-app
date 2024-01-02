import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:meditation_app/models/tip.dart';
import 'package:meditation_app/providers/auth_providers.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:meditation_app/widgets/tip_card.dart';

class TipsDetails extends StatefulWidget {
  const TipsDetails({Key? key}) : super(key: key);

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

class AllTipsTab extends StatefulWidget {
  AllTipsTab({Key? key}) : super(key: key);

  @override
  State<AllTipsTab> createState() => _AllTipsTabState();
}

class _AllTipsTabState extends State<AllTipsTab> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var user = context.watch<AuthProvider>().user!.username;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: 'Search by text or author...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: context.read<TipsProvider>().gettingTips(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              List<Tip> filteredTips =
                  getFilteredTips(context, _searchController.text);

              return ListView.builder(
                itemCount: filteredTips.length,
                itemBuilder: (context, index) {
                  Tip tip = filteredTips[index];
                  return TipCard(tip: tip, user: user);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  List<Tip> getFilteredTips(BuildContext context, String searchQuery) {
    List<Tip> allTips = context.read<TipsProvider>().tipsList;
    return allTips
        .where((tip) =>
            (tip.text?.toLowerCase() ?? '')
                .contains(searchQuery.toLowerCase()) ||
            (tip.author?.toLowerCase() ?? '')
                .contains(searchQuery.toLowerCase()))
        .toList();
  }
}

class MyTipsTab extends StatelessWidget {
  MyTipsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = context.watch<AuthProvider>().user!.username;
    List<Tip> myTips = context
        .watch<TipsProvider>()
        .tipsList
        .where((tip) => tip.author == user)
        .toList();

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
              itemCount: myTips.length,
              itemBuilder: (context, index) {
                Tip tip = myTips[index];
                return TipCard(tip: tip, user: user);
              },
            );
          },
        );
      },
    );
  }
}
