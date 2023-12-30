import 'package:meditation_app/models/tips.dart';
import 'package:meditation_app/services/client.dart';

class TipsService {
  Future<List<ListTips>> getTips() async {
    try {
      final responseValue = await Client.get("/tips");
      if (responseValue.statusCode == 200) {
        final List<ListTips> listoftips = List.from(responseValue.data)
            .map((e) => ListTips.fromJson(e))
            .toList();
        return listoftips;
      }
    } catch (e) {
      throw e.toString();
    }
    return [];
  }
}
