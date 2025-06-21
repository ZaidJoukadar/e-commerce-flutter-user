import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/Core/Function/Check_internet.dart';
import 'package:e_commerce/Core/class/States_request.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatesRequest, Map>> postData(
      String link_server, Map data) async {
    try {
      if (await check_internet() == true) {
        var response = await http.post(Uri.parse(link_server), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          try {
            Map response_body = jsonDecode(response.body);
            return right(response_body);
          } catch (FormatException) {
            print('Response is not a valid JSON: ${response.body}');
            return left(StatesRequest.failure);
          }
        } else {
          return left(StatesRequest.failure);
        }
      } else {
        return left(StatesRequest.offline);
      }
    } catch (e) {
      print(e);
      print('qwerqewrqer');
      return left(StatesRequest.serverfailure);
    }
  }
}
