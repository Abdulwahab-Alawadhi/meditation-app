import 'package:meditation_app/models/meditation.dart';
import 'package:meditation_app/models/music.dart';
import 'package:meditation_app/services/client.dart';

class MusicMediService {
  Future<List<Music>> getMusic() async {
    List<Music> musicTracks = [];
    try {
      var res = await Client.dio.get('/music');
      musicTracks =
          (res.data as List).map((music) => Music.fromJson(music)).toList();
      print(musicTracks);
    } catch (e) {
      print(e);
    }
    return musicTracks;
  }

  //
  Future<List<Meditation>> getMeditation() async {
    List<Meditation> mediSessions = [];
    try {
      var res = await Client.dio.get('/meditation');
      mediSessions =
          (res.data as List).map((medi) => Meditation.fromJson(medi)).toList();
      print(mediSessions);
    } catch (e) {
      print(e);
    }
    return mediSessions;
  }
}
