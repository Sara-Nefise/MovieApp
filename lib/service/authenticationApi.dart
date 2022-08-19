import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/constant/apiConstants.dart';
import 'package:movie_app/model/session_model.dart';
import 'package:movie_app/model/token_model.dart';

class AuthenticationApi {
  var queryparams = {
    'api_key': "ee7fc18c7de75ec9f16cc319e57300a1",
  };
  Future<TokenModel?> getToken() async {
    try {
      var uri = Uri.parse(ApiConstants.requestTokenUrl);

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        TokenModel model = TokenModel.fromJson(jsonDecode(response.body));
        print(model.requestToken);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<sessionModel?> makePostRequest(String? model) async {
    try {
      print('makePostRequest $model');
      final url = Uri.parse(ApiConstants.newSessionUrl);
      final json = jsonEncode(<String, String>{
        'request_token': model ?? '',
      });
      final response = await http.post(
        url,
        body: json,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        sessionModel model = sessionModel.fromJson(jsonDecode(response.body));

        return model;
      }

      print('Status code: ${response.statusCode}');

      print('Body: ${response.body}');
    } catch (e) {
      print(e);
    }
    return null;
  }
}
