import 'package:flutter/material.dart';
import 'package:meditation_app/models/exercise.dart';
import 'package:meditation_app/providers/excersise_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class ExercisesDetails extends StatefulWidget {
  const ExercisesDetails({Key? key}) : super(key: key);

  @override
  _ExercisesDetailsState createState() => _ExercisesDetailsState();
}

class _ExercisesDetailsState extends State<ExercisesDetails> {
  late VideoPlayerController _controller;
  int? _expandedIndex;
  late final String videos = "";
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      videos,
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
        title: Text('Exercises'),
        elevation: 10,
        // backgroundColor: Colors.red,
      ),
      body: FutureBuilder(
        future: context.read<ExcercisesProvider>().gettingExcercise(),
        builder: (context, AsyncSnapshot<List<Exercise>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          final exercisesList = snapshot.data;

          return Padding(
            padding: const EdgeInsets.only(top: 12),
            child: ListView.builder(
              itemCount: exercisesList?.length ?? 0,
              itemBuilder: (context, index) {
                Exercise exercise = exercisesList![index];

                return Padding(
                  padding: const EdgeInsets.only(top: 7, right: 8, left: 8),
                  child: Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(exercise.title ?? 'No Title'),
                          subtitle: Text(
                            exercise.file ?? 'No Title',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (_expandedIndex == index)
                          AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          ),
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                          title: Text('Play Video'),
                          trailing: IconButton(
                            icon: Icon(
                              _expandedIndex == index
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                            ),
                            onPressed: () {
                              setState(() {
                                _expandedIndex =
                                    _expandedIndex == index ? null : index;

                                if (_expandedIndex != null) {
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
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
