import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContentHome extends StatelessWidget {
  const ContentHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CardList(),
    );
  }
}

class CardData {
  final String title;
  final String imageUrl; // Change the type to String for the image URL
  final String route;

  CardData({required this.title, required this.imageUrl, required this.route});
}

class CardList extends StatelessWidget {
  final List<CardData> cards = [
    CardData(
        title: 'Community',
        imageUrl: "assets/images/yogapose_Meditation_re_gll0.png",
        route: '/tips'),
    CardData(
        title: 'Exercise',
        imageUrl: "assets/images/undraw_Yoga_re_i5ld.png",
        route: '/exercise'),
    CardData(
        title: 'Music',
        imageUrl: "assets/images/undraw_Meditating_re_aiqa.png",
        route: '/music'),
    CardData(
        title: 'Meditation',
        imageUrl: "assets/images/undraw_Mindfulness_8gqa.png",
        route: '/meditation'),
  ];

  @override
  Widget build(BuildContext context) {
    // context.watch<AuthProvider>().isAuth;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: cards.length, // Number of cards
        itemBuilder: (context, index) {
          CardData card = cards[index];
          return InkWell(
            onTap: () {
              // Navigate to a new page when the card is clicked
              context.push(card.route);
            },
            child: CardItem(
              title: card.title,
              imageUrl: card.imageUrl,
            ),
          );
        },
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  const CardItem({required this.title, required this.imageUrl});

  // @override
  // Widget build(BuildContext context) {
  //   return Card(
  //     elevation: 3,
  //     child: Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         image: DecorationImage(
  //           image: NetworkImage(imageUrl),
  //           fit: BoxFit.fill,
  //         ),
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.end,
  //           children: [
  //             SizedBox(height: 8),
  //             Text(
  //               title,
  //               style: TextStyle(
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.bold,
  //                   color: const Color.fromARGB(255, 0, 0, 0)),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: Colors.white,
          elevation: 3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.scaleDown,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox.expand(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Color.fromARGB(255, 44, 44, 44)
                .withOpacity(0.5), // Add a semi-transparent background
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
