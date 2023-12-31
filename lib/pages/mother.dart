import 'package:flutter/material.dart';
import 'package:meditation_app/pages/favoritesPage.dart';
import 'package:meditation_app/pages/content_home.dart';
import 'package:meditation_app/pages/profilePage.dart';
import 'package:provider/provider.dart';

class MotherPage extends StatefulWidget {
  MotherPage({Key? key}) : super(key: key);

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

  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meditation App',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(_isDarkMode ? Icons.brightness_7 : Icons.brightness_3),
            onPressed: () {
              setState(() {
                _isDarkMode = !_isDarkMode;
              });
              _setTheme(_isDarkMode);
            },
          ),
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
    );
  }

  void _setTheme(bool isDarkMode) {
    ThemeData currentTheme = Theme.of(context);

    ThemeData newTheme = ThemeData(
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
    );

    ThemeMode themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;

    context.read<ThemeProvider>().setTheme(newTheme, themeMode);
  }
}

class ThemeProvider extends ChangeNotifier {
  late ThemeData _currentTheme;
  late ThemeMode _currentThemeMode;

  ThemeProvider(
      {required ThemeData initialTheme, required ThemeMode initialThemeMode}) {
    _currentTheme = initialTheme;
    _currentThemeMode = initialThemeMode;
  }

  ThemeData get currentTheme => _currentTheme;
  ThemeMode get currentThemeMode => _currentThemeMode;

  void setTheme(ThemeData newTheme, ThemeMode newThemeMode) {
    _currentTheme = newTheme;
    _currentThemeMode = newThemeMode;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(
        initialTheme: ThemeData.light(),
        initialThemeMode: ThemeMode.light,
      ),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.watch<ThemeProvider>().currentTheme,
      darkTheme: ThemeData.dark(),
      themeMode: context.watch<ThemeProvider>().currentThemeMode,
      home: MotherPage(),
    );
  }
}
