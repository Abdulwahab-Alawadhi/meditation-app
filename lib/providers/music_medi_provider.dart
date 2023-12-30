import 'package:flutter/material.dart';
import 'package:meditation_app/models/meditation.dart';
import 'package:meditation_app/models/music.dart';
import 'package:meditation_app/services/music_medi_service.dart';

class MusicMediProvider extends ChangeNotifier {
  List<Music> musicTracks = [];
  List<Meditation> meditaionSessions = [];
  final _musicMediService = MusicMediService();

  Future<void> getMusic() async {
    musicTracks = await _musicMediService.getMusic();
    notifyListeners();
  }

  Future<void> getMeditation() async {
    meditaionSessions = await _musicMediService.getMeditation();
    notifyListeners();
  }
}
