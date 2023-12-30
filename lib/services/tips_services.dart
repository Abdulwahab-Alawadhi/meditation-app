import 'package:meditation_app/models/tip.dart';
import 'package:meditation_app/services/client.dart';

class TipsService {
  Future<List<Tip>> getTips() async {
    try {
      final responseValue = await Client.get("/tips");
      if (responseValue.statusCode == 200) {
        final List<Tip> listoftips =
            List.from(responseValue.data).map((e) => Tip.fromJson(e)).toList();
        return listoftips;
      }
    } catch (e) {
      throw e.toString();
    }
    return [];
  }

  // get MY TIPS
  // Future<List<Tip>> getMyTips() async {
  //   try {
  //     final responseValue = await Client.get("/tips");
  //     if (responseValue.statusCode == 200) {
  //       final List<Tip> listoftips =
  //           List.from(responseValue.data).map((e) => Tip.fromJson(e)).toList();
  //       List<Tip> myTips = listoftips.where((tip) => tip.author == )
  //       return listoftips;
  //     }
  //   } catch (e) {
  //     throw e.toString();
  //   }
  //   return [];
  // }

  // adding tips function
  Future<Tip> createTip({required Tip tip}) async {
    late Tip newTip;
    try {
      var response = await Client.dio.post('/tips', data: tip.toJson());
      newTip = Tip.fromJson(response.data);
    } catch (e) {
      print(e);
    }
    return newTip;
  }
}
