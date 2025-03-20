import 'dart:convert';
import 'package:http/http.dart' as http;

class Crud {
  Future<StatusClasses> postData(String uri, Map<String, dynamic> body,
      Map<String, String> headers, bool toSaveToken) async {
    try {
      if (await checkInternet() == true) {
        var url = Uri.parse(uri);
        var response = await http.post(url, body: body, headers: headers);

        print('Status code: ${response.statusCode}');

        var decodedResponse = json.decode(response.body);

        if (response.statusCode == 200 || response.statusCode == 201) {
          if (toSaveToken == true) {
            var token = decodedResponse['data']['access_token'];
            print('This is the token from API: $token');
            await MyServices().saveStringValue(AppKeys.storeTokenKey, token);
            await MyServices().setConstantToken();
            print('Success: Token saved.');
            return StatusClasses.success;
          } else {
            print('Message: ${decodedResponse['message']}');
            return StatusClasses.success;
          }
        } else {
          print('Error: ${decodedResponse['message']}');
          return StatusClasses.error;
        }
      } else {
        print('No internet connection.');
        return StatusClasses.noInternet;
      }
    } catch (e) {
      print('An error occurred: $e');
      return StatusClasses.error;
    }
  }

  Future<StatusClasses> getData(
      String uri, Map<String, String> headers, bool toSaveToken) async {
    try {
      if (await checkInternet() == true) {
        var url = Uri.parse(uri);
        var response = await http.get(url, headers: headers);

        print('Status code: ${response.statusCode}');

        var decodedResponse = json.decode(response.body);

        if (response.statusCode == 200 || response.statusCode == 201) {
          if (toSaveToken == true) {
            var token = decodedResponse['data']['access_token'];
            print('This is the token from API: $token');
            await MyServices().saveStringValue(AppKeys.storeTokenKey, token);
            await MyServices().setConstantToken();
            print('Success: Token saved.');
            return StatusClasses.success;
          } else {
            print('Message: ${decodedResponse['message']}');
            return StatusClasses.success;
          }
        } else {
          print('Error: ${decodedResponse['message']}');
          return StatusClasses.error;
        }
      } else {
        print('No internet connection.');
        return StatusClasses.noInternet;
      }
    } catch (e) {
      print('An error occurred: $e');
      return StatusClasses.error;
    }
  }

  Future<bool> checkInternet() async {
    // Implement your internet check logic here
    return true; // Example: always return true for demo
  }
}

class StatusClasses {
  static const success = StatusClasses._('success');
  static const error = StatusClasses._('error');
  static const noInternet = StatusClasses._('no_internet');

  final String value;

  const StatusClasses._(this.value);
}

class MyServices {
  Future<void> saveStringValue(String key, String value) async {
    // Implement your logic to save the string value
  }

  Future<void> setConstantToken() async {
    // Implement your logic to set the constant token
  }
}

class AppKeys {
  static const storeTokenKey = 'storeTokenKey';
}
