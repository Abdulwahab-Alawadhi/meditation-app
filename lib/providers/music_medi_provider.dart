import 'package:flutter/material.dart';
import 'package:meditation_app/models/meditation.dart';
import 'package:meditation_app/models/music.dart';
import 'package:meditation_app/pages/favoritesPage.dart';
import 'package:meditation_app/services/music_medi_service.dart';

class MusicMediProvider extends ChangeNotifier {
  List<Music> musicTracks = [];
  List<Meditation> meditaionSessions = [];
  List<Music> favoriteTracks = [];
  final _musicMediService = MusicMediService();

  Future<void> getMusic() async {
    musicTracks = await _musicMediService.getMusic();
    notifyListeners();
  }

  bool addToFavorites(musicId) {
    Music music = musicTracks.firstWhere((music) => music.id == musicId);

    if (music != null) {
      favoriteTracks.add(music);
      notifyListeners();
      return true;
    }

    return false;
  }

  bool removeFromFavorites(musicId) {
    Music music = musicTracks.firstWhere((music) => music.id == musicId);

    if (music != null) {
      favoriteTracks.remove(music);
      notifyListeners();
      return true;
    }

    return false;
  }

//  bool isFavorite(int trackId) {
//     return favoriteTracks.contains(trackId);
//   }

//   // Function to toggle the favorite state of a track
//   bool toggleFavorite(int trackId) {
//     if (favoriteTracks.contains(trackId)) {
//       favoriteTracks.remove(trackId);
//     } else {
//       favoriteTracks.add(trackId);
//     }
//     notifyListeners();
//     return isFavorite(trackId);
//   }
// }

  Future<void> getMeditation() async {
    meditaionSessions = await _musicMediService.getMeditation();
    notifyListeners();
  }
}
