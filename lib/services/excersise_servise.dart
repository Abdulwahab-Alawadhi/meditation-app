import 'package:meditation_app/models/exercise.dart';
import 'package:meditation_app/services/client.dart';

class ExcerciseService {
  Future<List<Exercise>> getExcercise() async {
    try {
      final responseValue = await Client.get("/exercises");
      if (responseValue.statusCode == 200) {
        final List<Exercise> listofexercises = List.from(responseValue.data)
            .map((e) => Exercise.fromJson(e))
            .toList();
        return listofexercises;
      }
    } catch (e) {
      throw e.toString();
    }
    return [];
  }
}
