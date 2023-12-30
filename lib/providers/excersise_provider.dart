import 'package:flutter/material.dart';
import 'package:meditation_app/models/excersise.dart';
import 'package:meditation_app/models/tips.dart';
import 'package:meditation_app/services/excersise_servise.dart';
import 'package:meditation_app/services/tips_services.dart';

class ExcercisesProvider extends ChangeNotifier {
  List<ExcersiseList> exercisesList = [];
  final ExcerciseService _exercisesService = ExcerciseService();

  Future<List<ExcersiseList>> gettingExcercise() async {
    try {
      exercisesList = await _exercisesService.getExcercise();
      notifyListeners();
      return exercisesList;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<ExcersiseList>> posttingExcercise() async {
    try {
      exercisesList = await _exercisesService.getExcercise();
      notifyListeners();
      return exercisesList;
    } catch (e) {
      throw e.toString();
    }
  }

  getExcercise() {}
}
