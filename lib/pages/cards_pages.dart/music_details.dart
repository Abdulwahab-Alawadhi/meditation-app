import 'package:flutter/material.dart';
import 'package:meditation_app/models/music.dart';
import 'package:meditation_app/providers/music_medi_provider.dart';
import 'package:provider/provider.dart';

class MusicDetails extends StatelessWidget {
  const MusicDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder(
        future: context.read<MusicMediProvider>().getMusic(),
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
                    context.watch<MusicMediProvider>().musicTracks.length,
                itemBuilder: (context, index) {
                  Music music =
                      context.watch<MusicMediProvider>().musicTracks[index];

                  return Card(
                      child: Row(
                    children: [
                      Text(music.title!),
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
