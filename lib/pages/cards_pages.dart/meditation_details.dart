import 'package:flutter/material.dart';
import 'package:meditation_app/models/exercise.dart';
import 'package:meditation_app/models/meditation.dart';
import 'package:meditation_app/providers/excersise_provider.dart';
import 'package:meditation_app/providers/music_medi_provider.dart';
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
      ),
      body: FutureBuilder(
        future: context.read<MusicMediProvider>().getMeditation(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Consumer<MusicMediProvider>(
            builder: (context, value, child) {
              return ListView.builder(
                itemCount:
                    context.watch<MusicMediProvider>().meditaionSessions.length,
                itemBuilder: (context, index) {
                  Meditation meditation = context
                      .watch<MusicMediProvider>()
                      .meditaionSessions[index];

                  return Card(
                      child: Row(
                    children: [
                      Text(meditation.title!),
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
