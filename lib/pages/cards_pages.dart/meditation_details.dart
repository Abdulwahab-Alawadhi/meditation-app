import 'package:flutter/material.dart';
import 'package:meditation_app/models/exercise.dart';
import 'package:meditation_app/providers/excersise_provider.dart';
import 'package:provider/provider.dart';

class MeditationDetails extends StatelessWidget {
  const MeditationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meditation meow'),
          elevation: 10,
          backgroundColor: Colors.red,
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'Open shopping cart',
              onPressed: () {
                // handle the press
              },
            ),
          ],
        ),
        body: FutureBuilder(
          future: context.read<ExcercisesProvider>().gettingExcercise(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError || snapshot.data == null) {
              return Center(
                child: Text('Error loading exercises + $snapshot'),
              );
            }

            return Consumer<ExcercisesProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount:
                      context.watch<ExcercisesProvider>().exercisesList.length,
                  itemBuilder: (context, index) {
                    Exercise exercises = context
                        .watch<ExcercisesProvider>()
                        .exercisesList[index];

                    return Card(
                      child: ListTile(
                        title: Text(exercises.title ?? ''),
                        // subtitle: Text(exercises.id),
                      ),
                    );
                  },
                );
              },
            );
          },
        ));
  }
}
