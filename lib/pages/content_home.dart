import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContentHome extends StatelessWidget {
  const ContentHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Cards Example'),
        ),
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
        title: 'cat',
        imageUrl:
            "https://i.natgeofe.com/n/4cebbf38-5df4-4ed0-864a-4ebeb64d33a4/NationalGeographic_1468962_3x2.jpg?w=1638&h=1092",
        route: '/details'),
    CardData(
        title: 'Card 2',
        imageUrl: "https://example.com/image2.jpg",
        route: '/details1'),
    CardData(
        title: 'Card 3',
        imageUrl: "https://example.com/image3.jpg",
        route: '/details2'),
    CardData(
        title: 'Card 4',
        imageUrl: "https://example.com/image4.jpg",
        route: '/details3'),
  ];

  @override
  Widget build(BuildContext context) {
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
