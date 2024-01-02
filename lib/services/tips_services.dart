import 'package:dio/dio.dart';
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

  deleteTip(int id) async {
    try {
      final Response response = await Client.delete(
        "/tips/$id",
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  upVote(int id) async {
    try {
      final Response response = await Client.put(
        "/tips/$id/upvote",
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  downVote(int id) async {
    try {
      final Response response = await Client.put(
        "/tips/$id/downvote",
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
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
  
  // Future<Tip> deleteTip({required Tip tip}) async {
  //   late Tip deleteTip;
  //   try {
  //     var response = await Client.dio.delete('/tips', data: tip.toJson());
  //     deleteTip = Tip.fromJson(response.data);
  //   } catch (e) {
  //     print(e);
  //   }
  //   return ;
  // }