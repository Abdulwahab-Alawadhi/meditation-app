import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPageIndex = 0;

  // List of page widgets
  final List<Widget> pages = [
    //FavTab(),
  ];
//change go route for this page to index
//app bar has glitches
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
              // Use GoRouter to navigate to different pages
              context.pushNamed(_getPageRoute(index));
            });
          },
          indicatorColor: Colors.blueGrey,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.favorite),
              icon: Icon(Icons.favorite_border_outlined),
              label: 'Favorites',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.add),
              icon: Icon(Icons.add_box_outlined),
              label: 'Create',
            ),
          ],
        ),
        body: pages[currentPageIndex],
      ),
    );
  }

  // Function to get the page route based on the index
  String _getPageRoute(int index) {
    switch (index) {
      case 0:
        return 'home'; // Home
      case 1:
        return 'favorites'; // Favorites
      case 2:
        return 'username'; // Create
      default:
        return 'signin';
    }
  }
}




















































// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/Pages/favs.dart';
// import 'package:go_router/go_router.dart';

// class NavBar extends StatefulWidget {
//   const NavBar({super.key});

//   @override
//   State<NavBar> createState() => _NavBarState();
// }

// class _NavBarState extends State<NavBar> {
//   int currentPageIndex = 0;

// //  final List<Widget> pages = [
// //    FavTab(),
// //   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100,
//       height: 100,
//       child: Scaffold(
//         bottomNavigationBar: NavigationBar(
//           onDestinationSelected: (int index) {
//             setState(() {
//               currentPageIndex = index;
//               //context.go('/favorites');
//               //context.go('/');
//             });
//           },
//           indicatorColor: Colors.blueGrey,
//           selectedIndex: currentPageIndex,
//           destinations: const <Widget>[
//             NavigationDestination(
//               selectedIcon: Icon(Icons.home),
//               icon: Icon(Icons.home_outlined),
//               label: 'Home',
//             ),
//             NavigationDestination(
//               selectedIcon: Icon(Icons.favorite),
//               icon: Icon(Icons.favorite_border_outlined),
//               label: 'Favorites',
//             ),
//             NavigationDestination(
//               selectedIcon: Icon(Icons.add),
//               icon: Icon(Icons.add_box_outlined),
//               label: 'Create',
//             ),
//             NavigationDestination(
//                 selectedIcon: Icon(Icons.home),
//                 icon: Icon(Icons.home_outlined),
//                 label: 'Home'),
//           ],
//         ),
//       ),
//     );
//   }
// }
