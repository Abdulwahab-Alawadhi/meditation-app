// import 'package:flutter/material.dart';

// class ContentHome extends StatelessWidget {
//   const ContentHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       ),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContentHome extends StatelessWidget {
  const ContentHome({super.key});

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
  final IconData icon;
  final String route;

  CardData({required this.title, required this.icon, required this.route});
}

class CardList extends StatelessWidget {
  final List<CardData> cards = [
    CardData(title: 'Card 1', icon: Icons.star, route: 'signin'),
    CardData(title: 'Card 2', icon: Icons.favorite, route: '/card2'),
    CardData(title: 'Card 3', icon: Icons.mail, route: '/card3'),
    CardData(title: 'Card 4', icon: Icons.music_note, route: '/card4'),
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
              context.pushNamed(card.route);
            },
            child: CardItem(
              title: card.title,
              icon: card.icon,
            ),
          );
        },
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const CardItem({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(ContentHome());
}
