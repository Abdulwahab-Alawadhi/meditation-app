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
      '',
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
        title: Text('Meditation videos'),
        elevation: 10,
        // backgroundColor: Colors.red,
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
                            Text(
                              meditation.title!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 20),
                            ),

                            // Text(meditation.title!)
                          ],
                        ),
                        if (_isDropdownVisible)
                          AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: Icon(
                              _isDropdownVisible
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down,
                            ),
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
                          ),
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
