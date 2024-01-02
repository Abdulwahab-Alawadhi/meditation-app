import 'package:flutter/material.dart';
import 'package:meditation_app/models/music.dart';
import 'package:meditation_app/providers/music_medi_provider.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicDetails extends StatefulWidget {
  const MusicDetails({Key? key}) : super(key: key);

  @override
  _MusicDetailsState createState() => _MusicDetailsState();
}

class _MusicDetailsState extends State<MusicDetails> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meditation music"),
        elevation: 10,
        // backgroundColor: Colors.red,
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
              return Padding(
                padding: const EdgeInsets.all(20),
                child: ListView.builder(
                  itemCount:
                      context.watch<MusicMediProvider>().musicTracks.length,
                  itemBuilder: (context, index) {
                    Music music =
                        context.watch<MusicMediProvider>().musicTracks[index];

                    return Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Card(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(music.title!),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    bool addedToFavorites = context
                                        .read<MusicMediProvider>()
                                        .addToFavorites(music.id);

                                    final snackBar = SnackBar(
                                      content: Text(addedToFavorites
                                          ? 'Track ${music.id} has been added to favs'
                                          : 'Something went wrong!'),
                                    );

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                  icon: Icon(Icons.favorite),
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (_isPlaying) {
                                      _audioPlayer.stop();
                                      setState(() {
                                        _isPlaying = false;
                                      });
                                    }
                                  },
                                  icon: Icon(Icons.stop),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              title: Text('Play Music'),
                              children: [
                                ListTile(
                                  title: Text('Play'),
                                  onTap: () {
                                    _playMusic(music.file!);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _playMusic(url) {
    if (_isPlaying) {
      _audioPlayer.stop();
    }
    _audioPlayer.play(url);
    setState(() {
      _isPlaying = true;
    });
  }
}
