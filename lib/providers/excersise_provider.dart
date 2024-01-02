import 'package:flutter/material.dart';
import 'package:meditation_app/models/exercise.dart';
import 'package:meditation_app/services/excersise_servise.dart';

class ExcercisesProvider extends ChangeNotifier {
  List<Exercise> exercisesList = [];
  final ExcerciseService _exercisesService = ExcerciseService();

  Future<List<Exercise>> gettingExcercise() async {
    try {
      exercisesList = await _exercisesService.getExcercise();
      notifyListeners();
      return exercisesList;
    } catch (e) {
      throw e.toString();
    }
  }
}
