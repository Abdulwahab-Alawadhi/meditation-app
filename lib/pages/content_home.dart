import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContentHome extends StatelessWidget {
  const ContentHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CardList(),
      ),
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
        imageUrl:
            "data:image/jpeg;base64,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",
        route: '/tips'),
    CardData(
        title: 'Exercise',
        imageUrl:
            "https://i0.wp.com/www.yogabasics.com/yogabasics2017/wp-content/uploads/2021/07/Yoga-for-exercise.jpeg?fit=1080720&ssl=1",
        route: '/exercise'),
    CardData(
        title: 'Music',
        imageUrl:
            "https://www.lovejoyandwonder.com/wp-content/uploads/2019/07/meditate-with-music-770x515.jpg",
        route: '/music'),
    CardData(
        title: 'Meditation',
        imageUrl: "https://example.com/image4.jpg",
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

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
