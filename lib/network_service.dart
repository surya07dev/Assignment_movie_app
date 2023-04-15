// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

class NetworkService {
  String url = "https://hoblist.com/api/movieList";

  static var client = http.Client();

  static const TIME_OUT_DURATION = Duration(seconds: 30);

  Future<dynamic> postRequest(Object param) async {
    try {
      // FormData formData = FormData.fromMap(param);
      final response = await client.post(Uri.parse(url),
          headers: {
            "accept": "application/json",
            "content-type": "application/json",
          },
          body: param);
      return response.body;
    } on SocketException catch (e) {
      print("$e socket wala hai ye");
    } catch (e) {
      print(e);
    }
  }
}

class ResponseData {
  String data;
  int? statusCode;

  ResponseData({required this.data, this.statusCode});
}
