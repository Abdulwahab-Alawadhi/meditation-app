import 'package:flutter/material.dart';
import 'package:meditation_app/models/music.dart';
import 'package:meditation_app/providers/music_medi_provider.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _HomePageState();
}

class _HomePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MusicMediProvider>(
        builder: (context, musicProvider, child) {
          List<Music> favoriteTracks = musicProvider.favoriteTracks;

          if (favoriteTracks.isEmpty) {
            return Center(
              child: Text('No favorites yet.'),
            );
          }

          return ListView.builder(
            itemCount: favoriteTracks.length,
            itemBuilder: (context, index) {
              Music currentTrack = favoriteTracks[index];

              return Card(
                color: Colors.lightBlue,
                child: ListTile(
                  title: Text(currentTrack.title.toString()),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
