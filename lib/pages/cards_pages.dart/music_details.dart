import 'package:flutter/material.dart';
import 'package:meditation_app/models/music.dart';
import 'package:meditation_app/providers/music_medi_provider.dart';
import 'package:provider/provider.dart';

class MusicDetails extends StatefulWidget {
  MusicDetails({Key? key}) : super(key: key);

  bool isFav = false;
  @override
  State<MusicDetails> createState() => _MusicDetailsState();
}

class _MusicDetailsState extends State<MusicDetails> {
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
                  //bool isFavorite = context.read<MusicMediProvider>().isFavorite(music.id);
                  return Card(
                    color: Colors.amber,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(music.title!),
                        ),
                        IconButton(
                          onPressed: () {
                            bool addedToFavorites = context
                                .read<MusicMediProvider>()
                                .addToFavorites(music);
                            setState(() {
                              widget.isFav = !widget.isFav;
                            });
                            final snackBar = SnackBar(
                              content: Text(addedToFavorites
                                  ? 'Track ${music.id} has been added to favs'
                                  : 'Something went wrong!'),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: widget.isFav ? Colors.red : Colors.grey,
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





// class MusicDetails extends StatelessWidget {
//   const MusicDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 10,
//         backgroundColor: Colors.red,
//       ),
//       body: FutureBuilder(
//         future: context.read<MusicMediProvider>().getMusic(),
//         builder: (context, AsyncSnapshot snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           return Consumer<MusicMediProvider>(
//             builder: (context, value, child) {
//               return ListView.builder(
//                 itemCount:
//                     context.watch<MusicMediProvider>().musicTracks.length,
//                 itemBuilder: (context, index) {
//                   Music music =
//                       context.watch<MusicMediProvider>().musicTracks[index];

//                   return Card(
//                       child: Row(
//                     children: [
//                       Text(music.title!),
//                     ],
//                   ));
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
