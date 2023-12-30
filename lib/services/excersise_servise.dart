import 'package:meditation_app/models/excersise.dart';
import 'package:meditation_app/models/tips.dart';
import 'package:meditation_app/services/client.dart';

class ExcerciseService {
  Future<List<ExcersiseList>> getExcercise() async {
    try {
      final responseValue = await Client.get("/exercises");
      if (responseValue.statusCode == 200) {
        final List<ExcersiseList> listofexercises =
            List.from(responseValue.data)
                .map((e) => ExcersiseList.fromJson(e))
                .toList();
        return listofexercises;
      }
    } catch (e) {
      throw e.toString();
    }
    return [];
  }
}
