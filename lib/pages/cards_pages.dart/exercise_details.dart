import 'package:flutter/material.dart';
import 'package:meditation_app/models/exercise.dart';
import 'package:meditation_app/models/meditation.dart';
import 'package:meditation_app/providers/excersise_provider.dart';
import 'package:meditation_app/providers/music_medi_provider.dart';
import 'package:provider/provider.dart';

class ExcersisesDetails extends StatelessWidget {
  const ExcersisesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercises'),
        elevation: 10,
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder(
        future: context.read<ExcercisesProvider>().getExcercise(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Consumer<ExcercisesProvider>(
            builder: (context, value, child) {
              return ListView.builder(
                itemCount:
                    context.watch<ExcercisesProvider>().exercisesList.length,
                itemBuilder: (context, index) {
                  Exercise exercise =
                      context.watch<ExcercisesProvider>().exercisesList[index];

                  return Card(
                      child: Row(
                    children: [
                      Text(exercise.title!),
                    ],
                  ));
                },
              );
            },
          );
        },
      ),
    );
  }
}
