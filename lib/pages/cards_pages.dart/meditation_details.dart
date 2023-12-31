import 'package:flutter/material.dart';
import 'package:meditation_app/models/meditation.dart';
import 'package:meditation_app/providers/music_medi_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class MeditationDetails extends StatefulWidget {
  const MeditationDetails({Key? key}) : super(key: key);

  @override
  _MeditationDetailsState createState() => _MeditationDetailsState();
}

class _MeditationDetailsState extends State<MeditationDetails> {
  late VideoPlayerController _controller;
  bool _isDropdownVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
    )..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(meditation.title!),
                          ],
                        ),
                        if (_isDropdownVisible)
                          AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isDropdownVisible = !_isDropdownVisible;
                              if (_isDropdownVisible) {
                                _controller.play();
                              } else {
                                _controller.pause();
                              }
                            });
                          },
                          child: Text(
                              _isDropdownVisible ? 'Hide Video' : 'Show Video'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
