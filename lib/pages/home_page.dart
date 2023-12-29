import 'package:flutter/material.dart';
import 'package:meditation_app/widgets/navbar.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  List<Cuisines> searchResults = [];

//   void onSearchField(String query) {
//     setState(() {
//       if (query.isNotEmpty) {
//         searchResults = Cuisines.menuList
//             .where((dish) =>
//                 dish.cuisineName.toLowerCase().contains(query.toLowerCase()))
//             .toList();
//       } else {
//         searchResults.clear();
//       }
//     });
//   }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blueGrey, Colors.white])),
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        bottomNavigationBar: NavBar(),
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(left: 24.0),
            child: Text(
              "Welcome!",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 25, right: 25),
                  child: SearchBar(
                    leading: Icon(Icons.search),
                    // other arguments
                  ),
                ),
                // if (searchResults.isNotEmpty)
                //   Container(
                //     // width: 400,
                //     // height: 250,
                //     child: Expanded(
                //       child: ListView.builder(
                //         itemCount: searchResults.length,
                //         itemBuilder: (context, index) {
                //           return ListTile(
                //             contentPadding: EdgeInsets.symmetric(
                //                 vertical: 8, horizontal: 28),
                //             leading: ClipRRect(
                //               borderRadius: BorderRadius.circular(8),
                //               child: Image.asset(
                //                 searchResults[index].cuisineImage,
                //                 width: 100,
                //                 height: 60,
                //                 fit: BoxFit.fill,
                //               ),
                //             ),
                //             title: Text(searchResults[index].cuisineName),
                //           );
                //         },
                //       ),
                //     ),
                //   ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Text(
                        "Trending Dishes",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
                // ingredients
                SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  height: 100,
                  child: ListView.builder(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Placeholder();
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Trending Cuisines",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 25,
                        mainAxisSpacing: 30,
                        childAspectRatio: 0.9),
                    padding: EdgeInsets.only(
                        left: 15, right: 15, bottom: 50, top: 10),
                    // This next line does the trick.
                    // scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, i) {
                      return Placeholder();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
