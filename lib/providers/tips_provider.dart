import 'package:flutter/material.dart';
import 'package:meditation_app/models/tip.dart';
import 'package:meditation_app/services/tips_services.dart';

class TipsProvider extends ChangeNotifier {
  List<Tip> tipsList = [];
  final TipsService _tipsService = TipsService();

  Future<List<Tip>> gettingTips() async {
    try {
      tipsList = await _tipsService.getTips();
      // notifyListeners();
      return tipsList;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> createTip({required Tip tip}) async {
    Tip newTip = await _tipsService.createTip(tip: tip);
    tipsList.add(newTip);
    notifyListeners();
  }

  Future<void> deleteTip(int id) async {
    print("Deleting tip with ID: $id");

    try {
      await _tipsService.deleteTip(id);
      tipsList.removeWhere((tip) => tip.id == id);

      print("Tip deleted successfully");
      notifyListeners();
    } catch (e) {
      print("Error deleting tip: $e");
    }
  }
}
