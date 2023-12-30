import 'package:dio/dio.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/services/client.dart';

class AuthServices {
  Future<String> register({required User user}) async {
    late String token;
    /* is a token generated when you're not registered??? 
    No. That's why we used 'late' keyword to declare a variable named 'token' without initializing it immediately.
    'token'will be assign a value inside the 'try' block when the registeration happens */

    try {
      // The code inside the try block is where the actual registration process takes place.

      // Response Handling,
      // If the request is successful, the response is stored in the response variable.
      Response response = await Client.dio.post('/signup', data: user.toJson());
      // Using the Dio client from [client.dart] to send a POST request to the /signup endpoint

      token = response.data[// after the registration process is done
          "token"]; // a 'token' is genrated and stored in the token variable

      // Remember when we register in postman a token gets generated, that's data in response.data
    } catch (error) {
      // if the request failed the code inside 'catch' is executed
      throw error.toString();
    }
    return token;
  }

  Future<String> login({required User user}) async {
    late String token;
    try {
      Response response = await Client.dio.post('/signin', data: user.toJson());
      token = response.data["token"];
    } catch (error) {
      throw error.toString();
    }
    return token;
  }
}
