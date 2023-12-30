import 'package:flutter/material.dart';
import 'package:meditation_app/models/tips.dart';
import 'package:meditation_app/services/tips_services.dart';

class TipsProvider extends ChangeNotifier {
  List<ListTips> tipsList = [];
  final TipsService _tipsService = TipsService();

  Future<List<ListTips>> gettingTips() async {
    try {
      tipsList = await _tipsService.getTips();
      notifyListeners();
      return tipsList;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<ListTips>> Tips() async {
    try {
      tipsList = await _tipsService.getTips();
      notifyListeners();
      return tipsList;
    } catch (e) {
      throw e.toString();
    }
  }
}
