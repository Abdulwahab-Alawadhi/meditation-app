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

class CardList extends StatelessWidget {
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
        itemCount: 4, // Number of cards
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Handle the card click here
              context.pushNamed("signin");
            },
            child: CardItem(title: 'Card ${index + 1}', icon: Icons.star),
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
