import 'package:flutter/material.dart';
import 'package:meditation_app/pages/favoritesPage.dart';
import 'package:meditation_app/pages/content_home.dart';
import 'package:meditation_app/pages/profilePage.dart';

class MotherPage extends StatefulWidget {
  MotherPage({
    super.key,
  });

  @override
  State<MotherPage> createState() => _HomePageState();
}

class _HomePageState extends State<MotherPage> {
  int myIndex = 0;
  List<Widget> widgetList = [
    ContentHome(),
    FavoritePage(),
    ProfilePage(),
    // BookedEvents(),
    // PointsCard(),
    // Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Medititation',
          style: TextStyle(fontFamily: 'Times'),
        ),
        actions: [
          Text('username'),
          IconButton(icon: Icon(Icons.account_circle), onPressed: () {})
        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        elevation: 30,
        unselectedItemColor: Color.fromARGB(255, 145, 144, 144),
        selectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'Profile',
          ),
        ],
      ),
      body: IndexedStack(children: widgetList, index: myIndex),
      //
    );
  }
}
